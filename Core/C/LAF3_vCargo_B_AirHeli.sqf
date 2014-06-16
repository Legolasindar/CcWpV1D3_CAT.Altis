/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Vehicle Cargo Script (BLUEFOR) (BLUEFOR) - Helicopter
Author: Whiztler
Script version: 1.4

Game type: n/a
File: LAF3_vCargo_B_AirHeli.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the vehicle:
null = [this] execVM "Core\C\LAF3_vCargo_B_AirHeli.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle cargo. 
****************************************************************/



sleep 40; // let other scripts settle in

// Init
_vAmmo = _this select 0;

if (!isServer) exitWith {};

// Settings 
clearWeaponCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init
clearMagazineCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init
clearItemCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init

// Magazines primary weapon
_vAmmo addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 10];

// Demo/Explosives
_vAmmo addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 2];

// Grenades
_vAmmo addMagazineCargoGlobal ["HandGrenade", 5]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShell", 15]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellGreen", 10]; 	 

// Medical Items
_vAmmo addItemCargoGlobal ["FirstAidKit", 5];

// ACRE and cTAB
_vAmmo addItemCargoGlobal ["ACRE_PRC148", 1];

// Gear kit 
_vAmmo addItemCargoGlobal ["B_Parachute", 15];

//hintSilent "vAmmo loaded."; // For debug only.