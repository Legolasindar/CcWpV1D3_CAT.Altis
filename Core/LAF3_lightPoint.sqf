/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Ambient lights
Author: Whiztler
Script version: 1.1

Game type: n/a
File: LAF3_lightPoint.sqf
****************************************************************
Create lightpoint to light up objects (inside/outside)

Instructions:

Place an object or game logic on the map and put the following in the init:
null = [this,0.2,0] execVM "Core\LAF3_lightPoint.sqf";

this 	= defines the object that needs the light source. Do not change
0.2		= light brightness. 0.2 for dim light and 1.0 for very bright light
0		= Altitude light position offset from the object

****************************************************************/

#include "LAF3_JIP.sqf"

_h		= _this select 0; // grab the object's name
_b		= _this select 1; // grab brightness
_zPos	= _this select 2; // grab altitude

_hLoc 	= getPosASL _h; // get the location and alt.
_lLoc	= [0,0,_zPos]; // set the light loc offset
_hLight = "#lightpoint" createVehicleLocal _hLoc; // Create the light
_hLight setLightBrightness _b; // light config
_hLight setLightAmbient [1.0, 1.0, 0.5]; // light config
_hLight setLightColor [1.0, 1.0, 1.0]; // light config	
_hLight setLightUseFlare true; // light config	
_hLight lightAttachObject [_h, _lLoc]; // attach the light to the object
_hLight setPos [getPos _hLight select 0, getPos _hLight select 1,_zPos];
