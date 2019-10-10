// Take new Zeus whitelist, save it in server's profile namespace, then publicVariable it.
if!(isServer) exitWith {};

profileNamespace setVariable ["GSRI_ZEUS_WHITELIST", GSRI_ZEUS_WHITELIST];
publicVariable "GSRI_ZEUS_WHITELIST";