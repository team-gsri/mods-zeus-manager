class CfgPatches
{
	class gsri_zeusmanager
	{
		name="GSRI Zeus Manager";
		author="[GSRI] Cheitan";
		url="https://www.gsri.team";
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]={"cba_events"};
	};
};
class CfgFunctions {
	class GZM {
		class GZM {
			file="\gsri_zeusmanager\functions";
			class initGZM { postInit = 1 };
			class handleCommand {};
			class handleRequest {};
			class handleRelease {};
			class releaseSlot {};
			class handlePromote {};
			class handleRevoke {};
			class help {};
			class handleWhitelist {};
		};
	};
};