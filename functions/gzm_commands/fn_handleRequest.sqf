// Fonction récupérant une requête Zeus pour la traiter

// Paramètre unique : chaîne de caractères à décomposer
params["_request"];

_array = _request splitString " ";
sleep 0.1;

switch (_array select 0) do {
	case "help": { [] call GZM_fnc_zeusHelp };
	case "slots" : { [] call GZM_fnc_zeusSlots };
	case "request" : { [] call GZM_fnc_zeusRequest };
	case "release" : { [] call GZM_fnc_zeusRelease };
	case "promote" : { _array deleteAt 0; [_array] remoteExecCall ["GZM_fnc_zeusPromote", 2] };
	case "revoke" : { _array deleteAt 0; [_array] remoteExecCall ["GZM_fnc_zeusRevoke", 2] };
	case "list" : { [] remoteExecCall ["GZM_fnc_zeusList", 2] };
	default { [] call GZM_fnc_zeusHelp };
};