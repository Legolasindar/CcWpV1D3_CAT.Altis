hint parseText"<t color='#A1A4AD' align='left'>Eagle Eye: Eightball, Bona feina amb aquesta generadors. Procedeixin amb el següent objectiu.</t>";

if (isServer) then {
	_types = [
	"Lamps_Base_F",
	"Land_LampAirport_F",
	"Land_LampSolar_F",
	"Land_LampStreet_F",
	"Land_LampStreet_small_F",
	"PowerLines_base_F",
	"Land_LampDecor_F",
	"Land_LampHalogen_F",
	"Land_LampHarbour_F",
	"Land_LampShabby_F",
	"Land_PowerPoleWooden_L_F",
	"Land_NavigLight",
	"Land_runway_edgelight",
	"Land_runway_edgelight_blue_F",
	"Land_Flush_Light_green_F",
	"Land_Flush_Light_red_F",
	"Land_Flush_Light_yellow_F",
	"Land_Runway_PAPI",
	"Land_Runway_PAPI_2",
	"Land_Runway_PAPI_3",
	"Land_Runway_PAPI_4",
	"Land_fs_roof_F", // Fuel station roof lights
	"Land_fs_sign_F"
	];

	for [{_i=0},{_i < (count _types)},{_i=_i+1}] do
	{
		_lamps = (getMarkerPos "ps1") nearObjects [_types select _i, 2000]; // 1000 = distance
		sleep 0.035;
		{_x setDamage 0.95} forEach _lamps;
	};  
		
}; // Close isServer

sleep 10;