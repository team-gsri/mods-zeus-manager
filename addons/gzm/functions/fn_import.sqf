// Import and parse a string based whitelist in format [['name1', 'steamid1'], ['name2', 'steamid2']]
params["_baseArray"];
_baseArray deleteAt 0; //remove "import" keyword
private _candidateWhitelist = parseSimpleArray str (_baseArray joinString " ");

private _numberAdded = 0;
private _numberAborted = 0;
{
	// Check if incoming player is already in whitelist
	private _name  = _x select 0;
	if([_name] call GZM_fnc_browseWhitelist == -1) then {
		systemChat format ["Adding %1 to the whitelist.", _name];
		GZM_ZEUS_WHITELIST pushBack _x;
		_numberAdded = _numberAdded + 1;
	} else {
		systemChat format ["%1 is already in the whitelist.", _name];
		_numberAborted = _numberAborted + 1;
	};
} forEach _candidateWhitelist;

// New global variable must be propagated and saved
publicVariable "GZM_ZEUS_WHITELIST";
[[],{profileNamespace setVariable ["GZM_ZEUS_WHITELIST", GZM_ZEUS_WHITELIST]; saveProfileNamespace;}] remoteExecCall ["call",2];
systemChat format ["Import successful, %1 added, %2 were already whitelisted.", _numberAdded, _numberAborted];