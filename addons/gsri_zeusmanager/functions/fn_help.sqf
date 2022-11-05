params["_allowedCommands"];

// Setting up commands documentation
private _docs = missionNamespace getVariable ["GSRI_ZeusManager_Docs", createHashMap];
if(count _docs == 0) then {
    _docs set ["request", "STR_GSRI_ZeusManager_docs_request"];
    _docs set ["release", "STR_GSRI_ZeusManager_docs_release"];
    _docs set ["help", "STR_GSRI_ZeusManager_docs_help"];
    _docs set ["promote", "STR_GSRI_ZeusManager_docs_promote"];
    _docs set ["revoke", "STR_GSRI_ZeusManager_docs_revoke"];
    _docs set ["whitelist", "STR_GSRI_ZeusManager_docs_whitelist"];
    missionNamespace setVariable ["GSRI_ZeusManager_Docs", _docs];
};

// A pause is needed so the command recall is displayed before the help lines
sleep 0.1;
systemChat localize "$STR_GSRI_ZeusManager_docs_usage";
{
	systemChat format["   %1 %2", _x, localize (_docs get _x)];
} forEach _allowedCommands;
