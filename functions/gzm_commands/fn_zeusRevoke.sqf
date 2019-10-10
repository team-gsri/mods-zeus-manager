// Remote executed on server only
if!(isServer) exitWith {};
// Allow for admins only
if!(admin remoteExecutedOwner == 2) exitWith { ["Admin command only."] remoteExec ["systemChat", remoteExecutedOwner] };

params["_nameArray"];

// Init name with first array element and removing it
_name = (_nameArray deleteAt 0);

// Compose the final string by adding all other array elements
{ _name = format["%1 %2", _name, _x] } forEach _nameArray;

// Revoke Zeus privilege
_i = GZM_ZEUS_WHITELIST find _name;
if(_i >= 0) then {
	GZM_ZEUS_WHITELIST deleteAt _i;
	call GZM_fnc_zeusUpdateWhitelist;
	[format ["%1 has been removed from the Zeus whitelist.", _name]] remoteExec ["systemChat", remoteExecutedOwner];
} else {
	[format ["%1 not found in the Zeus whitelist.", _name]] remoteExec ["systemChat", remoteExecutedOwner];
};