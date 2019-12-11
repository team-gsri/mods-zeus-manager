# GSRI Zeus Manager

## What is GSRI Zeus Manager
GZM is an addon providing a set of functions allowing to handle who may become Zeus on your mission, based on a server whitelist instead of through modules owners. You can change who can Zeus you mission, directly from the chat, without updating the mission itself, nor without having to grant admin privileges to them.

With GZM enabled, you can simply place Zeus modules in your mission, and then rely on this access manager to allow some whitelisted players to request access to a curator.

See *How to use these scripts* to get a full description of the manager.

## Rules and standards
The following documents provide additional information on rules and standards applying to this project :

*   [MIT license](../LICENSE.md)
*   [GSRI code of conduct](https://github.com/team-gsri/CodeOfConduct/blob/master/.github/CODE_OF_CONDUCT.md)
*   [Contributing to this project](./CONTRIBUTING.md)

## Credits
This project has been entirely developped from scratch by __[-GSRI-] Cheitan__. If you are willing to submit your modification of the tool as a pull-request, we will be glad to mention your name and work in this section.

## How to use this addon

### Installation
GZM is designed to work relying on some CBA functions. Please make sure you are running [CBA](https://github.com/CBATeam/CBA_A3) before trying to use GZM. Appart from that, GZM can be installed exactly as any other addon/mod.

### Usage
To use GZM on your mission, open it in 3Den, and add as much Zeus modules as wanted. Consider giving them a displayable name under *System specific > Name* in each module properties, otherwise GZM will provide a default name for each unnamed module. Also consider modifying the available extensions for each module. No further setup is required.

Preview your mission **in multiplayer mode** (otherwise you will not have access to the in-game chat). When in-game, open the chat in any channel, and type `#zeus help`. This will display a description for all available GZM commands.

Please mind the fact that the whitelist is stored as a profile variable, and so is the same for all scenarios using GZM on a given server. Consequently, if you have several servers running the same mission, consider registering required players on each one.

Please mind the fact that **only a logged admin can modify the whitelist** through `promote`/`revoke` commands. All other commands are available to non-admin players.

## How to get help
You can ask for support on [our discord server](https://discord.gg/bhMn4jd)