// Remote executed on server only
if!(isServer) exitWith {};
// Allow for admins only
if!([remoteExecutedOwner] call GZM_fnc_isAdmin) exitWith { ["Admin command only."] remoteExec ["systemChat", remoteExecutedOwner] };

params["_nameArray"];

// Remove the "revoke" keyword
_nameArray deleteAt 0;
if(count _nameArray == 0) exitWith { ["No name provided."] remoteExec ["systemChat", remoteExecutedOwner] };

_name = [_nameArray] call GZM_fnc_getFullName;

// Revoke Zeus privilege
_i = GZM_ZEUS_WHITELIST find _name;
if(_i >= 0) then {
	GZM_ZEUS_WHITELIST deleteAt _i;
	profileNamespace setVariable ["GZM_ZEUS_WHITELIST", GZM_ZEUS_WHITELIST];
	publicVariable "GZM_ZEUS_WHITELIST";
	[format ["%1 has been removed from the Zeus whitelist.", _name]] remoteExec ["systemChat", remoteExecutedOwner];
} else {
	[format ["%1 not found in the Zeus whitelist.", _name]] remoteExec ["systemChat", remoteExecutedOwner];
};