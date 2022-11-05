// General init of both server and clients

if(isServer) then {
    ["GSRI_ZeusManager_summoned", gsri_zeusmanager_fnc_handleSummons] call CBA_fnc_addEventHandler;

    addMissionEventHandler ["HandleDisconnect", {
        params ["_unit"];
        [_unit] call GZM_fnc_releaseSlot;
        //Prevent unit from living after player's DC
        false
    }];
};

if!(isDedicated) then {
    // Tracking Zeus commands
    ["zeus", {
        // Retreive a GZM command and raise appropriate event
        params["_rawCommand"];
        private _fullCommand = _rawCommand splitString " ";
        private _command = _fullCommand select 0;
        private _allowedCommands = ["request", "release", "help"];
        if([] call BIS_fnc_admin > 1 || isServer) then {
            { _allowedCommands pushBack _x } forEach ["promote", "revoke", "whitelist"];
        };

        // Invalid commands
        if(
            !(_command in _allowedCommands)
            or (_command == "help")
            or (_command == "promote" && count _fullCommand != 3 )
            or (_command == "revoke" && count _fullCommand != 2 )
        ) exitWith {
            [_allowedCommands] spawn gsri_zeusmanager_fnc_help;
        };
        ["GSRI_ZeusManager_summoned", [player, _fullCommand]] call CBA_fnc_serverEvent;
    }, "all"] call CBA_fnc_registerChatCommand;

    ["GSRI_ZeusManager_answered", {_this spawn {sleep 0.1; systemChat _this}}] call CBA_fnc_addEventHandler;
};
