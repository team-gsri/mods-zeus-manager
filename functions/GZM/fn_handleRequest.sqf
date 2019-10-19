// Retreive a Zeus request and launch appropriate function

params["_request"];

// The request string does not include the "zeus" keyword
_array = _request splitString " ";
sleep 0.1;

switch (_array select 0) do {
	case "help": { [] call GZM_fnc_help };
	case "slots" : { [] call GZM_fnc_showSlots };
	case "request" : { [] call GZM_fnc_request };
	case "release" : { [] call GZM_fnc_release };
	case "promote" : {[_array] remoteExecCall ["GZM_fnc_promote", 2] };
	case "revoke" : {[_array] remoteExecCall ["GZM_fnc_revoke", 2] };
	case "whitelist" : { [] remoteExecCall ["GZM_fnc_showWhitelist", 2] };
	default { [] call GZM_fnc_help };
};