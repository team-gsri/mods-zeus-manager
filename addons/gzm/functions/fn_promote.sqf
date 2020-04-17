// Remote executed on server only
if!(isServer) exitWith {};
// Allow for admins only
if!([remoteExecutedOwner] call GZM_fnc_isAdmin) exitWith { ["Admin command only."] remoteExec ["systemChat", remoteExecutedOwner] };

params["_rawString"];

// Remove the "promote" keyword
_rawString deleteAt 0;
if(count _rawString == 0) exitWith { ["No name provided."] remoteExec ["systemChat", remoteExecutedOwner] };

// Compose the full entered name
private _name = (_rawString deleteAt 0);
{ _name = format["%1 %2", _name, _x] } forEach _rawString;

// Check that given name corresponds to a connected player
private _target = objNull;
{
	if(name _x isEqualTo _name) then {_target = _x};
} forEach allPlayers;

// If so, add player to whitelist (if not already)
if(isNull _target) then {
	[format ["%1 has not been found.", _name]] remoteExec ["systemChat", remoteExecutedOwner];
} else {
	if([_name] call GZM_fnc_browseWhitelist >= 0) then { [format ["%1 was already in the Zeus whitelist.", _name]] remoteExec ["systemChat", remoteExecutedOwner] }
	else {
		GZM_ZEUS_WHITELIST pushBack [_name, getPlayerUID _target];
		profileNamespace setVariable ["GZM_ZEUS_WHITELIST", GZM_ZEUS_WHITELIST];
		publicVariable "GZM_ZEUS_WHITELIST";
		saveProfileNamespace;
		[format ["%1 has been added to the Zeus whitelist.", _name]] remoteExec ["systemChat", remoteExecutedOwner];
		["You have been added to the Zeus whitelist."] remoteExec ["systemChat", _target];
	};
};