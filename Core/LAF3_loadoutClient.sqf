/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Loadout Client
Author: Whiztler
Script version: 3.0 Alpha 12

Game type: n/a
File: LAF3_loadutClient.sqf
****************************************************************
NOTE: Gear loads on actual players only. Does not load on AI's!!
****************************************************************/

#include "LAF3_JIP.sqf"

If (!IsDedicated) exitWith {
		if (local player) exitWith {
			waitUntil {time > 1};
		
			call compile preprocessFileLineNumbers "Core\L\LAF3_LoadoutWest.sqf";
						
			_unit = player;
			_vn = name vehicle player; 
			_chk = nil; _uStr = nil; _u = nil; _s = nil; _t = nil; _r = nil;
			
			// Check if the player is a LAF3 unit
			_chk = toLower str (vehicle _unit); _chk = toArray _chk; _chk resize 4;
			if ((toString _chk != "opc_") && (toString _chk != "fox_") && (toString _chk != "wolf") && (toString _chk != "mdev") && 
				(toString _chk != "knig") && (toString _chk != "rapt") && (toString _chk != "grem")
			) exitWith {[_unit] call NotDef;}; // Undefined unit > load infantry gear
			
			// Split the player variable into Squad, Unit, Role
			_uStr = str _unit;
			_u = [_uStr, "_"] call CBA_fnc_split;
			_s = toLower (_u select 0);
			_t = _u select 1;
			_r = toLower (_u select 2);			
			
			// Company default loadout configuration
			clearItemCargoGlobal (uniformContainer _unit); clearMagazineCargoGlobal (uniformContainer _unit); clearWeaponCargoGlobal (uniformContainer _unit); sleep 0.05;
			clearItemCargoGlobal (vestContainer _unit); clearMagazineCargoGlobal (vestContainer _unit); clearWeaponCargoGlobal (vestContainer _unit); sleep 0.05;
			clearItemCargoGlobal (backpackContainer _unit); clearMagazineCargoGlobal (backpackContainer _unit); clearWeaponCargoGlobal (backpackContainer _unit); sleep 0.05;
			removeAllWeapons _unit; removeAllAssigneditems _unit; removeHeadgear _unit; removeVest _unit; removeBackpack _unit; sleep 0.05;
			_unit addWeapon "ItemMap"; _unit addWeapon "ItemWatch"; _unit addWeapon "ItemCompass"; _unit addWeapon "NVGoggles"; sleep 0.05;
						
			// Load the appropriate Squad/Role gear 
			if (_s == "opc") exitWith {[_s,_t,_r] call LAF3_fnc_sCmd;};
			if (_s == "fox") exitWith {[_s,_t,_r] call LAF3_fnc_sInf;};
			if (_s == "wolf") exitWith {[_s,_t,_r] call LAF3_fnc_sSpecop;};
			if (_s == "knight") exitWith {[_s,_t,_r] call LAF3_fnc_sCav;};
			if (_s == "raptor") exitWith {[_s,_t,_r] call LAF3_fnc_sAir;};
			if (_s == "gremlin") exitWith {[_s,_t,_r] call LAF3_fnc_sSup;};
			if (_s == "mdev") exitWith {_unit addVest "V_Rangemaster_belt"; _unit unassignItem "NVGoggles"; _unit addWeapon "Laserdesignator"; _unit addMagazine "Laserbatteries";}; // Mission Maker Test Slot
			
		};// close if local player
}; // close !isDedi


