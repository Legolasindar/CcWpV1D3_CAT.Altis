#include "LAF3_JIP.sqf"

if !(isNil "Wolf_1_SCC") then {
	hint parseText format ["
	<t color='#A1A4AD' align='left'>Bon dia comandant %1, m'alegro de veure't de nou.</t>
	",name vehicle Wolf_1_SCC];
} else {
	hint parseText"
	<t color='#A1A4AD' align='left'>Bon dia commandant, m'alegro de veure't de nou.</t>
	";
};

deleteMarker "mrk_rv";
sleep 4;
_m = createMarker ["obj_tower", getMarkerPos "pos_obj_tower"];
_m setMarkerShape "ICON";
_m setMarkerType "mil_triangle";
_m setMarkerColor "ColorWEST";
_m setMarkerText "Radar and Communications Station";
_m setMarkerDir 0;

_m = createMarker ["obj_pwrplant", [4230,15076,19]];
_m setMarkerShape "ICON";
_m setMarkerType "mil_triangle";
_m setMarkerColor "ColorWEST";
_m setMarkerText "Kavala Power Plant";
_m setMarkerDir 0;
sleep 0.05;
deleteMarker "pos_obj_tower";


_cnt = 0;
while {(_cnt != 30)} do {
	_cnt = _cnt + 1;
	hintSilent parseText format ["
		<t color='#A1A4AD' align='left'>The resistance has been disrupting Telecom networks. We need to take out the power plant and radar &amp; communications station for a lasting effect. Your mission is as follows:</t><br/><br/>
		<t color='#A1A4AD' align='left'>1. Covertly make your way towards the </t><t color='#FFFFFF' align='left'>Power Plant.</t><br/>
		<t color='#A1A4AD' align='left'>Set charges around the </t><t color='#FFFFFF' align='left'>9 generators</t><t color='#A1A4AD' align='left'> and make sure they are destroyed completely. Make sure you bring enough explosives.</t><br/><br/>
		<t color='#A1A4AD' align='left'>2. Move to the </t><t color='#FFFFFF' align='left'>Radar &amp; Communications Station.</t><br/>
		<t color='#A1A4AD' align='left'>At the large radar antennas and at the Radar Dome you have an option to attach a </t><t color='#FFFFFF' align='left'>LRI tag sticker</t><t color='#A1A4AD' align='left'> and call in a missile strike.</t><br/><br/>
		<t color='#A1A4AD' align='left'>L'objectiu està marcat en el mapa. Bona sort Comandant.</t><br/>
	"];
	sleep 1;
};

sleep 15;

if (!isServer) exitWith {};

_wp = gNikos addWaypoint [getMarkerPos "mp_rv1", 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointFormation "COLUMN";
_wp setWaypointStatements ["true", "pNikos moveInDriver vMP;"];
sleep 1;
_wp = gNikos addWaypoint [getMarkerPos "mp_rv2", 1];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
_wp setWaypointStatements ["true", "deleteVehicle pNikos; deleteGroup gNikos; deleteVehicle vMP; gNikos = nil;"];

