/*
    Script: dynamicZeus.sqf
    Description: Dynamically grants Zeus access to players based on their Steam UID.
*/

// UIDs allowed Zeus access
private _zeusUIDs = [
    "76561197984639361", // Numbnuts
    "76561198101839623"  // Sasquatch
];

if (isNil "DynamicZeus_Group") then {
    DynamicZeus_Group = createGroup sideLogic;
};
private _curatorGroup = DynamicZeus_Group;

addMissionEventHandler ["PlayerConnected", {
    params ["_player", "_uid"];
    
    if (_uid in _zeusUIDs) then {
        private _curVarName = format ["%1_Curator", _uid];
        private _curatorObject = missionNamespace getVariable [_curVarName, objNull];

        if (isNull _curatorObject) then {
            _curatorObject = _curatorGroup createUnit ["ModuleCurator_F", [0, 90, 90], [], 0, "NONE"];
            _curatorObject setVariable ["showNotification", false];
            missionNamespace setVariable [_curVarName, _curatorObject];
            diag_log format ["[Zeus] Created curator module for player UID %1.", _uid];
        };

        _player assignCurator _curatorObject;
        diag_log format ["[Zeus] Player %1 (%2) assigned to curator module.", name _player, _uid];
    };
}];
