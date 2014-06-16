/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / May 2014

Script: Loadout Gear West
Author: Whiztler
Script version: 3.4 WP Wet

Game type: n/a
File: LAF3_loadoutWest.sqf
****************************************************************
NOTE: Gear loads on actual players only. Does not load on AI's!!

Instructions:

This script is called by the loadoutClient.sqf script. The client
script call for a specific role that matches the name of the playable
unit. Make sure that the names of your playable units match exactly
with the names (variables) in both the client and the gear script else
the script will not execute for that specific player causing him to have
an incorrect loadout.

Make sure to check the capacity of the backpack and vest before adding
(more) items. Do not delete lines but comment them out when you do not
want it included.

The script runs on initial join, on jip and on respawn.
****************************************************************/


/////  Special Operations Squadron: WOLF

LAF3_fnc_sSpecop = {

	// Pre loading default squad loadout Wolf 
	_unit addWeapon "ItemGPS";		
	_unit addUniform "U_B_Wetsuit";
	_unit addWeapon "G_Diving";
	_unit addVest "V_RebreatherIR";

	// Wolf 4 Dry Gear
	if (_r != "uav") then { 
		_unit addBackpack "B_Bergen_blk";
		(backpackContainer _unit) additemcargoGlobal ["FirstAidKit",2];
		(backpackContainer _unit) addmagazinecargoGlobal ["MiniGrenade",2];
		(backpackContainer _unit) additemcargoGlobal ["acc_flashlight",1];
		(backpackContainer _unit) addmagazinecargoGlobal ["SmokeShell",2];
		if (_r != "rmm") then {		
			(backpackContainer _unit) addweaponcargoGlobal ["arifle_MX_Black_Hamr_pointer_F",1];
		};
		(backpackContainer _unit) addmagazinecargoGlobal ["SatchelCharge_Remote_Mag",1];
		(backpackContainer _unit) additemcargoGlobal ["muzzle_snds_H",1];
		(backpackContainer _unit) additemcargoGlobal ["V_Chestrig_blk",1];
		(backpackContainer _unit) additemcargoGlobal ["U_I_G_Story_Protagonist_F",1];
		(backpackContainer _unit) additemcargoGlobal ["H_Watchcap_blk",1];
		(backpackContainer _unit) additemcargoGlobal ["G_Lowprofile",1];		
		if (acreInc) then {(backpackContainer _unit) additemcargoGlobal ["ACRE_PRC343",1];} else {(backpackContainer _unit) additemcargoGlobal ["ItemRadio",1];};
		(backpackContainer _unit) addmagazinecargoGlobal ["MiniGrenade",2];
		(backpackContainer _unit) addmagazinecargoGlobal ["Chemlight_blue",2];
		(backpackContainer _unit) addmagazinecargoGlobal ["SmokeShellBlue",1];
	}; 
	if (_r == "rs") then {
		(backpackContainer _unit) addmagazinecargoGlobal ["30Rnd_65x39_caseless_mag",4];
		(uniformContainer _unit) addmagazinecargoGlobal ["11Rnd_45ACP_Mag",3];
	} else {
		if (_r != "rmm") then {	
			(uniformContainer _unit) addmagazinecargoGlobal ["30Rnd_65x39_caseless_mag",2];
		};
		(uniformContainer _unit) addmagazinecargoGlobal ["11Rnd_45ACP_Mag",1];
		(backpackContainer _unit) addmagazinecargoGlobal ["11Rnd_45ACP_Mag",2];
	};		
	(uniformContainer _unit) addmagazinecargoGlobal ["30Rnd_556x45_Stanag_Tracer_Yellow",3];
	(uniformContainer _unit) addmagazinecargoGlobal ["30Rnd_65x39_caseless_mag",3];
	[_unit, "arifle_SDAR_F", 4, "30Rnd_556x45_Stanag_Tracer_Yellow"] call BIS_fnc_addWeapon;
	[_unit, "hgun_Pistol_heavy_01_snds_F", 3, "11Rnd_45ACP_Mag"] call BIS_fnc_addWeapon; _unit addHandgunItem "optic_MRD";
	
	
	// Role specific loadout
	if (_r == "ssc") exitWith { // Squadron Commander
		if (acreInc) then {(backpackContainer _unit) additemcargoGlobal ["ACRE_PRC119",1];};
		if (acreInc) then {(backpackContainer _unit) additemcargoGlobal ["ACRE_PRC148",1];};
		if (ctabInc) then {(backpackContainer _unit) additemcargoGlobal ["ItemcTab",1];};
		(backpackContainer _unit) addmagazinecargoGlobal ["Laserbatteries",2];
		_unit addWeapon "Laserdesignator";		
		_unit selectWeapon (primaryWeapon _unit);		
	};
	
	if (_r == "rtl") exitWith { // Wolf 1/2/3 Recon Team Leader
		(backpackContainer _unit) addmagazinecargoGlobal ["3Rnd_UGL_FlareGreen_F",2];
		(backpackContainer _unit) addmagazinecargoGlobal ["3Rnd_UGL_FlareCIR_F",2];
		(backpackContainer _unit) addmagazinecargoGlobal ["3Rnd_HE_Grenade_shell",4];
		if (acreInc) then {(backpackContainer _unit) additemcargoGlobal ["ACRE_PRC148",1];};
		if (ctabInc) then {(backpackContainer _unit) additemcargoGlobal ["ItemAndroid",1];};
		(vestContainer _unit) addmagazinecargoGlobal ["SmokeShellPurple",1];
		(vestContainer _unit) addmagazinecargoGlobal ["SmokeShellRed",1];
		_unit addWeapon "Rangefinder";
		_unit selectWeapon (primaryWeapon _unit);
	};
	
	if (_r == "rmm") exitWith { // Wolf Recon Marksman
		(backpackContainer _unit) addmagazinecargoGlobal ["20Rnd_762x51_Mag",10];
		(backpackContainer _unit) addmagazinecargoGlobal ["ClaymoreDirectionalMine_Remote_Mag",1];
		(backpackContainer _unit) additemcargoGlobal ["optic_Nightstalker",1];
		(backpackContainer _unit) addWeaponCargoGlobal ["srifle_EBR_F",1];
		(backpackContainer _unit) additemcargoGlobal ["acc_pointer_IR",1];
		(backpackContainer _unit) additemcargoGlobal ["muzzle_snds_B",1];	
		(backpackContainer _unit) additemcargoGlobal ["optic_DMS",1];		
		if (acreInc) then {(backpackContainer _unit) additemcargoGlobal ["ACRE_PRC148",1];};		
		_unit addWeapon "Rangefinder";
		_unit selectWeapon (primaryWeapon _unit);
	};
	
	if (_r == "dem") exitWith { // Wolf Demolition Specialist
		(backpackContainer _unit) addmagazinecargoGlobal ["SatchelCharge_Remote_Mag",2];
		(backpackContainer _unit) addmagazinecargoGlobal ["DemoCharge_Remote_Mag",1];
		_unit addWeapon "Binocular";
		_unit selectWeapon (primaryWeapon _unit);
	};
	
	if (_r == "rs") exitWith { // Wolf Recon Specialist
		(backpackContainer _unit) addmagazinecargoGlobal ["30Rnd_65x39_caseless_mag",8];
		(backpackContainer _unit) addmagazinecargoGlobal ["MiniGrenade",3];
		_unit addWeapon "Binocular";
		_unit selectWeapon (primaryWeapon _unit);		
	};
	
	if (_r == "rm") exitWith { // Wolf Paramedic
		(backpackContainer _unit) additemcargoGlobal ["FirstAidKit",10];
		(backpackContainer _unit) additemcargoGlobal ["Medikit",1];
		_unit addWeapon "Binocular";
		_unit selectWeapon (primaryWeapon _unit);		
	};
	
	if (_r == "uav") exitWith { // Wolf UAV recon Specialist
		_unit addBackpack "B_UAV_01_backpack_F";
		(uniformContainer _unit) additemcargoGlobal ["B_UavTerminal",1]; _unit assignItem "B_UAVTerminal"; 
		_unit addWeapon "Binocular";
		_unit selectWeapon (primaryWeapon _unit);
	};

	if (_r == "at") exitWith { // Wolf AT Specialist
		(backpackContainer _unit) addmagazinecargoGlobal ["Titan_AP",1];
		[_unit, "launch_B_Titan_short_F", 1, "Titan_AT"] call BIS_fnc_addWeapon;
		_unit addWeapon "Binocular";
		_unit selectWeapon (primaryWeapon _unit);
	};

}; // Close LAF3_fnc_sSpecop


