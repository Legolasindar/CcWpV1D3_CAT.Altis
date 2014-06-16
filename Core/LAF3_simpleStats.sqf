/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Simple Server/Mission Stats (Headless Client enabled)
Author: Whiztler
Script version: 2.0

Game type: n/a
File: LAF3_simpleStats.sqf
****************************************************************
Instructions:

Execute the script using a trigger with radio alpha/bravo/etc
****************************************************************/

// Init
_cnt = 0;
textServer = "";
textHeadless = "";
units_B_DS = 0;
units_O_DS = 0;
units_I_DS = 0;
units_C_DS = 0;
units_B_HC = 0;
units_O_HC = 0;
units_I_HC = 0;
units_C_HC = 0;

while {(_cnt != 20)} do {
	_cnt = _cnt + 1;
	
	if (isDedicated) then {		
		serverFPS = round (diag_fps);
		publicVariable "serverFPS";
	};	
	
	if (isDedicated || isServer) then {
		units_B_DS = {(local _x) && (side _x == WEST)} count allUnits;
		units_O_DS = {(local _x) && (side _x == EAST)} count allUnits;
		units_I_DS = {(local _x) && (side _x == INDEPENDENT)} count allUnits;
		units_C_DS = {(local _x) && (side _x == CIVILIAN)} count allUnits;
		textServer = format ["	
			<t color='#FFFFFF' align='left' size='1.2'>Server:</t><br/>
			<t color='#A1A4AD' align='left'>Units West:</t>
			<t color='#2E64FE' align='right' size='1.1'>%1</t><br/>
			<t color='#A1A4AD' align='left'>Units East:</t>
			<t color='#FE2E2E' align='right' size='1.1'>%2</t><br/>
			<t color='#A1A4AD' align='left'>Units Independent:</t>
			<t color='#A5DF00' align='right' size='1.1'>%3</t><br/>
			<t color='#A1A4AD' align='left'>Units Civilian:</t>
			<t color='#DA81F5' align='right' size='1.1'>%4</t><br/><br/>",
			units_B_DS, //1
			units_O_DS, //2
			units_I_DS, //3
			units_C_DS //4
		];
		if ((units_B_DS > 0) || (units_O_DS > 0) || (units_I_DS > 0) || (units_C_DS > 0)) then {publicVariable "textServer"};
	};

	if (!hasinterface && !isServer) then {
		units_B_HC = {(local _x) && (side _x == WEST)} count allUnits;
		units_O_HC = {(local _x) && (side _x == EAST)} count allUnits;
		units_I_HC = {(local _x) && (side _x == INDEPENDENT)} count allUnits;
		units_C_HC = {(local _x) && (side _x == CIVILIAN)} count allUnits;
		textHeadless = format ["	
			<t color='#FFFFFF' align='left' size='1.2'>Headless Client:</t><br/>
			<t color='#A1A4AD' align='left'>Units West:</t>
			<t color='#2E64FE' align='right' size='1.1'>%1</t><br/>
			<t color='#A1A4AD' align='left'>Units East:</t>
			<t color='#FE2E2E' align='right' size='1.1'>%2</t><br/>
			<t color='#A1A4AD' align='left'>Units Independent:</t>
			<t color='#A5DF00' align='right' size='1.1'>%3</t><br/>		
			<t color='#A1A4AD' align='left'>Units Civilian:</t>
			<t color='#DA81F5' align='right' size='1.1'>%4</t><br/><br/>",
			units_B_HC, //1
			units_O_HC, //2
			units_I_HC, //3
			units_C_HC //4
		];
		if ((units_B_HC > 0) || (units_O_HC > 0) || (units_I_HC > 0) || (units_C_HC > 0)) then {publicVariable "textHeadless"};
	};
		
	if (isNil "ServerFPS") then {serverFPS = "N/A";};

	_textIntro = format ["
		<t color='#2E80C6' size='1.5'>SERVER/HC STATS</t><br/><br/>
			
		<t color='#A1A4AD' align='left'>Server FPS:</t>
		<t color='#FFD11B' align='right' size='1.2'>%1</t><br/><br/>

		<t color='#A1A4AD' align='left'>Total Units:</t>
		<t color='#FFFFFF' align='right' size='1.1'>%2</t><br/>
		<t color='#A1A4AD' align='left'>Total Players:</t>
		<t color='#FFFFFF' align='right' size='1.1'>%3</t><br/>	
		<t color='#A1A4AD' align='left'>Total Groups:</t>
		<t color='#FFFFFF' align='right' size='1.1'>%4</t><br/>
		<t color='#A1A4AD' align='left'>Dead Units:</t>
		<t color='#FFFFFF' align='right' size='1.1'>%5</t><br/>
		<t color='#A1A4AD' align='left'>Vehicles:</t>
		<t color='#FFFFFF' align='right' size='1.1'>%6</t><br/><br/>",
		serverFPS,//1
		count allUnits,//2
		count PlayableUnits,//3
		count allGroups,//4
		count allDeadmen,//5
		count vehicles//6	
	];
		
	_textTotal = format ["	
		<t color='#A1A4AD' align='left'>Total Objects:</t>
		<t color='#FFFFFF' align='right' size='1.1'>%1</t><br/>
		<t color='#A1A4AD' align='left'>Total Entities:</t>
		<t color='#FFFFFF' align='right' size='1.1'>%2</t><br/>",
		count allMissionObjects "All",//1
		count entities "All"//2
	];

	sleep 0.5;
	hintSilent parseText (_textIntro + textServer + textHeadless + _textTotal);
};

hint "";
if (true) exitWith {};