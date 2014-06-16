/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Helipad lights
Author: Whiztler
Script version: 1.

Game type: n/a
File: LAF3_helipadLights.sqf
****************************************************************
Create (runway) lights around a circular helipad.

Instructions:

Place a helipad (circle) on the map. in the init put:
null = [this] execVM "Core\LAF3_helipadLights.sqf";

Runway lights that can be used: 
"Land_runway_edgelight"
"Land_runway_edgelight_pYlue_f"
"Land_Flush_Light_green_F"
"Land_Flush_Light_red_F"
"Land_Flush_Light_yellow_F"
****************************************************************/

if (isServer) then { // Executed by the server entity only.
	_hpLight = []; // Define the array.
	_hpLoc = getPos (_this select 0); // get the object's location and alt.
	_rd = 5.75; // Radius. 5.75 creates the light on the edge of the helipad.
	_nr = 8; // nr. of lights to be spawned on the helidpad.
	_sp = 360/_nr; // Define spacing based on the number of objects.

	for "_circle" from 1 to 360 step _sp do { // loop
		_pX = (_hpLoc select 0)+(sin(_circle)*_rd);
		_pY = (_hpLoc select 1)+(cos(_circle)*_rd);
		_oPos = [_pX, _pY, _hpLoc select 2];
		_cLight = createVehicle [ "Land_Flush_Light_green_F", _oPos, [], 0, "CAN_COLLIDE"]; // Create the light
		_cLight modelToWorld _oPos; // Position the light on the helipad.
		_hpLight set [(count _hpLight), _cLight]; // Add the created light to the array.
	};// Close loop when _nr of lights have been created.
}; // Close ifServer