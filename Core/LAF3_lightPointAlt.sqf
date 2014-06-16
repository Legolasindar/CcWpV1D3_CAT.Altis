#include "LAF3_JIP.sqf"

_h		= _this select 0; // grab the object's name
_b		= _this select 1; // grab brightness
_aPos	= _this select 2; // grab altitude offset from object

_dir	= getDir _h;
_hLoc 	= getPosASL _h; // get the location and alt.
_lLoc	= [0,0,0]; // set the light loc offset

 // create the floodlight
_fl = "Land_FloodLight_F" createVehicleLocal _hloc;

for "_i" from 1 to 2 do { // exec twice do to SetDir bug
	_fl attachto [_h,[0,-0.2,_aPos]];
	_fl setVectorDirAndUp [[1,0,0],[0,-0.9,0]];
};

 // Create the light
_hLight = "#lightpoint" createVehicleLocal _lLoc;
_hLight setLightBrightness _b; // light config
_hLight setLightAmbient [0, 0, 0]; // light config
_hLight setLightColor [1.0, 1.0, 1.0]; // light config	
_hLight lightAttachObject [_fl, _lLoc]; // attach the light to the object
