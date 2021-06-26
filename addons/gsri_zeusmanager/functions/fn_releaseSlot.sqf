params["_unit"];

private _curator = getAssignedCuratorLogic _unit;
if!(isNull _curator) then {
	[_unit, ""] call BIS_fnc_setUnitInsignia;
	unassignCurator _curator;
	deleteVehicle _curator;
};