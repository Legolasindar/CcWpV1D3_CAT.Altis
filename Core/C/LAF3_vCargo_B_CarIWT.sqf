/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Vehicle Cargo Script (BLUEFOR) (BLUEFOR) - Car Infantry Weapons Team
Author: Whiztler
Script version: 1.4

Game type: n/a
File: LAF3_vCargo_B_CarIWT.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the vehicle:
null = [this] execVM "Core\C\LAF3_vCargo_B_CarIWT.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle cargo. 
****************************************************************/



sleep 22; // let other scripts settle in

// Init
_vAmmo = _this select 0;

if (!isServer) exitWith {};

// Settings 
clearWeaponCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init
clearMagazineCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init
clearItemCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init

// Primary weapon
_vAmmo addWeaponCargoGlobal ["arifle_MX_GL_F", 1]; // GL
_vAmmo addWeaponCargoGlobal ["LMG_mk200_f", 1]; // MG
_vAmmo addWeaponCargoGlobal ["arifle_MXM_F", 1]; // Marksman

// Secondary weapon
_vAmmo addWeaponCargoGlobal ["hgun_P07_F", 1];

// Magazines primary weapon
_vAmmo addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 25];
_vAmmo addMagazineCargoGlobal ["200Rnd_65x39_cased_Box_Tracer", 50]; // MG
_vAmmo addMagazineCargoGlobal ["200Rnd_65x39_cased_Box", 25]; // MG

// Magazines secondary weapon
_vAmmo addMagazineCargoGlobal ["16Rnd_9x21_Mag", 5];

// Static weapon
_vAmmo addItemCargoGlobal ["B_GMG_01_weapon_F", 1];
_vAmmo addItemCargoGlobal ["B_HMG_01_weapon_F", 1];
_vAmmo addItemCargoGlobal ["B_HMG_01_support_F", 2];

// Static weapon Ammunition
_vAmmo addMagazineCargoGlobal ["500Rnd_127x99_mag", 2];
_vAmmo addMagazineCargoGlobal ["40Rnd_20mm_g_belt", 4];

// Launchers
_vAmmo addWeaponCargoGlobal ["launch_B_Titan_F", 2];
_vAmmo addWeaponCargoGlobal ["launch_B_Titan_short_F", 4];

// Rockets/Missiles
_vAmmo addMagazineCargoGlobal ["Titan_AT", 15];
_vAmmo addMagazineCargoGlobal ["Titan_AP", 5];
_vAmmo addMagazineCargoGlobal ["Titan_AA", 5];

// Demo/Explosives
_vAmmo addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 3];
_vAmmo addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 5];
_vAmmo addMagazineCargoGlobal ["ATMine_Range_Mag", 3];
_vAmmo addMagazineCargoGlobal ["APERSBoundingMine_Range_Mag", 3];

// Weapon mountings
_vAmmo addItemCargoGlobal ["acc_pointer_IR", 1];
_vAmmo addItemCargoGlobal ["optic_ACO", 1];
_vAmmo addItemCargoGlobal ["optic_DMS", 2];
_vAmmo addItemCargoGlobal ["optic_NVS", 2];
_vAmmo addItemCargoGlobal ["acc_flashlight", 1];

// GL Ammo
_vAmmo addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell", 5];
_vAmmo addMagazineCargoGlobal ["3Rnd_Smoke_Grenade_shell", 5];
_vAmmo addMagazineCargoGlobal ["3Rnd_UGL_FlareCIR_F", 5]; 

// Grenades
_vAmmo addMagazineCargoGlobal ["HandGrenade", 10]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShell", 10]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellGreen", 5]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellRed", 5]; 

// ACRE and cTAB
_vAmmo addItemCargoGlobal ["ACRE_PRC148", 3];
_vAmmo addItemCargoGlobal ["ItemAndroid", 3];

// Medical Items
_vAmmo addItemCargoGlobal ["FirstAidKit", 5];

// Optical/Bino's/Goggles
_vAmmo addWeaponCargoGlobal ["Binocular", 1];
_vAmmo addItemCargoGlobal ["G_Tatical_Clear", 2];
_vAmmo addItemCargoGlobal ["NVGoggles", 3];

// Gear kit (not working from crates/veh)
_vAmmo addBackpackCargoGlobal ["B_Carryall_Base", 2];

//hintSilent "vAmmo loaded."; // For debug only.