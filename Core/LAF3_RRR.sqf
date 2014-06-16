/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Reload/Rearm/Repair Script
Author: Xeno (Adapted for A3 by Whiztler)
Script version: 1.1

Game type: N/A
File: LAF3_RRR.sqf
****************************************************************
Instructions:

Create a trigger, make it the size of the service area. Set it to
Activation Anybody Present
Repeat

For Helicopters:
Condition: ("Helicopter" countType thislist  > 0) && ((getpos (thislist select 0)) select 2 < 1)
On activation: _xhandle= [(thislist select 0)] execVM "Core\LAF3_RRR.sqf";

For Airplanes:
Condition: (("Plane" countType thislist  > 0) || ("airplane" countType thislist  > 0) || ("airplanex" countType thislist  > 0)) && ((getpos (thislist select 0)) select 2 < 1) && (speed (thislist select 0) < 10)
On activation: _xhandle= [(thislist select 0)] execVM "Core\LAF3_RRR.sqf";

For Vehicles:
Condition: ("LandVehicle" countType thislist  > 0) && ((getpos (thislist select 0)) select 2 < 1)
On activation: _xhandle= [(thislist select 0)] execVM "Core\LAF3_RRR.sqf";
****************************************************************/

private ["_config","_count","_i","_magazines","_object","_type","_type_name","_driver","_vehType"];

_object = _this select 0;
_type = typeof _object;

if (_object isKindOf "ParachuteBase") exitWith {};
if (!alive _object) exitWith {};

if ((_object isKindOf "Plane") || (_object isKindOf "Helicopter")) then {
	_driver = "Pilot";
	_vehType = "aircraft";
} else {
	_driver = "Driver";
	_vehType = "vehicle";
};


x_repair_time_factor = 60;
x_reload_time_factor = 10;
x_refuel_time_factor = 60;

_object setFuel 0;
_type_name = typeOf _object;

_object vehicleChat format ["Servicing %1", _type];
_object vehicleChat format ["%1, please switch off your engine and remain in the %2", _driver, _vehType];
_object vehicleChat "Servicing can take up to 6 minutes.";

sleep 5;

_magazines = getArray(configFile >> "CfgVehicles" >> _type >> "magazines");

if (count _magazines > 0) then {
	_removed = [];
	{
		if (!(_x in _removed)) then {
			_object removeMagazines _x;
			_removed = _removed + [_x];
		};
	} forEach _magazines;
	{
		_object vehicleChat format ["Reloading %1", _x];
		sleep x_reload_time_factor;
		if (!alive _object) exitWith {};
		_object addMagazine _x;
	} forEach _magazines;
};

_count = count (configFile >> "CfgVehicles" >> _type >> "Turrets");

if (_count > 0) then {
	for "_i" from 0 to (_count - 1) do {
		scopeName "xx_reload2_xx";
		_config = (configFile >> "CfgVehicles" >> _type >> "Turrets") select _i;
		_magazines = getArray(_config >> "magazines");
		_removed = [];
		{
			if (!(_x in _removed)) then {
				_object removeMagazines _x;
				_removed = _removed + [_x];
			};
		} forEach _magazines;
		{
			_object vehicleChat format ["Reloading %1", _x];
			sleep x_reload_time_factor;
			if (!alive _object) then {breakOut "xx_reload2_xx"};
			_object addMagazine _x;
			sleep x_reload_time_factor;
			if (!alive _object) then {breakOut "xx_reload2_xx"};
		} forEach _magazines;
		// check if the main turret has other turrets
		_count_other = count (_config >> "Turrets");

		if (_count_other > 0) then {
			for "_i" from 0 to (_count_other - 1) do {
				_config2 = (_config >> "Turrets") select _i;
				_magazines = getArray(_config2 >> "magazines");
				_removed = [];
				{
					if (!(_x in _removed)) then {
						_object removeMagazines _x;
						_removed = _removed + [_x];
					};
				} forEach _magazines;
				{
					_object vehicleChat format ["Reloading %1", _x]; 
					sleep x_reload_time_factor;
					if (!alive _object) then {breakOut "xx_reload2_xx"};
					_object addMagazine _x;
					sleep x_reload_time_factor;
					if (!alive _object) then {breakOut "xx_reload2_xx"};
				} forEach _magazines;
			};
		};
	};
};

_object setVehicleAmmo 1;	// Reload turrets / drivers magazine
sleep x_reload_time_factor;

if (!alive _object) exitWith {};
if ((damage _object) < .9) then {
	_object vehicleChat "Repairing...";
	_object setDamage 0;
	sleep x_repair_time_factor;
} else {
	_object vehicleChat "No repair services required.";
	sleep 2;
};

if (!alive _object) exitWith {};
_object vehicleChat "Refueling...";
sleep x_refuel_time_factor;
while {fuel _object < 0.95} do {
	//_object setFuel ((fuel _vehicle + 0.1) min 1);
	_object setFuel 1;
	sleep 0.01;
};

if (!alive _object) exitWith {};
_object vehicleChat format ["%1 is ready...", _type_name];

if (true) exitWith {};