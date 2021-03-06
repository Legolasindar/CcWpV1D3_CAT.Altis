/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Crate Cargo Script (BLUEFOR) - Infantry Weapons Team (Fox)
Author: Whiztler
Script version: 1.4

Game type: n/a
File: LAF3_cCargo_B_IWT.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the crate:
null = [this] execVM "Core\C\LAF3_cCargo_B_IWT.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle cargo. 
****************************************************************/

sleep 65; // let other scripts settle in

_crate = _this select 0;
_crate allowDamage false;
	
if (isServer) exitWith {
	// Init	
	_wpn = 1; 	// Regular Weapons
	_spw = 2; 	// Special Purpose Weapons
	_lau = 2;	// Launchers
	_mag = 40;	// Magazines
	_dem = 5;	// Demo/Explosives
	_mis = 10;	// Missiles/Rockets
	_itm = 3;	// Items
	_uni = 5;	// Uniform/Vest/Backpack/etc

	// Settings 
	clearWeaponCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init
	clearMagazineCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init
	clearItemCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init

	// Primary weapon
	_crate addWeaponCargoGlobal ["arifle_MX_F", _wpn];
	_crate addWeaponCargoGlobal ["arifle_MX_GL_F", _wpn]; // GL
	_crate addWeaponCargoGlobal ["srifle_EBR_SOS_F", _wpn]; // Marksman
	_crate addWeaponCargoGlobal ["srifle_LRR_LRPS_F", _spw]; // Sniper
	_crate addWeaponCargoGlobal ["LMG_mk200_f", _spw]; // MG
			
	// Secondary weapon
	_crate addWeaponCargoGlobal ["hgun_P07_F", 3];

	// Magazines primary weapon
	_crate addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", _mag];
	_crate addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag_tracer", _mag]; // LMG
	_crate addMagazineCargoGlobal ["200Rnd_65x39_cased_Box_Tracer", _mag]; // MG
	_crate addMagazineCargoGlobal ["200Rnd_65x39_cased_Box", _mag]; // MG
	_crate addMagazineCargoGlobal ["20Rnd_762x51_Mag", _mag]; // Marksman
	_crate addMagazineCargoGlobal ["7Rnd_408_Mag", _mag]; // Sniper

	// Magazines secondary weapon
	_crate addMagazineCargoGlobal ["16Rnd_9x21_Mag", 10];

	// Launchers
	_crate addWeaponCargoGlobal ["launch_B_Titan_F", _lau];
	_crate addWeaponCargoGlobal ["launch_B_Titan_short_F", _lau];

	// Rockets/Missiles
	_crate addMagazineCargoGlobal ["Titan_AT", _mis];
	_crate addMagazineCargoGlobal ["Titan_AP", _mis];
	_crate addMagazineCargoGlobal ["Titan_AA", _mis];

	// Demo/Explosives
	_crate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", _dem];
	_crate addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", _dem];
	_crate addMagazineCargoGlobal ["ATMine_Range_Mag", _dem];
	_crate addMagazineCargoGlobal ["APERSBoundingMine_Range_Mag", _dem];
	_crate addMagazineCargoGlobal ["APERSMine_Range_Mag", _itm];
	_crate addMagazineCargoGlobal ["APERSTripMine_Wire_Mag", _itm];
	_crate addMagazineCargoGlobal ["SLAMDirectionalMine_Wire_Mag", _itm];
	_crate addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", _itm];
	_crate addItemCargoGlobal ["MineDetector", 1];

	// Weapon mountings
	_crate addItemCargoGlobal ["acc_pointer_IR", _itm];
	_crate addItemCargoGlobal ["optic_ACO", _itm];
	_crate addItemCargoGlobal ["optic_NVS", 1];
	_crate addItemCargoGlobal ["optic_MRCO", 1];
	_crate addItemCargoGlobal ["acc_flashlight", _itm];
	_crate addItemCargoGlobal ["muzzle_snds_H", _itm];
	_crate addItemCargoGlobal ["muzzle_snds_H_MG", _itm];
	_crate addItemCargoGlobal ["muzzle_snds_B", _itm];
	_crate addItemCargoGlobal ["muzzle_snds_L", _itm];

	// GL Ammo
	_crate addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["3Rnd_Smoke_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["3Rnd_SmokeRed_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["1Rnd_SmokeGreen_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["3Rnd_SmokeGreen_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["1Rnd_SmokePurple_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["3Rnd_SmokePurple_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["UGL_FlareCIR_F", _mag];
	_crate addMagazineCargoGlobal ["UGL_FlareWhite_F", _mag];
	_crate addMagazineCargoGlobal ["UGL_FlareGreen_F", _mag];
	_crate addMagazineCargoGlobal ["UGL_FlareRed_F", _mag];
	 
	// Grenades/Chemlights
	_crate addMagazineCargoGlobal ["HandGrenade", _mag]; 	 
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
	_crate addItemCargoGlobal ["FirstAidKit", _itm];
	_crate addItemCargoGlobal ["Medikit", 2];

	// Optical/Bino's/Goggles
	_crate addWeaponCargoGlobal ["RangeFinder", 1];
	_crate addWeaponCargoGlobal ["Binocular", 3];
	_crate addItemCargoGlobal ["G_Tatical_Clear", _itm];
	_crate addItemCargoGlobal ["NVGoggles", _itm];

	// ACRE and cTAB
	_crate addItemCargoGlobal ["ItemRadio", 5];
	_crate addItemCargoGlobal ["ACRE_PRC148", 1];
	_crate addItemCargoGlobal ["ItemAndroid", 1];

	// Gear kit (not working from crates/veh)
	_crate addBackpackCargoGlobal ["B_Carryall_Base", _uni];
	_crate addBackpackCargoGlobal ["B_Kitbag_mcamo", _uni];


	// Misc items
	_crate addItemCargoGlobal ["ItemGPS", 1];
	_crate addItemCargoGlobal ["ItemMap", _itm];
	_crate addItemCargoGlobal ["ItemWatch", _itm];
	_crate addItemCargoGlobal ["ItemCompass", _itm];
	_crate addItemCargoGlobal ["ToolKit", _itm];
	_crate addWeaponCargoGlobal ["B_UavTerminal", 1];
};


