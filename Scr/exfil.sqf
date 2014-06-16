// WP3

sleep 5;
wpEnd = false; 

waitUntil {wpExfil};

if (isServer) then {
	//deleteMarker "AbderaApt";

	_m = createMarker ["exfil", getPos mStadium];
	_m setMarkerSize [1.5, 1.5];
	_m setMarkerShape "ICON";
	_m setMarkerType "hd_pickup";
	_m setMarkerColor "ColorWEST";
	_m setMarkerDir 0;
	_m setMarkerText "Miami";
};

hint parseText"
	<t color='#A1A4AD' align='left'>Eagle Eye: Great job Eightball. Move to </t><t color='#FFFFFF' align='left'>LZ Miami </t><t color='#A1A4AD' align='left'>for extraction.</t>
";

Sleep 60;

hint parseText"
	<t color='#A1A4AD' align='left'>Eightball, this is Condor. We're coming in from the south west. ETA 12 mikes.</t>
";

sleep 750;

_c 	= [];
_v 	= [];

if (isServer) then { // Condor

	// Cleanup
	if !(isNil "vNP1") then {{deleteVehicle _x} forEach (crew vNP1);deleteVehicle vNP1;};
	if !(isNil "vNP2") then {{deleteVehicle _x} forEach (crew vNP2);deleteVehicle vNP2;};
	if !(isNil "vTP1") then {{deleteVehicle _x} forEach (crew vTP1);deleteVehicle vTP1;};
	if !(isNil "vTP2") then {{deleteVehicle _x} forEach (crew vTP2);deleteVehicle vTP2;};
	if !(isNil "vTP3") then {{deleteVehicle _x} forEach (crew vTP3);deleteVehicle vTP3;};
	deleteVehicle gmg1; deleteVehicle taa1; deleteVehicle hmg1; 

	_wolfAlive = {alive _x} count playableUnits;

	// create end trigger
	trExfil = createTrigger ["EmptyDetector", getMarkerPos "mC5"];
	publicVariable "trExfil";

	_c = createGroup WEST;
	_v1 = [getMarkerPos "mC1", 30, "B_Heli_Transport_01_F", _c] call BIS_fnc_spawnVehicle; sleep 10;
	vCondor1 = _v1 select 0;
	_v2 = [getMarkerPos "mC1", 30, "B_Heli_Transport_01_F", _c] call BIS_fnc_spawnVehicle;
	vCondor2 = _v2 select 0;
	vCondor1 allowDamage False; vCondor2 allowDamage False;
	vCondor1 setCaptive true; vCondor2 setCaptive true;
			
	_wp1 = _c addWaypoint [getMarkerPos "mC2", 0];
	_wp1 setWaypointType "MOVE";
	_wp1 setWaypointBehaviour "SAFE";
	_wp1 setWaypointSpeed "FULL";
	
	_wp2 = _c addWaypoint [getMarkerPos "mC3", 0];
	_wp2 setWaypointType "MOVE";
	_wp2 setWaypointBehaviour "SAFE";
	_wp2 setWaypointSpeed "NORMAL";
	_wp2 setWaypointCombatMode "Green";
	_wp3 setWaypointStatements ["true", "hint parseText ""<t color='#A1A4AD' align='left'>Condor: Eightball please pop smoke to mark the LZ.</t>"";"];	
	
	_wp3 = _c addWaypoint [getMarkerPos "mC4", 0];
	_wp3 setWaypointType "MOVE";
	_wp3 setWaypointBehaviour "SAFE";
	_wp3 setWaypointSpeed "normal";
	_wp3 setWaypointCombatMode "Green";
	_wp3 setWaypointStatements ["true", "vCondor1 land 'LAND';vCondor2 land 'LAND';hint parseText""<t color='#A1A4AD' align='left'>Condor: Dusting off in 30 seconds!</t>"";vCondor1 flyInHeight 15;vCondor2 flyInHeight 15;"];	

	waitUntil {(currentWaypoint (_wp3 select 0)) > (_wp3 select 1)};
	waitUntil {isTouchingGround vCondor1};
	waitUntil {isTouchingGround vCondor2};
	wpEnd = true;
	publicVariable "wpEnd";
};

waitUntil {wpEnd};
_l = ["tLayer"] call BIS_fnc_rscLayer; 
_l cutText ["", "BLACK", 10];
["<t size='2' color='#93945c'>W O L F P A C K</t><br/><br/><t size='.7' color='#FFFFFF'>Day 03 | Switch Off</t>",0,0,3,4] spawn BIS_fnc_dynamicText;
sleep 5;
["END1",true,5] call BIS_fnc_endMission;
	