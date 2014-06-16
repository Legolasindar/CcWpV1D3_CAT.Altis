/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Teleport
Author: Whiztler
Script version: 1.0

Game type: n/a
File: LAF3_SnipTeleport.sqf
****************************************************************
Map click teleport for when playerpos is disable in desc.ext
****************************************************************/

openMap true; sleep .5;
hintSilent format ["%1, click on a location on the map to teleport...", name vehicle player];
if (isMultiplayer) then {
	onMapSingleClick "if(_alt) then {vehicle player setPos _pos}; onMapSingleClick ' '; true; openMap false; hintSilent format ['%1, you are now at: %2', name vehicle player, getPosATL player];";
} else {
	onMapSingleClick "player setPos _pos; onMapSingleClick ' '; true; openMap false; hint format ['%1, you are now at: %2', name vehicle player, getPosATL player];";
};


