// Remote executed on server only
if!(isServer) exitWith {};
// Allow for admins only
if!([remoteExecutedOwner] call GMZ_fnc_isAdmin) exitWith { ["Admin command only."] remoteExec ["systemChat", remoteExecutedOwner] };

params["_nameArray"];

_name = [_nameArray] call GMZ_fnc_getFullName;

// Revoke Zeus privilege
_i = GZM_ZEUS_WHITELIST find _name;
if(_i >= 0) then {
	GZM_ZEUS_WHITELIST deleteAt _i;
	call GZM_fnc_zeusUpdateWhitelist;
	[format ["%1 has been removed from the Zeus whitelist.", _name]] remoteExec ["systemChat", remoteExecutedOwner];
} else {
	[format ["%1 not found in the Zeus whitelist.", _name]] remoteExec ["systemChat", remoteExecutedOwner];
};