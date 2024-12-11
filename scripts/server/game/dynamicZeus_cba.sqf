/*
    File: dynamicZeus_cba.sqf
    Description: Dynamically grants Zeus access to players based on their Steam UID using CBA.
*/

// List of UIDs allowed Zeus access
private _zeusUIDs = [
    "76561197984639361", // Numbnuts
    "76561198101839623", // Sasquatch
    "76561198976258425" // Legend
];

// Predefine Zeus group for modules
if (isNil "DynamicZeus_Group") then {
    DynamicZeus_Group = createGroup sideLogic;
};

// Event handler for player connections
["PlayerConnected", {
    params ["_uid"];

    // Check if the player's UID is in the allowed list
    if (_uid in _zeusUIDs) then {
        private _player = (_uid call BIS_fnc_objectFromNetId);
        if (isNull _player) exitWith {
            diag_log format ["[Zeus] Player with UID %1 connected, but could not be found.", _uid];
        };

        // Create Zeus module for the player
        private _curatorModule = DynamicZeus_Group createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "NONE"];
        _curatorModule setVariable ["ownerUID", _uid, true];
        _curatorModule setVariable ["addCuratorEditableObjects", true, true];
        _curatorModule addCuratorEditableObjects [[allMissionObjects ""], true];
        _player assignCurator _curatorModule;

        diag_log format ["[Zeus] Assigned player %1 (%2) to curator module.", name _player, _uid];
    };
}] call CBA_fnc_addEventHandler;
