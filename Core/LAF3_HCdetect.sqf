/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Headless Client Automatic Detection
Author: Elec (Adapted for A3 by Whiztler)
Script version: 1.1

Game type: N/A
File: LAF3_HCdetect.sqf
****************************************************************
Instructions:

Copy the following into your init.sqf:

LAF3_HCdetect = ["auto"] execVM "Core\LAF3_HCdetect.sqf"; // Headless Client
waitUntil {scriptDone LAF3_HCdetect}; 

In your scripts that you use to spawn objects/units, replace

if (!isserver) exitWith {};

with 

if (LAF3_HC_exec == 1) exitWith {}; // Autodetect: execute on the HC else execute on the server
****************************************************************/

LAF3_HC_exec = 0;
LAF3_HC_connected = 0;
_LAF3_HC_init = _this select 0;

//Check if switch is set
if ((_LAF3_HC_init != "on") && (_LAF3_HC_init != "off")) then {

	if (!(isServer) && !(hasInterface)) then {LAF3_HC_connected = 1;
		publicVariable "LAF3_HC_connected";
		
	} else {
	
		if (!isServer) then {LAF3_HC_exec = 1};
		
		sleep 3;
		
		if (LAF3_HC_connected == 0) then {_LAF3_HC_init = "off";} else {_LAF3_HC_init = "on"};
	};
	
	//IF SET TO "on"
	if (_LAF3_HC_init == "on") then {
		if ((isServer) OR (hasInterface)) then {LAF3_HC_exec = 1};
	};
	
	//IF SET TO "off"
	if (_LAF3_HC_init == "off") then {
		if (!isServer) then {LAF3_HC_exec = 1};
	};
	
} else {
	
	//IF SET TO "on"
	if (_LAF3_HC_init == "on") then {		
		if ((isServer) OR (hasInterface)) then {LAF3_HC_exec = 1};
	};
	
	//IF SET TO "off"
	if (_LAF3_HC_init == "off") then {
		if (!isServer) then {LAF3_HC_exec = 1};
	};
};
