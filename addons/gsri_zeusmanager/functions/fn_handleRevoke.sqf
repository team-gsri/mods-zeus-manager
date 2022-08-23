// Remote executed on server only
if!(isServer) exitWith {};

params["_admin","_nickname"];

// Allow for admins only
if!(admin owner _admin == 2) exitWith { ["GZM_deniedRequest", "Admin command only.", _admin] call CBA_fnc_targetEvent };

// Remove the "revoke" keyword
_nickname deleteAt 0;
if(count _nickname == 0) exitWith { ["GZM_deniedRequest", "Missing nickname.", _admin] call CBA_fnc_targetEvent };
if(count _nickname > 1) exitWith { ["GZM_deniedRequest", "Too much arguments, only nickname expected.", _admin] call CBA_fnc_targetEvent };

// Revoke Zeus privilege
private _steamID = "";
{ if(_nickname#0 == _y) exitWith { _steamID = _x } } forEach GZM_WHITELIST;
if(count _steamID <= 0) then {
	["GZM_deniedRequest", "No steamID associated to this nickname.", _admin] call CBA_fnc_targetEvent
};

GZM_WHITELIST deleteAt _steamID;
profileNamespace setVariable ["GZM_WHITELIST", GZM_WHITELIST];
saveProfileNamespace;
["GZM_acceptedRequest", "SteamID has been revoked.", _admin] call CBA_fnc_targetEvent;
private _target = _steamID call BIS_fnc_getUnitByUID;
if!(isNull _target) then {
	["GZM_info", "Your access to Zeus has been revoked.", _target] call CBA_fnc_targetEvent;
};
