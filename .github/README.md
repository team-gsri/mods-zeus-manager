# GSRI Zeus Manager

## What is GSRI Zeus Manager

It is a set of functions designed to rely on CBA custom command registering in order to interact with any Zeus module added in 3Den without having to link them independently.

With GZM enabled, you can simply place Zeus modules in your mission, and then rely on this access manager to allow some whitelisted players to request access to a curator.

See *How to use these scripts* to get a full description of the manager.

## Rules and standards

The following documents provide additional information on rules and standards applying to this project :

*   [Licensing of this project](./LICENSE.md)
*   [GSRI code of conduct](https://github.com/team-gsri/CodeOfConduct/blob/master/.github/CODE_OF_CONDUCT.md)
*   [Contributing to this project](./CONTRIBUTING.md)

## How to use these scripts

### Installation

GZM is designed to work relying on some CBA functions. Please make sure you are running [CBA](https://github.com/CBATeam/CBA_A3) before trying to install GZM.

To install GZM on your mission, copy all of the included files in your mission folder, excepted *mission.sqm*, which is just a demo mission. If your mission folder already contains one or several of the GZM files, make sure to merge them together appropriately, so any content is correctly added to properly named files.

Once the GZM is added, open your mission in 3Den, and add as much Zeus modules as wanted. Consider giving them a displayable name under *System specific > Name* in each module properties. Also consider modifying the available extensions for each module. No further setup is required.

### Usage

Preview your mission **in multiplayer mode** (otherwise you will not have access to the in-game chat). When in-game, open the chat in any channel, and type `#zeus help`. This will display a description for all available GZM commands.

Please mind the fact that the whitelist is stored as a profile variable, and so is the same for all scenarios using GZM on a given server. Consequently, if you have several servers running the same mission, consider registering required players on each one.

Please mind the fact that **only a logged admin can modify the whitelist** through `promote`/`revoke` commands. All other commands are available to non-admin players.

## How to get help

You can ask for support on [our discord server](https://discord.gg/bhMn4jd)