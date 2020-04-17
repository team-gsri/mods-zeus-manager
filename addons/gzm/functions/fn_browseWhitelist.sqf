// Search the whitelist for a name

params["_name"];
private _position = -1;

// Just check if a player name is in whitelist
{
	if(_x select 0 isEqualTo _name) exitWith { _position = _forEachIndex };
} forEach GZM_ZEUS_WHITELIST;

_position