// Let the player request a Zeus slot

// Already assigned
if!(isNull (getAssignedCuratorLogic player)) exitWith { systemChat format["Already assigned to slot %1", (getAssignedCuratorLogic player) getVariable "Name"] };

// Not allowed
_nameCheck = [profileName] call GZM_fnc_browseWhitelist;
if(_nameCheck < 0) exitWith { systemChat "You are not allowed as a Zeus user." };

// Name in whitelist but wrong steamID
if!(getPlayerUID player isEqualTo (GZM_ZEUS_WHITELIST select _nameCheck select 1)) exitWith { systemChat "Your steamID cannot be verified." };

{
	if(_x getVariable "Name" != "Admin" and isNull (getAssignedCuratorUnit _x)) exitWith {
		[player, _x] remoteExec ["assignCurator", 2];
		systemChat format ["Assigned to slot %1.", _x getVariable "Name"];
	};

	if(_forEachIndex == count allCurators - 1) then {systemChat "No Zeus slot available."};
} forEach allCurators;