/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.01 / APR 2014

Script: Crate Cargo Script (BLUEFOR) - Demolition
Author: Whiztler
Script version: 1.1

Game type: n/a
File: LAF3_cCargo_B_Demo.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the crate:
null = [this] execVM "Core\C\LAF3_cCargo_B_Demo.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle cargo. 
****************************************************************/

sleep 5; // let other scripts settle in

_crate = _this select 0;
_crate allowDamage false;

if (isServer) exitWith {
	// Init
	_dem = 25;

	// Settings 
	clearWeaponCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init
	clearMagazineCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init
	clearItemCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init

	// Demo/Explosives
	_crate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", _dem];
	_crate addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", _dem];
	_crate addMagazineCargoGlobal ["ATMine_Range_Mag", _dem];
	_crate addMagazineCargoGlobal ["APERSBoundingMine_Range_Mag", _dem];
	_crate addMagazineCargoGlobal ["APERSMine_Range_Mag", _dem];
	_crate addMagazineCargoGlobal ["APERSTripMine_Wire_Mag", _dem];
	_crate addMagazineCargoGlobal ["SLAMDirectionalMine_Wire_Mag", _dem];
	_crate addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", _dem];
	_crate addItemCargoGlobal ["MineDetector", 2];
};

