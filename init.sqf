/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Mission init
Author: Whiztler
Script version: 2.20

Game type: n/a
File: init.sqf
****************************************************************/

missionInit = false;

/********** Server Init **********/
if (isServer) then  { //server init
	// add mission data to RPT log
	diag_log text ""; diag_log text ""; diag_log text ""; 
	diag_log text format["[==========]   %1   [==========]", missionName]; // stamp mission name in RPT log
	diag_log text "";
	
	/////  Execute Core Third Party SERVER scripts: (comment out if not applicable)
	[] execVM "Core\TP\delete.sqf"; // garbage collector.
};

/////  Execute Core scripts/params:
if ((paramsArray select 0) == 1) then {acreInc = true} else {acreInc = false;};
if ((paramsArray select 1) == 1) then {ctabInc = true} else {ctabInc = false;};

/**********  Execute Core scripts **********/
//LAF3_HCdetect = ["auto"] execVM "Core\LAF3_HCdetect.sqf"; waitUntil {scriptDone LAF3_HCdetect}; // Headless Client
//execVM "Core\LAF3_loadoutClient.sqf"; // LAF3 Loadout Client.
//execVM "Core\F\LAF3_fnc_missionBalancer.sqf"; // Mission Balancer
execVM "Core\LAF3_civKiaCheck.sqf"; // Civilian KIA checker. Has to be loaded before DCL or MAD
LAF3_killCnt = 0; execVM "Core\LAF3_killCnt.sqf"; // Kill counter for Player Stats/Info
LAF3_killed = 0; 
//LAF3_fnc_respawn = player addEventHandler ["killed", {_this execVM "LAF3_onPlayerRespawn.sqf"}];

/**********  Execute Core Third Party scripts: (comment out if not applicable) **********/
[1, 500, 7] execVM "Core\TP\MADal\MAD_civilians.sqf"; // # Civs / Radius / # wp's
[2, 500, 1000] execVM "Core\TP\MADal\MAD_traffic.sqf";// # Veh / spawn Radius / despawn radius

/**********  Mission specific **********/
//execVM "Core\LAF3_devMenu.sqf"; // Debugging/MM only!	
//[true,10,3,"B_APC_Tracked_01_CRV_F"] execVM "Core\LAF3_MHQ.sqf"; // True = mobile respawn, 10 = time to respawn in minutes, 3 = nr of respawns available (set to 0 for unlimited), MHQ vehicle classname
wpExfil = false;
execVM "Scr\blizzard.sqf";
execVM "Scr\exfil.sqf";
execVM "Scr\init.sqf";
setviewDistance 2000;


/***********************************   DO NOT EDIT BELOW THIS LINE!   **********************************/
 

/**********  Mission Init Briefing **********/
execVM "Scr\LAF3_briefing.sqf"; // Mission Briefing

/********** Core Init Config **********/
player setVariable ["BIS_noCoreConversations",true]; // Disable AI chatter.
allowFunctionsLog = 0;	// Log functions to .rpt. disabled with 0
enableSentences false; // Disable AI chatter.
enableSaving [false,false]; // Disables save when aborting.
enableEngineArtillery false; // Disables BIS arty (map click).
enableTeamSwitch false; // Disables team switch.
[20] execVM "Core\LAF3_missionInit.sqf"; // Nr of secs for mission Init countdown. Should be the last line of the init.sqf