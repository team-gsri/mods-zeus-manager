// General init of both server and clients

if(isServer) then {
	GZM_WHITELIST = profileNamespace getVariable ["GZM_WHITELIST", createHashMap];

	["GZM_slotRequested", GZM_fnc_handleRequest] call CBA_fnc_addEventHandler;
	["GZM_slotReleased", GZM_fnc_handleRelease] call CBA_fnc_addEventHandler;
	["GZM_promoteRequested", GZM_fnc_handlePromote] call CBA_fnc_addEventHandler;
	["GZM_revokeRequested", GZM_fnc_handleRevoke] call CBA_fnc_addEventHandler;
	["GZM_whitelistRequested", GZM_fnc_handleWhitelist] call CBA_fnc_addEventHandler;
	addMissionEventHandler ["HandleDisconnect", {
        params ["_unit"];
		[_unit] call GZM_fnc_releaseSlot;
		//Prevent unit from living after player's DC
		false
    }];
};

if!(isDedicated) then {
	// Tracking Zeus commands
	["gzm", GZM_fnc_handleCommand, "all"] call CBA_fnc_registerChatCommand;

	["GZM_deniedRequest", {systemChat ("KO: "+_this)}] call CBA_fnc_addEventHandler;
	["GZM_acceptedRequest", {systemChat ("OK: "+_this)}] call CBA_fnc_addEventHandler;
	["GZM_info", {systemChat ("Info: "+_this)}] call CBA_fnc_addEventHandler;
};
