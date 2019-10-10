// Return a fully composed name based on an array of strings

params["_names"];

// Init name with first array element and removing it
_fullName = (_names deleteAt 0);

// Compose the final string by adding all other array elements
{ _fullName = format["%1 %2", _fullName, _x] } forEach _names;

_fullName