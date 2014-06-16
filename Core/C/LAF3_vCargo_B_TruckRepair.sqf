/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Vehicle Cargo Script (BLUEFOR) (BLUEFOR) - Repair Truck
Author: Whiztler
Script version: 1.4

Game type: n/a
File: LAF3_vCargo_B_TruckRepair.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the vehicle:
null = [this] execVM "Core\C\LAF3_vCargo_B_TruckRepair.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle cargo. 
****************************************************************/



sleep 35; // let other scripts settle in

// Init
_vAmmo = _this select 0;

if (!isServer) exitWith {};

// Settings 
clearWeaponCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init
clearMagazineCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init
clearItemCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init

// Magazines primary weapon
_vAmmo addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 25];
_vAmmo addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", 10];
_vAmmo addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag_tracer", 10]; // LMG
_vAmmo addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag", 5]; // LMG
_vAmmo addMagazineCargoGlobal ["200Rnd_65x39_cased_Box_Tracer", 5]; // MG
_vAmmo addMagazineCargoGlobal ["200Rnd_65x39_cased_Box", 5]; // MG

// Demo/Explosives
_vAmmo addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 2];
_vAmmo addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 1];

// Grenades
_vAmmo addMagazineCargoGlobal ["HandGrenade", 5]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShell", 5]; 	 

// Medical Items
_vAmmo addItemCargoGlobal ["FirstAidKit", 5];

// Misc items
_vAmmo addItemCargoGlobal ["ToolKit", 25];

//hintSilent "vAmmo loaded."; // For debug only.