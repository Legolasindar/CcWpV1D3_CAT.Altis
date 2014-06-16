/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Mobile Respawn
Author: Whiztler
Script version: 1.2

Game type: COOP
File: LAF3_MHQ.sqf
****************************************************************
This is a basic Mobile HQ script. The script offers various options
to configure in the mission init.sqf:

- Enable the MHQ? (else just a normal vehicle) > TRUE / FALSE
- Respawn delay time > in minutes
- Number of respawns available > Any number greater than zero
- Vehicle classname of the MHQ > default is the BobCat

The player respawn position is attached to the MHQ once the FOB is deployed.
If the MHQ is destroyed the player respawn position is set to the position where the MHQ remained stationary for at least 1 minute. 
If the MHQ is moving then the player respawn is NOT updated to the (moving) MHQ position.

Instructions:
Place a vehicle on the map and name it MHQ.

Edit the parameters in the mission init.sqf ([true,10,3,"B_APC_Tracked_01_CRV_F"] execVM "Core\LAF3_MHQ.sqf";)
****************************************************************/

LAF3_MHQ_debug = false;

// Check if we should run the script at all
MHQ_respawn = _this select 0; // Respawn the MHQ? True of false. Configure in init.sqf
if (!MHQ_respawn) exitWith {}; // Only run the script when the MHQ is set to true in the init.sqf. Else the vehicle is just a standard vehicle.

waitUntil {missionInit}; // wait for the mission to initialize
sleep 6;

// Init
MHQ_orgPos = getPosATL MHQ; // Original spawn position (editor placed)
MHQ_lastPos = MHQ_orgPos; // Init the LastPos postion
MHQ_respawn_time = round ((_this select 1) * 60); // Respawn time in seconds. Set the nr. of MINUTES in the init.sqf
MHQ_respawnCount = _this select 2; // Nr. of times the MHQ is allowed to respawn. Configure in init.sqf
MHQ_vehicle = _this select 3; // The classname of the MHQ vehicle. Configure in init.sqf
MHQ_dir = getDir MHQ;
MHQ_respawnLeft = MHQ_respawnCount;
MHQ_respawned = false;
MHQ_FOB_deployed = false;

_MHQ_EH = MHQ addEventHandler ["killed", {[] spawn LAF3_fnc_MHQ_respawnCount;}];
if (LAF3_MHQ_debug) then {player globalChat "EH loaded onto MHQ";}; // debug
MHQ_FOB_deployAction = MHQ addAction ["<t align='left' color='#CEE5F6'>Deploy the F.O.B.</t>",{[[],"LAF3_fnc_fobDeploy"] call BIS_fnc_MP;},[],-98,false,true,"",""];

// MHQ info message
HintSilent parseText format ["
	<t color='#2E80C6' size='1.5'>Mobile HQ</t><br/><br/>
	<t color='#A1A4AD' align='left'>Mobile HQ (MHQ) is enabled. The MHQ vehicle can deploy a F.O.B. when stationary. Once the F.O.B. is deployed players will respawn at the MHQ.</t><br/><br/>
	<t color='#A1A4AD' align='left'>MHQ respawns available:</t>
	<t color='#FFFFFF' align='right'>%1</t><br/>
	<t color='#A1A4AD' align='left'>MHQ respawn time (min):</t>
	<t color='#FFFFFF' align='right'>%2</t><br/><br/>
	<t color='#A1A4AD' align='left'>Player respawn delay (min):</t>
	<t color='#FFFFFF' align='right'>5</t><br/><br/>
",MHQ_respawnLeft,(MHQ_respawn_time / 60)];

// load the functions
#include "F\LAF3_fnc_MHQ.sqf"
#include "F\LAF3_fnc_FOB.sqf" 
if (LAF3_MHQ_debug) then {player globalChat "Functions loaded"}; // debug

if (!isServer) exitWith {}; // from here on end run on the server only

// Setup inital markers
if (!isNil "respawn_west") then {deleteMarker "respawn_west"}; // remove existing 'respawn_west' marker.

// Create a (new) player respawn marker at the location of the MHQ 
_m = createMarker ["respawn_west",MHQ_orgPos];
_m setMarkerShape "ICON"; 
_m setMarkerType "Empty";

// Create the Bobcat HQ vehicle respawn (respawn_vehicle_west) marker
_m = createMarker ["respawn_vehicle_west",MHQ_orgPos];
_m setMarkerShape "ICON"; 
_m setMarkerType "Empty";	

// Create the 'HQ flag' marker
_m = createMarker ["mMHQ",MHQ_orgPos];
_m setMarkerShape "ICON"; 
_m setMarkerType "b_hq";

// Execute the functions
[] spawn LAF3_fnc_MHQ_LastPos; // Create the last safe MHQ position marker (updated every 10 minutes)
[] spawn LAF3_fnc_MHQ_PlayerRespawnPos; // Attach the respawn_west marker to the Bobcat HQ vehicle (updated every 10 seconds)
[] spawn LAF3_fnc_MHQ_MHQmarker; // Attach the HQ Flag marker to the Bobcat HQ vehicle (updated every half second)


