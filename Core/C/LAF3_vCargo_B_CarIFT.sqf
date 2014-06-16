/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Vehicle Cargo Script (BLUEFOR) (BLUEFOR) - Car Infantry Fire Team
Author: Whiztler
Script version: 1.4

Game type: n/a
File: LAF3_vCargo_B_CarIFT.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the vehicle:
null = [this] execVM "Core\C\LAF3_vCargo_B_CarIFT.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle cargo. 
****************************************************************/



sleep 20; // let other scripts settle in

// Init
_vAmmo = _this select 0;

if (!isServer) exitWith {};

// Settings 
clearWeaponCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init
clearMagazineCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init
clearItemCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init

// Primary weapon
_vAmmo addWeaponCargoGlobal ["arifle_MX_F", 2]; // R
_vAmmo addWeaponCargoGlobal ["arifle_MX_GL_F", 1]; // GL
_vAmmo addWeaponCargoGlobal ["arifle_MX_SW_F", 1]; // LMG

// Magazines primary weapon
_vAmmo addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 50];
_vAmmo addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag_tracer", 10]; // LMG

// Launchers
_vAmmo addweaponCargoGlobal ["launch_NLAW_F", 1];

// Rockets/Missiles
_vAmmo addMagazineCargoGlobal ["NLAW_F", 5];

// Demo/Explosives
_vAmmo addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 1];
_vAmmo addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 3];
_vAmmo addMagazineCargoGlobal ["ATMine_Range_Mag", 2];
_vAmmo addMagazineCargoGlobal ["APERSBoundingMine_Range_Mag", 3];

// Weapon mountings
_vAmmo addItemCargoGlobal ["acc_pointer_IR", 5];
_vAmmo addItemCargoGlobal ["optic_ACO", 5];
_vAmmo addItemCargoGlobal ["acc_flashlight", 5];

// GL Ammo
_vAmmo addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell", 10];
_vAmmo addMagazineCargoGlobal ["3Rnd_Smoke_Grenade_shell", 5];
_vAmmo addMagazineCargoGlobal ["3Rnd_UGL_FlareCIR_F", 5]; 

// Grenades
_vAmmo addMagazineCargoGlobal ["HandGrenade", 10]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShell", 10]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellGreen", 15]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellRed", 10]; 

// ACRE and cTAB
_vAmmo addItemCargoGlobal ["ACRE_PRC148", 1];

// Medical Items
_vAmmo addItemCargoGlobal ["FirstAidKit", 5];

// Optical/Bino's/Goggles
_vAmmo addWeaponCargoGlobal ["Binocular", 1];
_vAmmo addItemCargoGlobal ["NVGoggles", 3];

// Gear kit 
_vAmmo addBackpackCargoGlobal ["B_Carryall_Base", 1];
_vAmmo addBackpackCargoGlobal ["B_AssaultPack_blk", 1];

//hintSilent "vAmmo loaded."; // For debug only.