class CfgPatches
{
    class gsri_zeusmanager
    {
        author="www.gsri.team";
        units[]={};
        weapons[]={};
        requiredVersion=0.1;
        requiredAddons[]={"cba_events"};
    };
};
class CfgFunctions {
    class gsri_zeusmanager {
        class GZM {
            file="\fr\gsri\zeusmanager\functions";
            class initManager { postInit = 1 };
            class help {};
            class handleSummons {};
        };
    };
};
