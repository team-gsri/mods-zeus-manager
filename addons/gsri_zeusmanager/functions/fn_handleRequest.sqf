// Let the server consider a player's request for a Zeus slot
if!(isServer) exitWith {};

params["_unit"];

// Already assigned to a Zeus slot
if!(isNull (getAssignedCuratorLogic _unit)) exitWith { ["GZM_deniedRequest", "Already assigned to a Zeus slot.", _unit] call CBA_fnc_targetEvent };

// Not whitelisted
private _nameCheck = GZM_WHITELIST get (getPlayerUID _unit);
if(isNil "_nameCheck") exitWith { ["GZM_deniedRequest", "You are not allowed as a Zeus user.", _unit] call CBA_fnc_targetEvent };

// If none of the above, then authorized
private _curator = (createGroup[sideLogic, true]) createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "NONE"];
_unit assignCurator _curator;
[_unit, "Curator"] call BIS_fnc_setUnitInsignia;
["GZM_acceptedRequest", "You have been granted a Zeus slot.", _unit] call CBA_fnc_targetEvent;