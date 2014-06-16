/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Vehicle Cargo Script (BLUEFOR) (BLUEFOR) - Ammunition Supply Truck
Author: Whiztler
Script version: 1.5

Game type: n/a
File: LAF3_vCargo_B_TruckAmmo.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the vehicle:
null = [this] execVM "Core\C\LAF3_vCargo_B_TruckAmmo.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle Cargo. 
****************************************************************/



sleep 30; // let other scripts settle in

// Init
_vAmmo = _this select 0;

if (!isServer) exitWith {};

while {alive _vAmmo} do {
	// Settings 
	clearWeaponCargoGlobal _vAmmo; // Empty vehicle Cargo contents on init
	clearMagazineCargoGlobal _vAmmo; // Empty vehicle Cargo contents on init
	clearItemCargoGlobal _vAmmo; // Empty vehicle Cargo contents on init

	// Primary weapon
	_vAmmo addWeaponCargoGlobal ["arifle_MX_GL_F", 2]; // GL
	_vAmmo addWeaponCargoGlobal ["arifle_MX_SW_F", 2]; // LMG
	_vAmmo addWeaponCargoGlobal ["LMG_mk200_f", 1]; // MG
	_vAmmo addWeaponCargoGlobal ["arifle_MXM_F", 1]; // Marksman
	_vAmmo addWeaponCargoGlobal ["arifle_MX_F", 10];

	// Secondary weapon
	_vAmmo addWeaponCargoGlobal ["hgun_P07_F", 10];

	// Magazines primary weapon
	_vAmmo addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 250];
	_vAmmo addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", 100];
	_vAmmo addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag_tracer", 100]; // LMG
	_vAmmo addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag", 25]; // LMG
	_vAmmo addMagazineCargoGlobal ["200Rnd_65x39_cased_Box_Tracer", 50]; // MG
	_vAmmo addMagazineCargoGlobal ["200Rnd_65x39_cased_Box", 25]; // MG

	// Magazines secondary weapon
	_vAmmo addMagazineCargoGlobal ["16Rnd_9x21_Mag", 50];

	// Launchers
	_vAmmo addweaponCargoGlobal ["launch_NLAW_F", 5];
	_vAmmo addWeaponCargoGlobal ["launch_B_Titan_F", 1];
	_vAmmo addWeaponCargoGlobal ["launch_B_Titan_short_F", 3];

	// Rockets/Missiles
	_vAmmo addMagazineCargoGlobal ["NLAW_F", 10];
	_vAmmo addMagazineCargoGlobal ["Titan_AT", 10];
	_vAmmo addMagazineCargoGlobal ["Titan_AP", 5];
	_vAmmo addMagazineCargoGlobal ["Titan_AA", 5];

	// Demo/Explosives
	_vAmmo addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
	_vAmmo addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 10];
	_vAmmo addMagazineCargoGlobal ["ATMine_Range_Mag", 5];
	_vAmmo addMagazineCargoGlobal ["APERSBoundingMine_Range_Mag", 5];

	// Weapon mountings
	_vAmmo addItemCargoGlobal ["acc_pointer_IR", 10];
	_vAmmo addItemCargoGlobal ["optic_ACO", 10];
	_vAmmo addItemCargoGlobal ["optic_DMS", 2];
	_vAmmo addItemCargoGlobal ["optic_NVS", 2];
	_vAmmo addItemCargoGlobal ["acc_flashlight", 10];
	_vAmmo addItemCargoGlobal ["muzzle_snds_H", 10];

	// GL Ammo
	_vAmmo addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell", 25];
	_vAmmo addMagazineCargoGlobal ["3Rnd_Smoke_Grenade_shell", 25];
	_vAmmo addMagazineCargoGlobal ["3Rnd_UGL_FlareCIR_F", 25]; 

	// Grenades
	_vAmmo addMagazineCargoGlobal ["HandGrenade", 50]; 	 
	_vAmmo addMagazineCargoGlobal ["SmokeShell", 50]; 	 
	_vAmmo addMagazineCargoGlobal ["SmokeShellGreen", 25]; 	 
	_vAmmo addMagazineCargoGlobal ["SmokeShellRed", 25]; 

	// Medical Items
	_vAmmo addItemCargoGlobal ["FirstAidKit", 50];
	_vAmmo addItemCargoGlobal ["Medikit", 2];

	// Optical/Bino's/Goggles
	_vAmmo addWeaponCargoGlobal ["Rangefinder", 2];
	_vAmmo addWeaponCargoGlobal ["Binocular", 10];
	_vAmmo addItemCargoGlobal ["G_Tatical_Clear", 5];
	_vAmmo addItemCargoGlobal ["G_Shades_Black" ,5];
	_vAmmo addItemCargoGlobal ["NVGoggles", 10];

	// ACRE and cTAB
	_vAmmo addItemCargoGlobal ["ACRE_PRC148", 20];
	_vAmmo addItemCargoGlobal ["ACRE_PRC119", 5];
	_vAmmo addItemCargoGlobal ["ItemcTab", 2];
	_vAmmo addItemCargoGlobal ["ItemAndroid", 10];

	// Gear kit (not working from crates/veh)
	_vAmmo addBackpackCargoGlobal ["B_Carryall_Base", 10];
	_vAmmo addBackpackCargoGlobal ["B_AssaultPack_blk", 10];
	_vAmmo addBackpackCargoGlobal ["B_Kitbag_mcamo", 5];

	// Misc items
	_vAmmo addItemCargoGlobal ["ItemGPS", 10];

	//hintSilent "vAmmo loaded."; // For debug only.

	sleep 600;

}; // close while alive