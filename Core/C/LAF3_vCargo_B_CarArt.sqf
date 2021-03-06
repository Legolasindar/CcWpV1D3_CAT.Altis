/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Vehicle Cargo Script (BLUEFOR) (BLUEFOR) - Storm vehicle loadout (arti)
Author: Whiztler
Script version: 1.4

Game type: n/a
File: LAF3_vCargo_B_CarART.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the vehicle:
null = [this] execVM "Core\C\LAF3_vCargo_B_CarART.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle cargo. 
****************************************************************/

sleep 50; // let other scripts settle in

// Init
_vAmmo = _this select 0;

if (!isServer) exitWith {};

// Settings 
clearWeaponCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init
clearMagazineCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init
clearItemCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init

// Primary weapon
_vAmmo addWeaponCargoGlobal ["arifle_MX_F", 1]; // R

// Magazines primary weapon
_vAmmo addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 10];

// Demo/Explosives
_vAmmo addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 1];

// Vehicle Ammunition
_vAmmo addMagazineCargoGlobal ["8Rnd_82mm_Mo_shells", 20];
_vAmmo addMagazineCargoGlobal ["8Rnd_82mm_Mo_Flare_white", 10];
_vAmmo addMagazineCargoGlobal ["8Rnd_82mm_Mo_Smoke_white", 5];
_vAmmo addMagazineCargoGlobal ["8Rnd_82mm_Mo_guided", 10];
_vAmmo addMagazineCargoGlobal ["8Rnd_82mm_Mo_LG", 10];

// Weapon mountings
_vAmmo addItemCargoGlobal ["acc_pointer_IR", 1];
_vAmmo addItemCargoGlobal ["optic_ACO", 1];
_vAmmo addItemCargoGlobal ["acc_flashlight", 1];

// Grenades
_vAmmo addMagazineCargoGlobal ["HandGrenade", 3]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShell", 5]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellGreen", 3]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellRed", 3]; 

// ACRE and cTAB
_vAmmo addItemCargoGlobal ["ACRE_PRC148", 1];

// Medical Items
_vAmmo addItemCargoGlobal ["FirstAidKit", 5];

//hintSilent "vAmmo loaded."; // For debug only.