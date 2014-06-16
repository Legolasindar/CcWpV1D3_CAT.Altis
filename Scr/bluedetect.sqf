{
	if (side _x == EAST) then {
		_x setBehaviour "AWARE";
		_x setCombatMode "RED";
		_x setskill 0.65;
		hintSilent parseText"
			<t color='#A1A4AD' align='left'>Big Foot: Satnav reports reports increased activity at and around the objective. You may have been detected. Do not let the package get away! Out.</t>
		";
	};
	if(side _x == EAST && _x isKindOf "Man") then {
		_x addEventHandler ["killed", {_this call LAF3_fnc_AddKill}];
	};
} forEach allUnits;


// {if (side _x == EAST) then {_x setBehaviour "AWARE"}} forEach ((getPosATL ObjectName) nearEntities ["All", 200]);