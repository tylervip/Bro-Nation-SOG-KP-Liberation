/*
    Script: dynamicZeus.sqf
    Description: Dynamically grants Zeus access to players based on their Steam UID.
*/

//UIDs allowed Zeus access
private _zeusUIDs = [
    "76561197984639361", // Numbnuts
    "76561198101839623"  // Sasquatch
];

    private _zeusModule = BN_Zeus; 
    if (isNil "_zeusModule") exitWith {
    diag_log "[Zeus] Specified Zeus module not found!";
};

    addMissionEventHandler ["PlayerConnected", {
        params ["_player", "_uid"];
    
        if (_uid in _zeusUIDs) then {
        _player assignCurator _zeusModule;
        diag_log format ["[Zeus] Player %1 (%2) assigned to Zeus module.", name _player, _uid];
    };
}];
