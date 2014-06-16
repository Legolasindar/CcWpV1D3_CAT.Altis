/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Dynamic Spawned Groups (DSG) - Airborne
Author: Whiztler
Script version: 1.3

Game type: n/a
File: LAF3_DSG-Airborne.sqf
****************************************************************
Instructions:

Below script can be called by a Trigger (e.g. Bluefor present).
When creating more than 1 group, copy and paste the lines from
///// Airborn Group 1
to
Sleep 10; 

****************************************************************/


// Create local vars for all connected clients.
_gCrew 	= []; // Helicopter crew.
_vHeli 	= []; // Helicopter vehicle.
_grp 	= []; // Infantry squad that will be transported by the helicopter.

// Groups and vehicles are created by/on the server and visible for all clients.
if (LAF3_HC_exec == 1) exitWith {}; // Autodetect: execute on the HC else execute on the server
call LAF3_fnc_missionBalance; // call the mission balancer

///// Airborn Group 1
If (LAF3_mb_lite || LAF3_mb_normal || LAF3_mb_heavy) then { // Mission Balancer: Lite, Normal; or Heavy
	// Create the helicopter crew and the helicopter vehicle
	_gCrew = creategroup EAST; // Create the helicopter crew. Faction is this example 'East' (Opfor)
	_vHeli = [
		getMarkerPos "marker1", // create the helicopter vehicle (flying) at "marker1".
		0, // Azimuth
		"O_Heli_Light_02_F", // Classname of the helicopter (see: http://community.bistudio.com/wiki/Arma_3_CfgVehicles_EAST)
		_gCrew // The crew that we created will operate the heli. Arma will only spawn the required crew.
		] call BIS_fnc_spawnVehicle; // The function to create the vehicle with the crew inside.

	// Create waypoints for the helicopter	
	_wp = _gCrew addWaypoint [(getmarkerpos "marker2"), 0]; // Create the first waypoint at "marker2".
	_wp setWaypointType "TR UNLOAD"; // Waypoint type (we'll unload the troops here).
	_wp setWaypointSpeed "NORMAL"; // Waypoint speed.
	_wp setWaypointStatements ["this land 'land';"]; // Waypoint init. Here we order the chopper to land.

	_wp = _gCrew addWaypoint [(getmarkerpos "marker3"), 0]; // Create the second waypoint at "marker3".
	_wp setWaypointType "MOVE"; // Waypoint type. Move to the "marker3" location.
	_wp setWaypointSpeed "FULL"; // Waypoint speed (LIMITED, NORMAL, FULL).

	// Create the infantry group (CSAT Weapons Squad) . They'll spawn right at "marker1".
	_grp = [getMarkerPos "marker1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad_Weapons")] call BIS_fnc_spawnGroup;

	// Create waypoint(s) for the infantry group
	_wp = _grp addWaypoint [getmarkerpos "marker4", 0]; // The heli unload the inf squad at "marker2". The inf squad with then move on foot to "marker4".
	_wp setWaypointType "SAD"; // Waypoint type (Search and Destroy)
	_wp setWaypointSpeed "FULL"; // Waypoint speed.
	_wp setWaypointBehaviour "SAFE"; // Set behaviour
	sleep .5; 

	_grp = _grp; { _x assignAsCargo (_vHeli select 0); _x moveInCargo (_vHeli select 0);} foreach units _grp; // We move the inf group into the heli right after they spawn.
	sleep 10; // When creating more than 1 group, a sleep 1 required to init the first group before creating another. When air vehicles are involved it is recommended to use a longer sleep (10 secs or more) so the aircraft do not collide upon spawning.
};

// Add the Killcounter function:
{
	if(side _x == EAST && _x isKindOf "Man") then {
		_x addEventHandler ["killed", {_this call LAF3_fnc_AddKill}];
	};
} foreach allUnits;	


