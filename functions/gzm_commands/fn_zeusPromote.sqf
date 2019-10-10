// Remote executed on server only
if!(isServer) exitWith {};
// Allow for admins only
if!([remoteExecutedOwner] call GZM_fnc_canPromote) exitWith { ["Admin command only."] remoteExec ["systemChat", remoteExecutedOwner] };

params["_nameArray"];

// Init name with first array element and removing it
_name = (_nameArray deleteAt 0);

// Compose the final string by adding all other array elements
{ _name = format["%1 %2", _name, _x] } forEach _nameArray;

// Check that given name corresponds to a connected player
_target = objNull;
{
	if(name _x isEqualTo _name) then {_target = _x};
} forEach allPlayers;

// If so, add player to whitelist (if not already)
if(isNull _target) then {
	[format ["%1 has not been found.", _name]] remoteExec ["systemChat", remoteExecutedOwner];
} else {
	if(_name in GZM_ZEUS_WHITELIST) then { [format ["%1 was already in the Zeus whitelist.", _name]] remoteExec ["systemChat", remoteExecutedOwner] }
	else {
		GZM_ZEUS_WHITELIST pushBack _name;
		call GZM_fnc_zeusUpdateWhitelist;
		[format ["%1 has been added to the Zeus whitelist.", _name]] remoteExec ["systemChat", remoteExecutedOwner];
		["You have been added to the Zeus whitelist."] remoteExec ["systemChat", _target];
	};
};