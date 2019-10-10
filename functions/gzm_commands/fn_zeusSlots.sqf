systemChat "List of Zeus slots :";
{
	systemChat format ["   %1 : %2", (_x getVariable "Name"), [name getAssignedCuratorUnit _x, "AVAILABLE"] select (isNull (getAssignedCuratorUnit _x))];
} forEach allCurators;