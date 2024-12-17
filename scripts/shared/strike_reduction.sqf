/*
    ==============================================================
    Strike Reduction Handler
    ==============================================================
    Author: Legend
    Description:
        - Detects the player responsible for healing civilians.
        - Reduces the player's strike count when they heal a civilian.
        - Sends notifications when strike thresholds are crossed (e.g., 5 → 4).
    ==============================================================
*/

params ["_civ"]; // Civilian that was healed

private _healer = objNull;

// Detect healer using ACE or proximity
if (KP_liberation_ace) then {
    _healer = _civ getVariable ["ace_medical_lastDamageSource", objNull]; // ACE Medical check
} else {
    // Identify nearest player within range
    private _nearestPlayers = allPlayers select {alive _x && (_x distance _civ < 5)};
    if ((count _nearestPlayers) > 0) then {
        _healer = _nearestPlayers select 0;
    };
};

// Process strike reduction if healer is found
if (!isNull _healer && !isNil "playerStrikeCount") then {
    private _healerName = name _healer;
    private _currentStrikes = playerStrikeCount getOrDefault [_healerName, 0];

    if (_currentStrikes > 0) then {
        private _newStrikes = _currentStrikes - 1; // Reduce strike count
        playerStrikeCount set [_healerName, _newStrikes];
        publicVariable "playerStrikeCount"; // Sync strike count

        // Debug log for strike reduction
        if (KP_liberation_civrep_debug > 0) then {
            hint format ["DEBUG: %1's strikes reduced to %2 after healing a civilian.", _healerName, _newStrikes];
        };

        // Notification for 5 → 4 strikes
        if (_currentStrikes == 5 && _newStrikes == 4) then {
            [8, [_healerName]] remoteExec ["KPLIB_fnc_crGlobalMsg"];
        };
    } else {
        // Debug: No strikes to reduce
        if (KP_liberation_civrep_debug > 0) then {
            hint format ["DEBUG: %1 has no strikes to reduce.", _healerName];
        };
    };
};
