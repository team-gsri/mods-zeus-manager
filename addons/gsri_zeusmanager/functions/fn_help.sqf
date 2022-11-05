params["_allowedCommands"];

// Setting up commands documentation
private _docs = missionNamespace getVariable ["GSRI_ZeusManager_Docs", createHashMap];
if(count _docs == 0) then {
    _docs set ["request", "get Zeus privileges (if whitelisted)"];
    _docs set ["release", "give up Zeus privileges"];
    _docs set ["help", "display this documentation"];
    _docs set ["promote", "<nickname> <SteamID> : whitelist <SteamID> under <nickname>"];
    _docs set ["revoke", "<nickname> : remove <nickname> from the whitelist"];
    _docs set ["whitelist", "display the content of the current whitelist"];
    missionNamespace setVariable ["GSRI_ZeusManager_Docs", _docs];
};

// A pause is needed so the command recall is displayed before the help lines
sleep 0.1;
systemChat "Usage : #zeus <command> [params], available commands are :";
{
	systemChat format["   %1 : %2", _x, _docs get _x];
} forEach _allowedCommands;
