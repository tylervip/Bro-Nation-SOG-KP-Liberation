params ["_unit", "_killer"];

if (isServer) then {

    if (KP_liberation_kill_debug > 0) then {[format ["Kill Manager executed - _unit: %1 (%2) - _killer: %3 (%4)", typeOf _unit, _unit, typeOf _killer, _killer], "KILL"] call KPLIB_fnc_log;};

    // Get Killer, when ACE enabled, via lastDamageSource
    if (KP_liberation_ace) then {
        if (local _unit) then {
            _killer = _unit getVariable ["ace_medical_lastDamageSource", _killer];
            if (KP_liberation_kill_debug > 0) then {["_unit is local to server", "KILL"] call KPLIB_fnc_log;};
        } else {
            if (KP_liberation_kill_debug > 0) then {["_unit is not local to server", "KILL"] call KPLIB_fnc_log;};
            if (isNil "KP_liberation_ace_killer") then {KP_liberation_ace_killer = objNull;};
            waitUntil {sleep 0.5; !(isNull KP_liberation_ace_killer)};
            if (KP_liberation_kill_debug > 0) then {["KP_liberation_ace_killer received on server", "KILL"] call KPLIB_fnc_log;};
            _killer = KP_liberation_ace_killer;
            KP_liberation_ace_killer = objNull;
            publicVariable "KP_liberation_ace_killer";
        };
    };

    // Failsafe if something gets killed before the save manager is finished
    if (isNil "infantry_weight") then {infantry_weight = 33};
    if (isNil "armor_weight") then {armor_weight = 33};
    if (isNil "air_weight") then {air_weight = 33};

    // BLUFOR Killer handling
    if ((side _killer) == GRLIB_side_friendly) then {

        // Increase combat readiness for kills near a capital.
        private _nearby_bigtown = sectors_bigtown select {!(_x in blufor_sectors) && (_unit distance (markerpos _x) < 250)};
        if (count _nearby_bigtown > 0) then {
            combat_readiness = combat_readiness + (0.5 * GRLIB_difficulty_modifier);
            stats_readiness_earned = stats_readiness_earned + (0.5 * GRLIB_difficulty_modifier);
            if (combat_readiness > 100.0 && GRLIB_difficulty_modifier < 2) then {combat_readiness = 100.0};
        };

        // Weights adjustments depending on what vehicle the BLUFOR killer used
        if (_killer isKindOf "Man") then {
            infantry_weight = infantry_weight + 1;
            armor_weight = armor_weight - 0.66;
            air_weight = air_weight - 0.66;
        } else {
            if ((toLower (typeOf (vehicle _killer))) in KPLIB_allLandVeh_classes) then  {
                infantry_weight = infantry_weight - 0.66;
                armor_weight = armor_weight + 1;
                air_weight = air_weight - 0.66;
            };
            if ((toLower (typeOf (vehicle _killer))) in KPLIB_allAirVeh_classes) then  {
                infantry_weight = infantry_weight - 0.66;
                armor_weight = armor_weight - 0.66;
                air_weight = air_weight + 1;
            };
        };

        // Keep within ranges
        infantry_weight = 0 max (infantry_weight min 100);
        armor_weight = 0 max (armor_weight min 100);
        air_weight = 0 max (air_weight min 100);
    };

    // Player was killed
    if (isPlayer _unit) then {
        stats_player_deaths = stats_player_deaths + 1;
        // Disconnect UAV from player on death
        _unit connectTerminalToUAV objNull;
        // Eject Player from vehicle
        if (vehicle _unit != _unit) then {moveOut _unit;};
    };

    // Check for Man or Vehicle
    if (_unit isKindOf "Man") then {

        // OPFOR casualty
        if (side (group _unit) == GRLIB_side_enemy) then {
            // Killed by BLUFOR
            if (side _killer == GRLIB_side_friendly) then {
                stats_opfor_soldiers_killed = stats_opfor_soldiers_killed + 1;
            };

            // Killed by a player
            if (isplayer _killer) then {
                stats_opfor_killed_by_players = stats_opfor_killed_by_players + 1;
            };
        };

        // BLUFOR casualty
        if (side (group _unit) == GRLIB_side_friendly) then {
            stats_blufor_soldiers_killed = stats_blufor_soldiers_killed + 1;

            // Killed by BLUFOR
            if (side _killer == GRLIB_side_friendly) then {
                stats_blufor_teamkills = stats_blufor_teamkills + 1;
            };
        };

        // Resistance casualty
        if (side (group _unit) == GRLIB_side_resistance) then {
            KP_liberation_guerilla_strength = KP_liberation_guerilla_strength - 1;
            stats_resistance_killed = stats_resistance_killed + 1;

            // Resistance is friendly to BLUFOR
            if ((GRLIB_side_friendly getFriend GRLIB_side_resistance) >= 0.6) then {

                // Killed by BLUFOR
                if (side _killer == GRLIB_side_friendly) then {
                    if (KP_liberation_asymmetric_debug > 0) then {[format ["Guerilla unit killed by: %1", name _killer], "ASYMMETRIC"] call KPLIB_fnc_log;};
                    [3, [(name _unit)]] remoteExec ["KPLIB_fnc_crGlobalMsg"];
                    stats_resistance_teamkills = stats_resistance_teamkills + 1;
                    [KP_liberation_cr_resistance_penalty, true] spawn F_cr_changeCR;
                };

                // Killed by a player
                if (isplayer _killer) then {
                    stats_resistance_teamkills_by_players = stats_resistance_teamkills_by_players + 1;
                };
            };
        };

        // Civilian casualty
        if (side (group _unit) == GRLIB_side_civilian) then {
            stats_civilians_killed = stats_civilians_killed + 1;

            // Killed by BLUFOR
            if (side _killer == GRLIB_side_friendly) then {
                if (KP_liberation_civrep_debug > 0) then {[format ["Civilian killed by: %1", name _killer], "CIVREP"] call KPLIB_fnc_log;};
                [2, [(name _unit), name _killer]] remoteExec ["KPLIB_fnc_crGlobalMsg"];
                [KP_liberation_cr_kill_penalty, true] spawn F_cr_changeCR;
            };

            // Killed by a player
            if (isPlayer _killer) then {
                stats_civilians_killed_by_players = stats_civilians_killed_by_players + 1;

                // Initialize or update strike count
                if (isNil "playerStrikeCount") then {
                    playerStrikeCount = createHashMap;
                    publicVariable "playerStrikeCount";
                };

                private _killerName = name _killer;
                private _currentStrikes = playerStrikeCount getOrDefault [_killerName, 0];

                // Reset logic if player was killed by bombers
                if (_killer getVariable ["diedToBombers", false]) then {
                    if (KP_liberation_civrep_debug > 0) then {
                        hint format ["DEBUG: Resetting strikes for %1 after bomber death.", _killerName];
                    };
                    _currentStrikes = 0;
                    playerStrikeCount set [_killerName, _currentStrikes];
                    _killer setVariable ["diedToBombers", false, true];
                    publicVariable "playerStrikeCount";
                };

                _currentStrikes = _currentStrikes + 1;
                playerStrikeCount set [_killerName, _currentStrikes];
                publicVariable "playerStrikeCount";

                // Debug: Print current strikes
                if (KP_liberation_civrep_debug > 0) then {
                    hint format ["DEBUG: %1 now has %2 civilian kills.", _killerName, _currentStrikes];
                };

                // Notifications for 2, 4, and 5 strikes
                if (_currentStrikes == 2) then {
                    [6, [_killerName]] remoteExec ["KPLIB_fnc_crGlobalMsg"];
                };
                if (_currentStrikes == 4) then {
                    [7, [_killerName]] remoteExec ["KPLIB_fnc_crGlobalMsg"];
                };
                if (_currentStrikes == 5) then {
                    if (KP_liberation_civrep_debug > 0) then {
                        hint format ["DEBUG: Action triggered for 5 civilian kills by %1.", _killerName];
                    };

                    private _spawnBombers = {
                        private _target = _this select 0;

                        while {
                            alive _target &&
                            {_target getVariable ["diedToBombers", false] == false} &&
                            {playerStrikeCount get (name _target) == 5} &&
                            {isPlayer _target}
                        } do {
                            for "_i" from 1 to 2 do {
                                private _spawnPos = _target getPos [200, random 360];
                                private _bomberGroup = createGroup civilian;

                                private _bomber = _bomberGroup createUnit [
                                    selectRandom [
                                        "vn_c_men_01", "vn_c_men_02", "vn_c_men_03", "vn_c_men_04", "vn_c_men_05",
                                        "vn_c_men_06", "vn_c_men_07", "vn_c_men_08", "vn_c_men_09", "vn_c_men_10",
                                        "vn_c_men_11", "vn_c_men_12", "vn_c_men_13", "vn_c_men_14", "vn_c_men_15",
                                        "vn_c_men_16", "vn_c_men_17", "vn_c_men_18", "vn_c_men_19", "vn_c_men_20",
                                        "vn_c_men_21", "vn_c_men_22", "vn_c_men_23", "vn_c_men_24", "vn_c_men_25",
                                        "vn_c_men_26", "vn_c_men_27", "vn_c_men_28", "vn_c_men_29", "vn_c_men_30",
                                        "vn_c_men_31", "vn_c_men_32"
                                    ],
                                    _spawnPos,
                                    [], 0, "CAN_COLLIDE"
                                ];

                                _bomber setBehaviour "CARELESS";
                                _bomber enableAI "MOVE";
                                _bomber setVariable ["targetPlayer", _target, true];

                                private _explosive = "SatchelCharge_Remote_Ammo" createVehicle (getPos _bomber);
                                _explosive attachTo [_bomber, [0, 0.15, 0.15], "Pelvis"];
                                _explosive setVectorDirAndUp [[1, 0, 0], [0, 1, 0]];

                                [_bomber, _target] spawn {
                                    private _bomber = _this select 0;
                                    private _target = _this select 1;

                                    private _startTime = time;
                                    while {alive _bomber && alive _target} do {
                                        _bomber doMove (getPos _target);
                                        sleep 0.5;

                                        // Check proximity and detonate
                                        if ((getPos _bomber distance getPos _target) < 5) then {
                                            _bomber setDamage 1; // Kill bomber
                                            createVehicle ["Bo_GBU12_LGB", getPos _bomber, [], 0, "NONE"];

                                            // Check if player is dead after the explosion
                                            sleep 1; // Short delay to ensure health status is updated
                                            if (!alive _target) then {
                                                // Trigger revenge notification
                                                [9, [name _target]] remoteExec ["KPLIB_fnc_crGlobalMsg"];

                                                // Reset strikes for player
                                                playerStrikeCount set [name _target, 0];
                                                publicVariable "playerStrikeCount";

                                                _target setVariable ["diedToBombers", true, true];
                                            };
                                            break;
                                        };

                                        // Self-detonate if timeout
                                        if ((time - _startTime) > 120) then {
                                            _bomber setDamage 1;
                                            createVehicle ["Bo_GBU12_LGB", getPos _bomber, [], 0, "NONE"];
                                            break;
                                        };
                                    };

                                    if (!alive _bomber) then {
                                        ["Bomber killed; respawning in 5 minutes", "DEBUG"] call KPLIB_fnc_log;
                                    };
                                };
                            };

                            sleep 300; // 5 minutes before respawning bombers
                        };

                        _target setVariable ["diedToBombers", false, true]; // Cleanup
                    };

                    [_killer] spawn _spawnBombers;
                };
            };
        };
    } else {
        // Enemy vehicle casualty
        if ((toLower (typeof _unit)) in KPLIB_o_allVeh_classes) then {
            stats_opfor_vehicles_killed = stats_opfor_vehicles_killed + 1;

            // Destroyed by player
            if (isplayer _killer) then {
                stats_opfor_vehicles_killed_by_players = stats_opfor_vehicles_killed_by_players + 1;
            };
        } else {
            // Civilian vehicle casualty
            if (typeOf _unit in civilian_vehicles) then {
                stats_civilian_vehicles_killed = stats_civilian_vehicles_killed + 1;

                // Destroyed by player
                if (isplayer _killer) then {
                    stats_civilian_vehicles_killed_by_players = stats_civilian_vehicles_killed_by_players + 1;
                };
            } else {
                // It has to be a BLUFOR vehicle then
                stats_blufor_vehicles_killed = stats_blufor_vehicles_killed + 1;
            };
        };
    };
} else {
    // Get Killer and send it to server, when ACE enabled, via lastDamageSource
    if (KP_liberation_ace && local _unit) then {
        if (KP_liberation_kill_debug > 0) then {[format ["_unit is local to: %1", debug_source], "KILL"] remoteExecCall ["KPLIB_fnc_log", 2];};
        KP_liberation_ace_killer = _unit getVariable ["ace_medical_lastDamageSource", _killer];
        publicVariable "KP_liberation_ace_killer";
    };
};

// Body/Wreck deletion after cleanup delay
if (isServer && !isplayer _unit) then {
    sleep GRLIB_cleanup_delay;
    hidebody _unit;
    sleep 10;
    deleteVehicle _unit;
};
