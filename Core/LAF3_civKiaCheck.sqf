/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Civilian KIA Check
Author: Shuko (Adapted for A3 by Whiztler)
Script version: 1.3

Game type: N/A
File: LAF3_civKiaCheck.sqf
****************************************************************
Instructions:

This script checks for the number of civilians being killed
by BlueFor. When a civilian is KIA, a warning message is displayed.
The location is marked on the map with a green mil-dot.
****************************************************************/

civKia = 0;
if (isServer) then {
	fnc_civkia_EH = {
		private ["_side","_kiaPos"];
		_kiaPos = getPos (_this select 0);
		_side = side (_this select 1);
		civKiller = _this select 1;
		if (rating civKiller < 0) then {civKiller addRating 9999; publicVariable "civKiller";}; 
		if (_side == WEST) then {
			civKia = civKia + 1;
			publicVariable "civKia"; publicVariable "civKiller";
			mKia = createMarker [format ["m_civKia_%1", civKia], _kiaPos];
			mKia setMarkerShape "ICON"; mKia setMarkerType "mil_dot"; mKia setMarkerColor "ColorCIV"; mKia setMarkerText format ["%1",civKia];
			publicVariable "mKia";			
		}
	};{
		if ((side _x == Civilian) && (_x iskindof "Man")) then {
		  _x addEventhandler ["killed",fnc_civkia_EH];
		};
	} foreach allUnits;
} else {
	fnc_civKia_msg = {hintSilent parseText format ["
		<t color='#A1A4AD' align='left'>Brigada: un civil ha estat mort en combat per </t>
		<t color='#FFFFFF' align='left'>%1 </t>
		<t color='#A1A4AD' align='left'>(%2)</t><br/><br/>
		<t color='#A1A4AD' align='left'>El nombre total de civils morts és de: </t>
		<t color='#FFFFFF' align='left' size='1.2'>%3 </t><br/><br/>
		<t color='#A1A4AD' align='left' size='1'>Els Civils KIA seran marcats amb un </t>
		<t color='#AE1AB0' align='left' shadow='1.2'>punt lila</t>
		", name vehicle civKiller, civKiller, civKia];
	};
  "civKia" addPublicVariableEventHandler {call fnc_civKia_msg}; // JIP compatible EH
};