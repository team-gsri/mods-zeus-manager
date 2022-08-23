// Let the server unassign curator from the player
if!(isServer) exitWith {};

params["_unit"];

if(isNull getAssignedCuratorLogic _unit) exitWith {
	["GZM_deniedRequest", "No Zeus slot is assigned to you.", _unit] call CBA_fnc_targetEvent;
};

[_unit] call GZM_fnc_releaseSlot;
["GZM_acceptedRequest", "You have been unassigned from your Zeus slot.", _unit] call CBA_fnc_targetEvent;
