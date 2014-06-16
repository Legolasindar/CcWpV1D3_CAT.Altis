/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Mission Balancer
Author: Whiztler
Script version: 1.0

Game type: COOP
File: LAF3_fnc_missionBalancer.sqf
****************************************************************
This script is called as a function. It checks for the number of
online clients (connected playable units) and assigns a variable
based on the number of clients playing.
This way you can spawn enemies based on the number of player thus
creating some form of balance.

For instance. In your script that you use to spawn enemies you
control the number of enemies spawn by:

If (LAF3_mb_normal || LAF3_mb_heavy) then {
//your enemy spawn code for a 'normal' or 'heavy' balance goes here...
};

If (LAF3_mb_lite) then {
//your enemy spawn code for a 'lite' balance goes here...
};

There are three variables:

LAF3_mb_lite - Lite, less than 16 players
LAF3_mb_normal - Normal, More than 15 and less than 22 players
LAF3_mb_heavy - Heavy, 22 or more players

You can change the numbers in below LAF3_fnc_missionBalance function

Instructions:
The script should be executed from you init.sqf

At the top of your script that you use to spawn enemies put:
call LAF3_fnc_missionBalance;

Then use the If (LAF3_mb_normal) then {//yourCode }; for balanced
enemy spawn on demand.
****************************************************************/

// init	the vars
LAF3_mb_lite = false;
LAF3_mb_normal = false;
LAF3_mb_heavy = false;

if !(isServer) exitWith {};

// Game Balance function
LAF3_fnc_missionBalance = {
	// Set game balance vars based on the amout of playable units
	
	// Lite - less than 16 players
	if ((count playableUnits) < 16) then {LAF3_mb_lite = true; misbal = "Lite";};

	// Normal - More than 15 and less than 22 players
	if ((count playableUnits > 15) && (count playableUnits < 22)) then {LAF3_mb_normal = true; misbal = "Normal";};

	// Heavy - 22 or more players
	if ((count playableUnits) > 21) then {LAF3_mb_heavy = true; misbal = "Heavy";};
		
	if (true) exitWith {}; // All done here. Exit
};

waitUntil {time > 100};

call LAF3_fnc_missionBalance;

// Display info on mission start
HintSilent parseText format ["
	<t color='#2E80C6' size='1.5'>Mission Balance</t><br/><br/>
	<t color='#A1A4AD' align='left'>Mission Balance activated.</t><br/><br/>
	<t color='#A1A4AD' align='left'>Current mission Balance: </t>
	<t color='#FFFFFF' align='left'>%1</t><br/><br/>
",misbal];

if (true) exitWith {}; // All done here. Exit