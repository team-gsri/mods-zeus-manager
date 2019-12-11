// Check if privileged commands can be executed.
// This function is runned serverside only.

// This param is retreived with remoteExecutedOwner
params["_clientID"];

// If the whole thing is running locally (eg. testing), just go for it.
if(_clientID == 2) exitWith { true };

// If the distant machine is admin, then go for it.
if(admin _clientID == 2) exitWith { true };

// Else, nope.
false