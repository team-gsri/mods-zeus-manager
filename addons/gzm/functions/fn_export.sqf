// Convert to simple quoted strings
private _simpleQuotesArray = [];
{ _simpleQuotesArray pushBack [format['%1', _x select 0], format['%1', _x select 1]] } forEach GZM_ZEUS_WHITELIST;

// Stringify the new array so it can be exported easier
private _export = str _simpleQuotesArray;

// Exported computed double-quoted string enclosing single-quoted strings
copyToClipboard _export;
systemChat "Whitelist exported to clipboard.";
_export