_l = ["tLayer"] call BIS_fnc_rscLayer; 
_l cutText ["", "BLACK IN", 30];

["<t size='2' color='#93945c'>W O L F P A C K</t><br/><br/><t size='.7' color='#FFFFFF'>Day 03 | Switch Off</t>",0,0,3,12] spawn BIS_fnc_dynamicText;
_getLoadOut = [] execVM "Core\LAF3_loadoutClient.sqf";
waituntil {scriptDone _getLoadOut};

sleep 3; // Loadout finished > pri weapon loaded

if (isServer) then {
	_m = createMarker ["mRV", [3867,17095,0]];
	_m setMarkerSize [1.5, 1.5];
	_m setMarkerShape "ICON";
	_m setMarkerType "mil_triangle";
	_m setMarkerColor "ColorWEST";
	_m setMarkerDir 0;
	_m setMarkerText "RV";
};

while {time < 25} do {
	if !(isNil "Wolf_1_SSC") then {Wolf_1_SSC assignAsCargo vWolf_1; Wolf_1_SSC moveInCargo vWolf_1;}; sleep 0.05;
	if !(isNil "Wolf_1_RM") then {Wolf_1_RM assignAsDriver vWolf_1; Wolf_1_RM moveInDriver vWolf_1;}; sleep 0.05;
	if !(isNil "Wolf_1_UAV") then {Wolf_1_UAV assignAsGunner vWolf_1; Wolf_1_UAV moveInGunner vWolf_1;}; sleep 0.05;
	if !(isNil "Wolf_1_RMM") then {Wolf_1_RMM assignAsCargo vWolf_1; Wolf_1_RMM moveInCargo vWolf_1;}; sleep 0.05;

	if !(isNil "Wolf_2_RTL") then {Wolf_2_RTL assignAsCargo vWolf_2; Wolf_2_RTL moveInCargo vWolf_2;}; sleep 0.05;
	if !(isNil "Wolf_2_RS_1") then {Wolf_2_RS_1 assignAsDriver vWolf_2; Wolf_2_RS_1 moveInDriver vWolf_2;}; sleep 0.05;
	if !(isNil "Wolf_2_RS_2") then {Wolf_2_RS_2 assignAsGunner vWolf_2; Wolf_2_RS_2 moveInGunner vWolf_2;}; sleep 0.05;
	if !(isNil "Wolf_2_RS_3") then {Wolf_2_RS_3 assignAsCargo vWolf_2; Wolf_2_RS_3 moveInCargo vWolf_2;}; sleep 0.05;

	if !(isNil "Wolf_2_DEM") then {Wolf_2_DEM assignAsDriver vWolf_3; Wolf_2_DEM moveInDriver vWolf_3;}; sleep 0.05;
	if !(isNil "Wolf_3_RTL") then {Wolf_3_RTL assignAsCargo vWolf_3; Wolf_3_RTL moveInCargo vWolf_3;}; sleep 0.05;
	if !(isNil "Wolf_3_RS_1") then {Wolf_3_RS_1 assignAsGunner vWolf_3; Wolf_3_RS_1 moveInGunner vWolf_3;}; sleep 0.05;
	if !(isNil "Wolf_3_RS_2") then {Wolf_3_RS_2 assignAsCargo vWolf_3; Wolf_3_RS_2 moveInCargo vWolf_3;}; sleep 0.05;

	if !(isNil "Wolf_3_RS_3") then {Wolf_3_RS_3 assignAsDriver vWolf_4; Wolf_3_RS_3 moveInDriver vWolf_4;}; sleep 0.05;
	if !(isNil "Wolf_3_AT") then {Wolf_3_AT assignAsGunner vWolf_4; Wolf_3_AT moveInGunner vWolf_4;};
};

tthint = false;
tt1 = 0; tt2 = 0; tt3 = 0;
commtwr = 0;

hint parseText"
	<t color='#A1A4AD' align='left'>DEVGRU: Commander, call signs are as follows:<br/><br/>DEVGRU TOC: </t><t color='#FFFFFF' align='left'>Eagle Eye</t><br /><t color='#A1A4AD' align='left'>Your call sign: </t><t color='#FFFFFF' align='left'>Eightball</t>
";

sleep 10;

hint parseText"
	<t color='#A1A4AD' align='left'>Eagle Eye: Eightball, move to the </t><t color='#FFFFFF' align='left'>RV </t><t color='#A1A4AD' align='left'>and meet up with Nikko. He'll brief you re your orders.</t>
";
sleep 10;
hint parseText"<t color='#A1A4AD' align='left'>Eagle Eye: Nikko will bring extra supplies and radios. Your backpacks should carry land weapons/supplies.</t>";

sleep 60;
hint parseText"<t color='#A1A4AD' align='left'>Eagle Eye: We have supplied your team with LRI Tagging stickers. The stickers can be attached to targets for long-range strike capability. Nikko will fill you in.</t>";

_c 	= []; _v1 = []; _v2 = [];

if (isServer) then { 
	// Naval Patrols
	_c = createGroup EAST;
	_v1 = [getMarkerPos "mNP1", 0, "O_Boat_Armed_01_hmg_F", _c] call BIS_fnc_spawnVehicle;
	vNP1 = _v1 select 0;
	_wp = _c addWaypoint [getMarkerPos "mNP2", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
	_wp = _c addWaypoint [getMarkerPos "mNP3", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
	_wp = _c addWaypoint [getMarkerPos "mNP4", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
	_wp = _c addWaypoint [getMarkerPos "mNP5", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
	_wp = _c addWaypoint [getMarkerPos "mNP6", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
	_wp = _c addWaypoint [getMarkerPos "mNP5", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
	_wp = _c addWaypoint [getMarkerPos "mNP4", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
	_wp = _c addWaypoint [getMarkerPos "mNP3", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
	_wp = _c addWaypoint [getMarkerPos "mNP2", 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
	sleep 0.5;
	_c = createGroup EAST;
	_v2 = [getMarkerPos "mNP6", 0, "O_Boat_Armed_01_hmg_F", _c] call BIS_fnc_spawnVehicle;
	vNP2 = _v2 select 0;
	_wp = _c addWaypoint [getMarkerPos "mNP5", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
	_wp = _c addWaypoint [getMarkerPos "mNP4", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
	_wp = _c addWaypoint [getMarkerPos "mNP3", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
	_wp = _c addWaypoint [getMarkerPos "mNP2", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
	_wp = _c addWaypoint [getMarkerPos "mNP1", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
	_wp = _c addWaypoint [getMarkerPos "mNP2", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
	_wp = _c addWaypoint [getMarkerPos "mNP3", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
	_wp = _c addWaypoint [getMarkerPos "mNP4", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
	_wp = _c addWaypoint [getMarkerPos "mNP5", 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
	sleep 0.5;
};