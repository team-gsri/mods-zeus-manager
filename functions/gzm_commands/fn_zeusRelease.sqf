if(isNull getAssignedCuratorLogic player) then { systemChat "No Zeus slot was assigned to this player."}
else {
	systemChat format ["Unassigned from slot %1", (getAssignedCuratorLogic player) getVariable "Name"];
	[getAssignedCuratorLogic player] remoteExec ["unassignCurator", 2];
};