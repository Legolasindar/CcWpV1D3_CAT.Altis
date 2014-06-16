/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Kill Counter
Author: Whiztler
Script version: 1.0

Game type: n/a
File: LAF3_killCnt.sqf
****************************************************************
Instructions:

Logs player killed (who killed what/who)
****************************************************************/

LAF3_fnc_killCntUpdate = {_cID = owner player; LAF3_killCnt = LAF3_killCnt + 1;/*_cID publicVariableClient "LAF3_killCnt";*/};
LAF3_fnc_AddKill = {_v = _this select 0; _k = _this select 1; if(_k == player) then {call LAF3_fnc_killCntUpdate;};};

// Copy below snippet into your spawn scripts (paste at bottom of script) in order to add the EH to all Opfor units
/* 
{
	if(side _x == EAST && _x isKindOf "Man") then {
		_x addEventHandler ["killed", {_this call LAF3_fnc_AddKill}];
	};
} forEach allUnits;
*/	
	

/*	
To do:

if (isServer) then 
{
    _unit = _this select 0;
    _killer = _this select 1;

    //only real kills
    if (isPlayer _unit && isPlayer _killer) then
    {
        //no selfkill
        if(getPlayerUID _unit != getPlayerUID _killer) then
        {
            //teamkill
            if ((faction _unit) == (faction _killer)) then
            {
                //["tk","displayMessage",_killer,false] spawn BIS_fnc_MP;
            }
            else
            {
                if (_killer isKindOf "Man") then
                {
                    player_stats_add = [100,1,0];
                    owner _killer publicVariableClient "player_stats_add";
                }
                else
                {
                    player_stats_add = [100,1,0];
                    _crew = crew _killer;
                    {owner _x publicVariableClient "player_stats_add";} forEach _crew;
                };
                
                player_stats_add = [0,0,1];
                owner _unit publicVariableClient "player_stats_add";
            };
        }
        else
        {
            player_stats_add = [0,0,1];
            owner _unit publicVariableClient "player_stats_add";
        };
    }; 
};  


*/