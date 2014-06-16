sleep 5;
wpEnd = 0;
deleteMarker "AbderaApt";

_m = createMarker ["exfil", getPos mStadium];
_m setMarkerSize [1.5, 1.5];
_m setMarkerShape "ICON";
_m setMarkerType "hd_pickup";
_m setMarkerColor "ColorWEST";
_m setMarkerDir 0;
_m setMarkerText "Miami";
hint parseText"
	<t color='#A1A4AD' align='left'>Eagle Eye: Great job Eightball. Move to </t><t color='#FFFFFF' align='left'>LZ Miami </t><t color='#A1A4AD' align='left'>for extraction.</t>
";



hint parseText"
	<t color='#A1A4AD' align='left'>Eightball, this is Condor. We're coming in from the south. ETA 2 mikes.</t>
";


// Cleanup
if !(isNil "vNP1") then {{deleteVehicle _x} forEach (crew vNP1);deleteVehicle vNP1;};
if !(isNil "vNP2") then {{deleteVehicle _x} forEach (crew vNP2);deleteVehicle vNP2;};
if !(isNil "vTP1") then {{deleteVehicle _x} forEach (crew vTP1);deleteVehicle vTP1;};
if !(isNil "vTP2") then {{deleteVehicle _x} forEach (crew vTP2);deleteVehicle vTP2;};
if !(isNil "vTP3") then {{deleteVehicle _x} forEach (crew vTP3);deleteVehicle vTP3;};
deleteVehicle gmg1; deleteVehicle taa1; deleteVehicle hmg1; 

_c 	= [];
_v 	= [];

if (isServer) then { // Condor

	// create end trigger
	trExfil = createTrigger ["EmptyDetector", getMarkerPos "mC5"];
	publicVariable "trExfil";
	
	_v = "B_Heli_Transport_01_F" createVehicle (getMarkerPos "mc4");
	_v = "B_Heli_Transport_01_F" createVehicle (getMarkerPos "mc5");	
};


	