/////  Undefined player

NotDef = {

	// Display error message
	hintSilent parseText format ["
		<t color='#FE2E2E' align='left' size='1.2'>Error!</t><br/><br/>
		<t color='#FFFFFF' align='left'>%1 </t><t color='#A1A4AD' align='left'>, your playable unit </t><t color='#FFFFFF' align='left'>%2</t><t color='#A1A4AD' align='left'> is undefined!</t><br/><br/>
		<t color='#A1A4AD' align='left'>You will be issued with a standard infantry loadout. Please advice the mission author of this error.</t>		
	",name vehicle player, vehicle player];
	sleep 1;

	// Assign standard Infantry gear
	_unit = _this select 0;
	_unit addUniform "U_B_CombatUniform_mcam";
	_unit addVest "V_PlateCarrierGL_rgr";
	_unit addBackPack "B_AssaultPack_rgr";
	_unit addHeadgear "H_HelmetB";
	(unitBackpack _unit) addMagazineCargo ["smokeshell",5];
	(unitBackpack _unit) addMagazineCargo ["HandGrenade",3];
	[_unit, "arifle_MX_ACO_pointer_F", 9, "30Rnd_65x39_caseless_mag"] call BIS_fnc_addWeapon;
	[_unit, "hgun_P07_F", 3,"16Rnd_9x21_Mag"] call BIS_fnc_addWeapon;
	 _unit unAssignItem "NVGoggles"; 
	_unit addItem "FirstAidKit";
	_unit addItem "FirstAidKit";
	_unit addWeapon "Binocular";
}; // Close NotDef
