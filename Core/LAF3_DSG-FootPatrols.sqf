/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Dynamic Spawned Groups (DSG) - Foot Patrols
Author: Whiztler
Script version: 1.2

Game type: n/a
File: LAF3_DSG-FootPatrols.sqf
****************************************************************
This script uses the CBA Task Patrol function. CBA is required!

Instructions:

Place an empty marker on the map and name it marker1. This is where the group spawns.
It also is the centre of the patrol area. Do the same for the markers of the other two
groups: marker2, marker3.
****************************************************************/

// Create local vars for all connected clients:
_grp = []; // Infantry group/section/squad variable

// Groups are created by/on the HC or server and visible for all clients.
if (LAF3_HC_exec == 1) exitWith {}; // Autodetect: execute on the HC else execute on the server
call LAF3_fnc_missionBalance; // call the mission balancer

///// Group 1: 2 pax recon patrol
If (LAF3_mb_lite || LAF3_mb_normal || LAF3_mb_heavy) then { // Mission Balancer: Lite, Normal; or Heavy
	// Create a CSAT Recon Sentry group
	_grp = [
		getMarkerPos "marker1", // "marker1" is the location where the group is created
		EAST, // The side of the group
		(configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry") // See http://community.bistudio.com/wiki/Ambient_Combat_Manager_-_Group_types for different types of groups.
	] call BIS_fnc_spawnGroup; // Function that creates the group

	// Set patrol options
	[
		_grp, // Group variable (does not need to be unique)
		getMarkerPos "marker1", // This is where the group will start patrolling. 
		125, // The radius in meters that determines the patrol size area.
		6, // The number of waypoints generated (use 4 to max 12 for really large areas. 5-7 is a good number.)
		"MOVE", // Waypoint type. ("MOVE", "DESTROY", "SAD", "SENTRY", "GUARD")
		"SAFE", // Behaviour type. ("CARELESS", "SAFE", "AWARE", "COMBAT", "STEALTH")
		"YELLOW", // Combat mode. ("BLUE" (Never fire), "GREEN" (Hold fire - defend only), "WHITE" (Hold fire, engage at will), "YELLOW" (Fire at will), "RED" (Fire at will, engage at will))
		"LIMITED", // Waypoint patrol speed. ("LIMITED", "NORMAL", "FULL")
		"COLUMN", // Patrol formation. ("COLUMN", "STAG COLUMN", "WEDGE", "ECH LEFT", "ECH RIGHT", "VEE", "LINE", "FILE", "DIAMOND")
		"this spawn CBA_fnc_taskSearchHouse", // Units will search houses (does not work afaik)
		[1,4,9]
	] call CBA_fnc_taskPatrol; // Function (CBA) to create the patrol options
	sleep .5; // Procedural sleep
};

///// Group 2: 4 pax fire team "OIA_InfTeam"
If (LAF3_mb_lite) then { // Mission Balancer: Lite only
	_grp = [getMarkerPos "marker2", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[_grp, getMarkerPos "marker2", 150, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
	sleep .5;
};

///// Group 3: 9 pax infantry squad "OIA_InfSquad"
If (LAF3_mb_lite || LAF3_mb_normal) then { // Mission Balancer: Lite or Normal
	_grp = [getMarkerPos "marker3", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	[_grp, getMarkerPos "marker3", 150, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
	sleep .5;
};

// Add the Killcounter function:
{
	if(side _x == EAST && _x isKindOf "Man") then {
		_x addEventHandler ["killed", {_this call LAF3_fnc_AddKill}];
	};
} foreach allUnits;	