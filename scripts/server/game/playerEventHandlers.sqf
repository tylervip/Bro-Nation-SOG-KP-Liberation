/*
    ============================================================== 
    Player Connection Event Handlers 
    ============================================================== 
    Author: Legend 
    Description: 
        - Manages player strikes during connection and disconnection. 
        - Ensures strike counts are reset upon player disconnects. 
        - Retains strikes on reconnect to prevent bypassing penalties.
    ============================================================== 
*/

// Ensure the global playerStrikeCount is initialized
if (isNil "playerStrikeCount") then {
    playerStrikeCount = createHashMap;
    publicVariable "playerStrikeCount";
    diag_log "[CIVREP] Initialized playerStrikeCount.";
};

// Reset player strikes on disconnect
addMissionEventHandler ["HandleDisconnect", {
    params ["_disconnectedPlayer"];
    private _playerName = name _disconnectedPlayer;

    // Validate player name
    if (isNil "_playerName" || {_playerName == ""}) exitWith {
        diag_log format ["[CIVREP][ERROR] Attempted to reset strikes for an invalid player. Player object: %1", _disconnectedPlayer];
    };

    // Remove strikes
    if (!isNil "playerStrikeCount") then {
        playerStrikeCount delete _playerName; 
        publicVariable "playerStrikeCount";
    };

    // Log to RPT
    diag_log format ["[CIVREP][INFO] %1 disconnected. Strikes reset.", _playerName];
}];

// Handle player reconnect
addMissionEventHandler ["HandleConnect", {
    params ["_connectedPlayer"];
    private _playerName = name _connectedPlayer;

    // Validate player name
    if (isNil "_playerName" || {_playerName == ""}) exitWith {
        diag_log format ["[CIVREP][ERROR] Attempted to process invalid reconnect data. Player object: %1", _connectedPlayer];
    };

    // Retrieve and enforce strikes
    if (!isNil "playerStrikeCount") then {
        private _existingStrikes = playerStrikeCount getOrDefault [_playerName, 0];

        // Log retained strikes
        if (_existingStrikes > 0) then {
            diag_log format ["[CIVREP][INFO] %1 reconnected. Retained strikes: %2.", _playerName, _existingStrikes];
        } else {
            diag_log format ["[CIVREP][INFO] %1 reconnected. No strikes retained.", _playerName];
        };
    };
}];
