if!(isServer) exitWith {};

params["_unit"];

if(count GZM_WHITELIST == 0) then {
	["GZM_info", "Whitelist is currently empty.", _unit] call CBA_fnc_targetEvent
} else {
	{ ["GZM_info", format ["SteamID %1, nickname %2.", _x, _y], _unit] call CBA_fnc_targetEvent } forEach GZM_WHITELIST
};
