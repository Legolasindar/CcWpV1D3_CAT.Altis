/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Vehicle Cargo Script (BLUEFOR) - Medical Truck/Ambulance
Author: Whiztler
Script version: 1.4

Game type: n/a
File: LAF3_vCargo_B_TruckMedi.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the vehicle:
null = [this] execVM "Core\C\LAF3_vCargo_B_TruckMedi.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle cargo. 
****************************************************************/



sleep 39; // let other scripts settle in

// Init
_vAmmo = _this select 0;

if (!isServer) exitWith {};

// Settings 
clearWeaponCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init
clearMagazineCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init
clearItemCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init

// Magazines primary weapon
_vAmmo addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 25];

// Grenades
_vAmmo addMagazineCargoGlobal ["SmokeShell", 25]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellGreen", 50];
_vAmmo addMagazineCargoGlobal ["SmokeShellYellow", 10];
_vAmmo addMagazineCargoGlobal ["SmokeShellPurple", 10];
_vAmmo addMagazineCargoGlobal ["SmokeShellRed", 10];
_vAmmo addMagazineCargoGlobal ["SmokeShellBlue", 10];
_vAmmo addMagazineCargoGlobal ["SmokeShellOrange", 10];

// Medical Items
_vAmmo addItemCargoGlobal ["FirstAidKit", 100];
_vAmmo addItemCargoGlobal ["Medikit", 10];

//hintSilent "vAmmo loaded."; // For debug only.