// Remote executed on server only
if!(isServer) exitWith {};
// Allow for admins only
if!([remoteExecutedOwner] call GZM_fnc_isAdmin) exitWith { ["Admin command only."] remoteExec ["systemChat", remoteExecutedOwner] };

params["_rawString"];

// Remove the "revoke" keyword
_rawString deleteAt 0;
if(count _rawString == 0) exitWith { ["No name provided."] remoteExec ["systemChat", remoteExecutedOwner] };

// Compose the full entered name
_name = (_rawString deleteAt 0);
{ _name = format["%1 %2", _name, _x] } forEach _rawString;

// Revoke Zeus privilege
_nameCheck = [_name] call GZM_fnc_browseWhitelist;
if(_nameCheck >= 0) then {
	GZM_ZEUS_WHITELIST deleteAt _nameCheck;
	profileNamespace setVariable ["GZM_ZEUS_WHITELIST", GZM_ZEUS_WHITELIST];
	publicVariable "GZM_ZEUS_WHITELIST";
	saveProfileNamespace;
	[format ["%1 has been removed from the Zeus whitelist.", _name]] remoteExec ["systemChat", remoteExecutedOwner];
} else {
	[format ["%1 not found in the Zeus whitelist.", _name]] remoteExec ["systemChat", remoteExecutedOwner];
};