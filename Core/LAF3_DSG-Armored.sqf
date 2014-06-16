/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Dynamic Spawned Groups (DSG) - Armored
Author: Whiztler
Script version: 1.3

Game type: n/a
File: LAF3_DSG-Armored.sqf
****************************************************************
Instructions:

See LAF3_DSG-Airborne.sqf for information on how to customize.
****************************************************************/

// Create local vars for all connected clients.
_gCrew 	= []; // Vehicle crew.
_vArm 	= []; // Armoured vehicle

if (LAF3_HC_exec == 1) exitWith {}; // Autodetect: execute on the HC else execute on the server
call LAF3_fnc_missionBalance; // call the mission balancer

///// Armored AA/Tank Platoon (multiple vehicles in a group. See: https://community.bistudio.com/wiki/Ambient_Combat_Manager_-_Group_types
If (LAF3_mb_lite || LAF3_mb_normal || LAF3_mb_heavy) then {  // Mission Balancer: Lite, Normal; or Heavy
	_gCrew = createGroup EAST; // Create the vehicle crews. Faction is this example 'East' (Opfor). Arma will spawn crews for each vehicle in the group
	_vArm = [getMarkerPos "marker1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Armored" >> "OIA_TankPlatoon_AA")] call BIS_fnc_spawnGroup; // Spawn a Armored group (4 vehicles)
	_wp = _vArm addWaypoint [getMarkerPos "marker2", 0]; // Create the first waypoint at marker2
	_wp setWaypointType "MOVE"; // Waypoint type. Her e we give the group a move order
	_wp setWaypointBehaviour "AWARE"; // Waypoint behaviour (as of the start of the waypoint)
	_wp setWaypointSpeed "FULL"; 
	_wp setWaypointFormation "COLUMN";

	_wp = _vArm addWaypoint [getMarkerPos "marker3", 0]; // Create the second waypoint at marker3
	_wp setWaypointType "SAD"; // Search And Destroy
	_wp setWaypointBehaviour "COMBAT";
	_wp setWaypointSpeed "FULL";
	_wp setWaypointFormation "DIAMOND";
	Sleep 3;
};

If (LAF3_mb_heavy) then {  // Mission Balancer: only Heavy
	///// Armored - BTR-K Kamysh single vehicle
	_gCrew = createGroup EAST;
	_vArm = [getMarkerPos "marker1", 0, "O_APC_Tracked_02_cannon_F", _gCrew] call BIS_fnc_spawnVehicle;

	_wp = _gCrew addWaypoint [getMarkerPos "marker2", 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "FULL";

	_wp = _gCrew addWaypoint [getMarkerPos "marker3", 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointSpeed "FULL";

	// CBA patrol function. Very easy to use. creates its own waypoints for a dynamic mission effect
	[_gCrew, // Group
	getmarkerpos "marker3", // start location
	1250, // patrol radius
	5, // number of waypoints (try keep below 8)
	"MOVE", // Waypoint type. ("MOVE", "DESTROY", "SAD", "SENTRY", "GUARD")
	"SAFE", // Behaviour type. ("CARELESS", "SAFE", "AWARE", "COMBAT", "STEALTH")
	"RED", // Combat mode. ("BLUE" (Never fire), "GREEN" (Hold fire - defend only), "WHITE" (Hold fire, engage at will), "YELLOW" (Fire at will), "RED" (Fire at will, engage at will))
	"LIMITED", // Waypoint patrol speed. ("LIMITED", "NORMAL", "FULL")
	"", // (Formation not required for single units)
	"", // Leave unchanged
	[3,6,9]] call CBA_fnc_taskPatrol; // min/ave/max wait time at end of each waypoint
	sleep 3;
};

If (LAF3_mb_Normal) then {  // Mission Balancer: only Normal
	///// Armored - MSE-3 Madrid single vehicle
	_gCrew = createGroup EAST;
	_vArm = [getMarkerPos "marker1", 0, "O_APC_Wheeled_02_rcws_F", _gCrew] call BIS_fnc_spawnVehicle;

	_wp = _gCrew addWaypoint [getMarkerPos "marker2", 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "FULL";

	_wp = _gCrew addWaypoint [getMarkerPos "marker3", 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointSpeed "FULL";
	[_gCrew, getmarkerpos "marker3", 200, 5, "MOVE", "AWARE", "RED", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol;
};

// Add the Killcounter function:
{
	if(side _x == EAST && _x isKindOf "Man") then {
		_x addEventHandler ["killed", {_this call LAF3_fnc_AddKill}];
	};
} foreach allUnits;