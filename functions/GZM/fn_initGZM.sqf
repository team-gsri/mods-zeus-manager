// General init of both server and clients

// Probably irrelevant to store parameters
params["_postInit", "_didJIP"];

if(isServer) then {
	// Broadcast list of allowed Zeus users
	GZM_ZEUS_WHITELIST = profileNamespace getVariable ["GZM_ZEUS_WHITELIST", []];
	publicVariable "GZM_ZEUS_WHITELIST";
};

if!(isDedicated) then {
	// Tracking Zeus commands
	["zeus", {(_this select 0) spawn GZM_fnc_handleRequest}, "all"] call CBA_fnc_registerChatCommand;
};