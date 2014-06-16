/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Show player position (Lat, Lon, Alt ASL & ATL
Author: Whiztler
Script version: 1.1

Game type: n/a
File: LAF3_ShowPosition.sqf
****************************************************************
Instructions:

Create a trigger with the following params:
Axes A = 0
Axes B = 0
Type: none
Activation: Radio Bravo
Repeatedly
On Act.: null = execVM "Core\D\LAF3_ShowPosition.sqf";

In your init.sqf, add the following line:
2 setRadioMsg "Show Position (LAT/LONG/ALT)"; // Debugging/MM only!

In game use 0-0-2 to check your position
****************************************************************/

_me = player;
n = 2; // nr. of decimals with altitude

_posLat = getPos _me select 0;
_posLon = getPos _me select 1;
_posAltASL = getPosASL _me select 2;
_posAltASL = round (_posAltASL * (10 ^ n)) / (10 ^ n);
_posAltATL = getPosATL _me select 2;
_posAltATL = round (_posAltATL * (10 ^ n)) / (10 ^ n);

HintSilent parseText format["
<t size='1.2' color='#ffffff' align='left'>My current position</t><br/><br/>
<t color='#A1A4AD' align='left'>Latitude: </t><t align='left' color='#F7D358'>%1</t><br/>
<t color='#A1A4AD' align='left'>Longitude: </t><t align='left' color='#F7D358'>%2</t><br/><br/>
<t size='1.2' color='#ffffff' align='left'>My current altitude:</t><br/><br/>
<t color='#A1A4AD' align='left'>Above Sea Level (ASL): </t><t align='left' color='#F7D358'>%3</t><br/>
<t color='#A1A4AD' align='left'>Above Ground Level (ATL): </t><t align='left' color='#F7D358'>%4</t><br/><br/>
<t color='#A1A4AD' align='left'>Above data has been copied to your clipboard</t><br/>"
, _posLat, _posLon, _posAltASL, _posAltATL];

_cc = format ["
Position: %1,%2 {lat,lon)
Altitude: %3 (above sea level)
Altitude: %4 (above terrain level)
", _posLat, _posLon, _posAltASL, _posAltATL];

copyToClipboard _cc;