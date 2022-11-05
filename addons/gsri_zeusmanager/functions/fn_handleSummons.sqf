// Retreive a GZM command and raise appropriate event
if!(isServer) exitWith {};
private _whitelist = profileNamespace getVariable ["GSRI_ZeusManager_Whitelist", createHashMap];
params["_player", "_fullCommand"];
_fullCommand params [
    "_command",
    "_nickname",
    ["_steamID",""]
];

private _answerData = [];

// Player is asking for a Zeus slot
if(_command == "request") exitWith {
    // Check if not already assigned to a Zeus slot
    if!(isNull (getAssignedCuratorLogic _player)) then {
        _answerData = ["STR_GSRI_ZeusManager_answers_alreadyAssigned"];
    } else {
        // Check if whitelisted
        private _nameCheck = _whitelist getOrDefault [getPlayerUID _player, ""];
        if(_nameCheck == "") then {
            _answerData = ["STR_GSRI_ZeusManager_answers_notAllowed"];
        } else {
            // If none of the above, then authorized
            private _curator = (createGroup[sideLogic, true]) createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "NONE"];
            _player assignCurator _curator;
            _answerData = ["STR_GSRI_ZeusManager_answers_granted"];
        };
    };
    ["GSRI_ZeusManager_answered", _answerData, _player] call CBA_fnc_targetEvent;
};

// Player is giving up their Zeus slot
if(_command == "release") exitWith {
    if(isNull getAssignedCuratorLogic _player) then {
        _answerData = ["STR_GSRI_ZeusManager_answers_notAssigned"];
    } else {
        private _curator = getAssignedCuratorLogic _player;
        unassignCurator _curator;
        deleteVehicle _curator;
        _answerData = ["STR_GSRI_ZeusManager_answers_unassigned"];
    };
    ["GSRI_ZeusManager_answered", _answerData, _player] call CBA_fnc_targetEvent;
};

// Admin is promoting someone
if(_command == "promote") exitWith {
    private _nameCheck = _whitelist getOrDefault [_steamID, ""];
    if(_nameCheck != "") then {
        _answerData = ["STR_GSRI_ZeusManager_answers_alreadyWhitelisted", _nameCheck];
    } else { if !(_steamID regexMatch "^[0-9]*") then {
        _answerData = ["STR_GSRI_ZeusManager_answers_invalidSteamid"];
    } else {
        _whitelist set [_steamID, _nickname];
        profileNamespace setVariable ["GSRI_ZeusManager_Whitelist", _whitelist];
        saveProfileNamespace;
        _answerData = ["STR_GSRI_ZeusManager_answers_whitelisted", _nickname];
    }};
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
        _answerData = ["STR_GSRI_ZeusManager_answers_revoked", _nickname];
    } else {
        _answerData = ["STR_GSRI_ZeusManager_answers_steamidNotFound", _nickname];
    };
    ["GSRI_ZeusManager_answered", _answerData, _player] call CBA_fnc_targetEvent;
};

// Admin is requesting the whitelist
if(_command == "whitelist") exitWith {
    if(count _whitelist == 0) then {
        ["GSRI_ZeusManager_answered", ["STR_GSRI_ZeusManager_answers_emptyWhitelist"], _player] call CBA_fnc_targetEvent;
    } else {
        {
            ["GSRI_ZeusManager_answered", ["STR_GSRI_ZeusManager_answers_whitelistEntry", _y, _x], _player] call CBA_fnc_targetEvent;
        } forEach _whitelist;
    };
};

// Admin is exporting the whitelist
if(_command == "export") exitWith {
    [
        "GSRI_ZeusManager_ImportHelper",
        str _whitelist,
        0,
        "server",
        false
    ] call CBA_settings_fnc_set;
    ["GSRI_ZeusManager_answered", ["STR_GSRI_ZeusManager_answers_whitelistExported"], _player] call CBA_fnc_targetEvent;
};

// Admin is importing the whitelist from the helper
if(_command == "import") exitWith {
    private _toImport = parseSimpleArray (["GSRI_ZeusManager_ImportHelper", "server"] call CBA_settings_fnc_get);
    private _replaceWhitelist = ["GSRI_ZeusManager_ImportForcer", "server"] call CBA_settings_fnc_get;
    private _imported = 0;
    if(_replaceWhitelist) then { _whitelist = createHashMap };
    {
        private _nameCheck = _whitelist getOrDefault [_x select 0, ""];
        if((_nameCheck == "") && (_x select 0 regexMatch "^[0-9]*") && !(_x select 1 in values _whitelist)) then {
            _whitelist set [_x select 0, _x select 1];
            _imported = _imported + 1;
        };
    } forEach _toImport;
    profileNamespace setVariable ["GSRI_ZeusManager_Whitelist", _whitelist];
    saveProfileNamespace;
    ["GSRI_ZeusManager_answered", ["STR_GSRI_ZeusManager_answers_whitelistImported", _imported, count _toImport], _player] call CBA_fnc_targetEvent;
};
