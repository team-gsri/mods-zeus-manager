// Retreive a GZM command and raise appropriate event
if!(isServer) exitWith {};
private _whitelist = profileNamespace getVariable ["GSRI_ZeusManager_Whitelist", createHashMap];
params["_player", "_fullCommand"];
_fullCommand params [
    "_command",
    "_nickname",
    ["_steamID",""]
];

private _answerData = "";

// Player is asking for a Zeus slot
if(_command == "request") exitWith {
    // Check if not already assigned to a Zeus slot
    if!(isNull (getAssignedCuratorLogic _player)) then {
        _answerData = "You are already assigned to a Zeus slot.";
    } else {
        // Check if whitelisted
        private _nameCheck = _whitelist getOrDefault [getPlayerUID _player, ""];
        if(_nameCheck == "") then {
            _answerData = "You are not allowed as a Zeus user.";
        } else {
            // If none of the above, then authorized
            private _curator = (createGroup[sideLogic, true]) createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "NONE"];
            _player assignCurator _curator;
            _answerData = "You have been granted a Zeus slot.";
        };
    };
    ["GSRI_ZeusManager_answered", _answerData, _player] call CBA_fnc_targetEvent;
};

// Player is giving up their Zeus slot
if(_command == "release") exitWith {
    if(isNull getAssignedCuratorLogic _player) then {
        _answerData = "No Zeus slot is assigned to you.";
    } else {
        private _curator = getAssignedCuratorLogic _player;
        unassignCurator _curator;
        deleteVehicle _curator;
        _answerData = "You have been unassigned from your Zeus slot.";
    };
    ["GSRI_ZeusManager_answered", _answerData, _player] call CBA_fnc_targetEvent;
};

// Admin is promoting someone
if(_command == "promote") exitWith {
    private _nameCheck = _whitelist getOrDefault [_steamID, ""];
    if(_nameCheck != "") then {
        _answerData = format["User already whitelisted as %1.", _nameCheck];
    } else {
        _whitelist set [_steamID, _nickname];
        profileNamespace setVariable ["GSRI_ZeusManager_Whitelist", _whitelist];
        saveProfileNamespace;
        _answerData = "SteamID has been whitelisted.";
    };
    ["GSRI_ZeusManager_answered", _answerData, _player] call CBA_fnc_targetEvent;
};

// Admin is revoking someone
if(_command == "revoke") exitWith {
    // Hashes are not reversible, this is a dirty workaround in order to find what key to delete
    { if(_nickname == _y) exitWith { _steamID = _x } } forEach _whitelist;
    if(_steamID != "") then { 
        _whitelist deleteAt _steamID;
        profileNamespace setVariable ["GSRI_ZeusManager_Whitelist", _whitelist];
        saveProfileNamespace;
        _answerData = format["SteamID associated to %1 has been revoked.", _nickname];
    } else {
        _answerData = format["No SteamID associated to %1 has been found.", _nickname];
    };
    ["GSRI_ZeusManager_answered", _answerData, _player] call CBA_fnc_targetEvent;
};

// Admin is requesting the whitelist
if(_command == "whitelist") exitWith {
    if(count _whitelist == 0) then {
        ["GSRI_ZeusManager_answered", "Whitelist is currently empty.", _player] call CBA_fnc_targetEvent;
    } else {
        {
            ["GSRI_ZeusManager_answered", format ["Player %1 : %2.", _y, _x], _player] call CBA_fnc_targetEvent;
        } forEach _whitelist;
    };
};
