/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Crate Cargo Script (BLUEFOR) - Cavalry Squadron (Knight)
Author: Whiztler
Script version: 1.4

Game type: n/a
File: LAF3_cCargo_B_Cav.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the crate:
null = [this] execVM "Core\C\LAF3_cCargoGlobal_B_Cav.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle Cargo. 
****************************************************************/

sleep 55; // let other scripts settle in

_crate = _this select 0;
_crate allowDamage false;

if (isServer) exitWith {
	// Init
	_wpn = 3; 	// Regular Weapons
	_spw = 1; 	// Special Purpose Weapons
	_lau = 1;	// Launchers
	_mag = 15;	// Magazines
	_dem = 1;	// Demo/Explosives
	_mis = 1;	// Missiles/Rockets
	_itm = 3;	// Items
	_uni = 1;	// Uniform/Vest/Backpack/etc

	// Settings 
	clearWeaponCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init
	clearMagazineCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init
	clearItemCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init

	// Primary weapon
	_crate addWeaponCargoGlobal ["arifle_MXC_F", _wpn]; // Compact
			
	// Secondary weapon
	_crate addWeaponCargoGlobal ["hgun_P07_F", _wpn];

	// Magazines primary weapon
	_crate addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", _mag];

	// Magazines secondary weapon
	_crate addMagazineCargoGlobal ["16Rnd_9x21_Mag", _mag];

	// Launchers
	_crate addweaponCargoGlobal ["launch_NLAW_F", _lau];

	// Rockets/Missiles
	_crate addMagazineCargoGlobal ["NLAW_F", _mis];

	// Demo/Explosives
	_crate addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", _dem];
	_crate addMagazineCargoGlobal ["ATMine_Range_Mag", _dem];
	_crate addItemCargoGlobal ["MineDetector", _itm];

	// Weapon mountings
	_crate addItemCargoGlobal ["acc_pointer_IR", _itm];
	_crate addItemCargoGlobal ["optic_ACO", _itm];
	_crate addItemCargoGlobal ["optic_MRCO", _itm];
	_crate addItemCargoGlobal ["optic_Holosight", _itm];
	_crate addItemCargoGlobal ["acc_flashlight", _itm];

	// GL Ammo
	 
	// Grenades/Chemlights
	_crate addMagazineCargoGlobal ["MiniGrenade", _mag]; 	 
	_crate addMagazineCargoGlobal ["SmokeShell", _mag]; 	 
	_crate addMagazineCargoGlobal ["SmokeShellGreen", _mag]; 	 
	_crate addMagazineCargoGlobal ["SmokeShellRed", _mag]; 
	_crate addMagazineCargoGlobal ["Chemlight_green", _mag]; 
	_crate addMagazineCargoGlobal ["Chemlight_red", _mag]; 
	_crate addMagazineCargoGlobal ["B_IR_Grenade", _mag]; 

	// Medical Items
	_crate addItemCargoGlobal ["FirstAidKit", 6];

	// Optical/Bino's/Goggles
	_crate addWeaponCargoGlobal ["Binocular", _itm];
	_crate addItemCargoGlobal ["NVGoggles", _itm];

	// ACRE and cTAB
	_crate addItemCargoGlobal ["ItemRadio", _itm];
	_crate addItemCargoGlobal ["ACRE_PRC148", 1];
	_crate addItemCargoGlobal ["ItemAndroid", 1];

	// Gear kit (not working from crates/veh)

	// Misc items
	_crate addItemCargoGlobal ["ItemGPS", _itm];
	_crate addItemCargoGlobal ["ItemMap", _itm];
	_crate addItemCargoGlobal ["ItemWatch", _itm];
	_crate addItemCargoGlobal ["ItemCompass", _itm];
	_crate addItemCargoGlobal ["ToolKit", _itm];
};

