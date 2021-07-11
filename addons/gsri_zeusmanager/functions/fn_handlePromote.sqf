// Remote executed on server only
if!(isServer) exitWith {};

params["_admin","_command"];

// Allow for admins only
if!(admin owner _admin == 2) exitWith { ["GZM_deniedRequest", "Admin command only.", _admin] call CBA_fnc_targetEvent };

// Remove the "promote" keyword
_command deleteAt 0;
if(count _command != 2) exitWith { ["GZM_deniedRequest", "Wrong arguments.", _admin] call CBA_fnc_targetEvent };

//TODO wait for regexMatch command to be released in order to sanitize arguments
private _nickname = _command deleteAt 0;
private _steamID = _command # 0;
private _alreadyExists = (GZM_WHITELIST get _steamID);

if!(isNil "_alreadyExists") exitWith {
	["GZM_deniedRequest", "SteamID already whitelisted.", _admin] call CBA_fnc_targetEvent;
};

GZM_WHITELIST set [_steamID, _nickname];
profileNamespace setVariable ["GZM_WHITELIST", GZM_WHITELIST];
saveProfileNamespace;
["GZM_acceptedRequest", "SteamID has been whitelisted.", _admin] call CBA_fnc_targetEvent;
private _target = _steamID call BIS_fnc_getUnitByUID;
if!(isNull _target) then { ["GZM_info", "You have been granted access to Zeus.", _target] call CBA_fnc_targetEvent };