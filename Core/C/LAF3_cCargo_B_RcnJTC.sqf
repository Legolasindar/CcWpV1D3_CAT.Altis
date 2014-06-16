/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.01 / APR 2014

Script: Crate Cargo Script (BLUEFOR) - Recon/JTAC teams (Prophet/Angel)
Author: Whiztler
Script version: 1.4

Game type: n/a
File: LAF3_cCargo_B_RcnJTC.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the crate:
null = [this] execVM "Core\C\LAF3_cCargo_B_RcnJTC.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle cargo. 
****************************************************************/

sleep 75; // let other scripts settle in

_crate = _this select 0;
_crate allowDamage false;

if (isServer) exitWith {
	// Init	
	_wpn = 3; 	// Regular Weapons
	_spw = 2; 	// Special Purpose Weapons
	_lau = 1;	// Launchers
	_mag = 20;	// Magazines
	_dem = 10;	// Demo/Explosives
	_mis = 1;	// Missiles/Rockets
	_itm = 5;	// Items
	_uni = 5;	// Uniform/Vest/Backpack/etc

	// Settings 
	clearWeaponCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init
	clearMagazineCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init
	clearItemCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init

	// Primary weapon
	_crate addWeaponCargoGlobal ["arifle_MX_GL_F", _wpn]; // GL
	_crate addWeaponCargoGlobal ["srifle_EBR_SOS_F", _wpn]; // Marksman
	_crate addWeaponCargoGlobal ["arifle_MXM_RCO_pointer_snds_F", _spw]; // Marksman
	_crate addWeaponCargoGlobal ["srifle_LRR_LRPS_F", _spw]; // Sniper
	_crate addWeaponCargoGlobal ["srifle_LRR_SOS_F", _spw]; // Sniper
			
	// Secondary weapon
	_crate addWeaponCargoGlobal ["hgun_Pistol_heavy_01_snds_F", _wpn];

	// Magazines primary weapon
	_crate addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", _mag];
	_crate addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", _mag];
	_crate addMagazineCargoGlobal ["20Rnd_762x51_Mag", _mag]; // Marksman EBR
	_crate addMagazineCargoGlobal ["7Rnd_408_Mag", _mag]; // Sniper

	// Magazines secondary weapon
	_crate addMagazineCargoGlobal ["11Rnd_45ACP_Mag", _mag];

	// Launchers

	// Rockets/Missiles

	// Demo/Explosives
	_crate addMagazineCargoGlobal ["APERSBoundingMine_Range_Mag", _dem];
	_crate addMagazineCargoGlobal ["APERSMine_Range_Mag", _itm];
	_crate addMagazineCargoGlobal ["APERSTripMine_Wire_Mag", _itm];
	_crate addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", _itm];

	// Weapon mountings
	_crate addItemCargoGlobal ["optic_ACO", _itm];
	_crate addItemCargoGlobal ["optic_NVS", _itm];
	_crate addItemCargoGlobal ["optic_MRCO", _itm];
	_crate addItemCargoGlobal ["optic_SOS", _itm];
	_crate addItemCargoGlobal ["optic_Nightstalker", _itm];
	_crate addItemCargoGlobal ["optic_MRD", _itm]; // .45 Handgun
	_crate addItemCargoGlobal ["acc_flashlight", _itm];
	_crate addItemCargoGlobal ["muzzle_snds_H", _itm];
	_crate addItemCargoGlobal ["muzzle_snds_H_MG", _itm];
	_crate addItemCargoGlobal ["muzzle_snds_B", _itm];
	_crate addItemCargoGlobal ["muzzle_snds_L", _itm];

	// GL Ammo
	_crate addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["3Rnd_Smoke_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["3Rnd_SmokeRed_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["3Rnd_SmokeGreen_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["3Rnd_SmokeYellow_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["3Rnd_SmokePurple_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["3Rnd_SmokeBlue_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["3Rnd_SmokeOrange_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["UGL_FlareCIR_F", _mag];
	_crate addMagazineCargoGlobal ["UGL_FlareWhite_F", _mag];
	_crate addMagazineCargoGlobal ["UGL_FlareGreen_F", _mag];
	_crate addMagazineCargoGlobal ["UGL_FlareRed_F", _mag];
	_crate addMagazineCargoGlobal ["UGL_FlareYellow_F", _mag];
	 
	// Grenades/Chemlights
	_crate addMagazineCargoGlobal ["MiniGrenade", _mag]; 	 
	_crate addMagazineCargoGlobal ["SmokeShell", _mag]; 	 
	_crate addMagazineCargoGlobal ["SmokeShellGreen", _mag]; 	 
	_crate addMagazineCargoGlobal ["SmokeShellRed", _mag]; 
	_crate addMagazineCargoGlobal ["SmokeShellYellow", _mag]; 
	_crate addMagazineCargoGlobal ["SmokeShellPurple", _mag]; 
	_crate addMagazineCargoGlobal ["SmokeShellBlue", _mag]; 
	_crate addMagazineCargoGlobal ["SmokeShellOrange", _mag]; 
	_crate addMagazineCargoGlobal ["Chemlight_green", _mag]; 
	_crate addMagazineCargoGlobal ["Chemlight_red", _mag]; 
	_crate addMagazineCargoGlobal ["Chemlight_yellow", _mag]; 
	_crate addMagazineCargoGlobal ["Chemlight_blue", _mag]; 
	_crate addMagazineCargoGlobal ["B_IR_Grenade", _mag]; 

	// Medical Items
	_crate addItemCargoGlobal ["FirstAidKit", 10];

	// Optical/Bino's/Goggles
	_crate addWeaponCargoGlobal ["LaserDesignator", _itm];
	_crate addWeaponCargoGlobal ["RangeFinder", _itm];
	_crate addItemCargoGlobal ["G_Tatical_Clear", _itm];
	_crate addItemCargoGlobal ["NVGoggles", _itm];

	// ACRE and cTAB
	if (acreInc) then {_crate addItemCargoGlobal ["ItemRadio", 15];};
	if (acreInc) then {_crate addItemCargoGlobal ["ACRE_PRC148", 3];};
	if (acreInc) then {_crate addItemCargoGlobal ["ACRE_PRC119", 1];};
	if (ctabInc) then {_crate addItemCargoGlobal ["ItemAndroid", 3];};

	// Gear kit (not working from crates/veh)
	_crate addBackpackCargoGlobal ["B_Carryall_Base", _uni];
	_crate addBackpackCargoGlobal ["B_AssaultPack_blk", _uni];
	_crate addBackpackCargoGlobal ["B_Kitbag_mcamo", _uni];

	// Misc items
	_crate addItemCargoGlobal ["ItemGPS", _itm];
	_crate addItemCargoGlobal ["ItemMap", _itm];
	_crate addItemCargoGlobal ["ItemWatch", _itm];
	_crate addItemCargoGlobal ["ItemCompass", _itm];
	_crate addItemCargoGlobal ["LaserBatteries", _itm];
	_crate addItemCargoGlobal ["ToolKit", _itm];
};


