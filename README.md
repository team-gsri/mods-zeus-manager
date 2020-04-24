# GSRI Zeus Manager

## What is GSRI Zeus Manager
GZM is an addon providing a set of functions allowing to handle who may become Zeus on your server.

With GZM enabled, you can simply place empty game master modules in your missions, the mod will handle who may become Zeus.
Authorization is handled at server level instead of mission, and can be updated live without the need for a mission restart.

*   No more copy/paste a pile of curator modules with players id as owners when creating a mission
*   No more mission modification + upload + restart to add/revoke a player's Zeus access
*   No more grant/revoke server admin privileges to zeuses when relying on #adminLogged

See *How to use this addon* to get a full description of the features.

## Rules and standards
The following documents provide additional information on rules and standards applying to this project :

*   [MIT license](../LICENSE.md)

GZM is also avilable on :

*   [Steam Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=1937479604)
*   [Official BI Forums](https://forums.bohemia.net/forums/topic/226163-gsri-zeus-manager/)

## Credits
This project has been entirely developped from scratch by __[-GSRI-] Cheitan__. If you are willing to submit your modification of the tool as a pull-request, we will be glad to mention your name and work in this section.

## How to use this addon

### Requirements
GZM requires [CBA](https://github.com/CBATeam/CBA_A3) to run.
Do not forget to install both mods on your clients and server as well.

### Features
GZM stores a whitelist of players allowed to become [curators](https://community.bistudio.com/wiki/Arma_3_Curator) on the server.
The whitelist is stored in the server [profile](https://community.bistudio.com/wiki/Profile) and is persisted accross missions and server restart.
The authorization process is handled at server level, which means that any whitelisted player may become a curator on *any mission run on this server*, provided there is a slot available.

Each [Game Master module](https://community.bistudio.com/wiki/Arma_3_Module:_Game_Master) with an empty `owner` property is a GZM slot.
Placing 3 modules will allow 3 players to *simultaneously* become curators, but players can release their slot, allowing for more people to become Zeus during a mission.

You may still rely on player id, slot name, and `#adminLogged` features in parallel, GZM will ignore non empty-owned modules.

### Usage
The addon uses in-game chat commands to manage both the whitelist and curator slots assignment:
*   `#zeus help` lists all commands and usage
*   `#zeus whitelist` lists all players in the curator whitelist
*   `#zeus slots` lists all slots and players assigned to them
*   `#zeus [promote|revoke] <player>` adds or removes a player from the curator whitelist
*   `#zeus [request|release]` assigns to or unassigns yourself from a curator slot

### Zeus players
First, ask a server administrator to promote you.
Once promoted, you may use `#zeus request` to become a curator on the mission if there is an empty curator slot.
If you don't need the curator slot anymore, or another player requires it, you can `#zeus release` your slot.

### Mission editors
To use GZM on your mission, simply add modules with empty `owner` property.
Each module will become a free slot which can be taken by a whitelisted player.

Consider giving modules a displayable name under *System specific > Name*.
Otherwise GZM will provide a default name for each unnamed module.
Also consider modifying the available extensions for each module.
No further setup is required.

If you want to use GZM when testing your mission, remember it uses game chat, which is **only available in multiplayer mode**.

### Server owners / admins
[Logged admins](https://community.bistudio.com/wiki/serverCommandAvailable) are the only players allowed to modify the curators whitelist using `#zeus promote` and `#zeus revoke` commands.
Being a logged admin does not grant privilege to become curator by itself, you must add yourself to the whitelist.

To allow players to become logged admins on your server, add their player id to the `admins` property of your [server.cfg file](https://community.bistudio.com/wiki/server.cfg).
All players in this list may become logged admins using the `#login` command in the chat.
Only add trustworthy people to this list, as logged admins can harm your server: `#lock`, `#kick`, `#shutdown` ...

**Sharing profile with multiple server instances is not supported** because BI does not provide a command to reload the profile files.
Using the same profile would provoke confusion and data loss on the whitelist.
If you have multiple servers, you have to manage a separate profile and whitelist on each server.

**Security notes**:
You could also rely on `passwordAdmin` instead of `admins` though this is not recommended: passwords are way easier to steal than steam accounts.
We also strongly recommend players with admin privileges on any server to enable [Steam Guard two-factor authentication](https://support.steampowered.com/kb_article.php?ref=1266-OAFV-8478#steamguard) on their account to prevent unauthorized access.

## How to get help
You can ask for support on [our discord server](https://discord.gg/bhMn4jd)
