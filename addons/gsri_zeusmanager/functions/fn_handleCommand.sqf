// Retreive a GZM command and raise appropriate event
params["_rawCommand"];

private _command = _rawCommand splitString " ";

switch (_command select 0) do {
	case "request" : { ["GZM_slotRequested", [player]] call CBA_fnc_serverEvent };
	case "release" : { ["GZM_slotReleased", [player]] call CBA_fnc_serverEvent };
	case "promote" : { ["GZM_promoteRequested", [player, _command]] call CBA_fnc_serverEvent };
	case "revoke" : { ["GZM_revokeRequested", [player, _command]] call CBA_fnc_serverEvent };
	case "whitelist" : { ["GZM_whitelistRequested", [player]] call CBA_fnc_serverEvent };
	case "help" : { [] call GZM_fnc_help };
	default { [] call GZM_fnc_help };
};
