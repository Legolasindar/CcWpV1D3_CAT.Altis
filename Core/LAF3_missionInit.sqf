/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Mission initialization countdown timer
Author: Whiztler
Script version: 1.1

Game type: n/a
File: LAF3_missionInit.sqf
****************************************************************
Instructions:

This script is executed from the init.sqf. Set the number of secs
that the timer needs to run in the init.sqf. E.g.:
[45] execVM "Core\LAF3_missionInit.sqf"; 
****************************************************************/

if (time > 300) exitWith {missionInit = true;publicVariable "missionInit";};

// Init
_cnt = 0;
_TimerInput = _this select 0;
_timer = _TimerInput / 100;
missionInit = false;

while {(_cnt != 100)} do {
	_cnt = _cnt + 1;
	sleep _timer;
	hintSilent parseText format ["<br/><t align='left'><t size='1.1' color='#A1A4AD'>Iniciant Missió: </t><t size='1.1' color='#F7D358'>%1&#0037;</t><t size='1.1' align='left' color='#A1A4AD'> fet<br/><br/>- No vos moveu!<br/>- No utilitzeu l'ACRE!<br/>- Follow TL orders<br/>- L'Init dura aprox. %2 secs</t><br/><br/>", _cnt,_TimerInput];
};

hint parseText format ["<br/><t size='1.1' color='#FFFFFF' align='left'>Inicialització de la missió completada</t><t size='1' align='left' color='#A1A4AD'><br/><br/>- No vos moveu!<br/>- No utilitzeu l'ACRE!<br/>- Follow TL orders<br/>- L'Init dura aprox. %1 secs</t><br/><br/>",_TimerInput];
sleep 3; hintSilent ""; missionInit = true; publicVariable "missionInit";
 