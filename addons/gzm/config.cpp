class CfgPatches
{
	class gzm
	{
		name="gzm";
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]={"cba_events"};
		author="[GSRI] Cheitan";
		url="https://www.gsri.team";
	};
};
class CfgFunctions {
	class GZM {
		class GZM {
			file="\gzm\functions";
			class initGZM { postInit = 1 };
			class handleRequest {};
			class help {};
			class request {};
			class release {};
			class promote {};
			class revoke {};
			class showSlots {};
			class showWhitelist {};
			class browseWhitelist {};
			class isAdmin {};
		};
	};
};