// Let the player leave its current Zeus slot

if(isNull getAssignedCuratorLogic player) then { systemChat "No Zeus slot was assigned to this player."}
else {
	[player,""] call BIS_fnc_setUnitInsignia;
	systemChat format ["Unassigned from slot %1", (getAssignedCuratorLogic player) getVariable "Name"];
	[getAssignedCuratorLogic player] remoteExec ["unassignCurator", 2];
};