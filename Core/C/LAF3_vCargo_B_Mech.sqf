/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Vehicle Cargo Script (BLUEFOR) (BLUEFOR) - Mechanized vehicles
Author: Whiztler
Script version: 1.4

Game type: n/a
File: LAF3_vCargo_B_Mech.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the vehicle:
null = [this] execVM "Core\C\LAF3_vCargo_B_Mech.sqf";

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

// Magazines primary weapon
_vAmmo addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 10];
_vAmmo addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag_tracer", 3]; // LMG

// Launchers
_vAmmo addweaponCargoGlobal ["launch_NLAW_F", 1];

// Rockets/Missiles
_vAmmo addMagazineCargoGlobal ["NLAW_F", 2];

// Demo/Explosives
_vAmmo addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 1];
_vAmmo addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 1];

// Grenades
_vAmmo addMagazineCargoGlobal ["HandGrenade", 3]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShell", 5]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellGreen", 5]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellRed", 3]; 

// ACRE and cTAB
_vAmmo addItemCargoGlobal ["ACRE_PRC148", 1];

// Medical Items
_vAmmo addItemCargoGlobal ["FirstAidKit", 5];

// Optical/Bino's/Goggles
_vAmmo addItemCargoGlobal ["NVGoggles", 1];

//hintSilent "vAmmo loaded."; // For debug only.