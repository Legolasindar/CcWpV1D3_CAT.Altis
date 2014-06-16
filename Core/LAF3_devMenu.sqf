/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.02 / MAY 2014

Script: Dev Snippets action menu
Author: Whiztler
Script version: 1.0

Game type: COOP
File: LAF3_devMenu.sqf
****************************************************************/

if (isServer) exitWith {
	waitUntil {alive vehicle player};
	player addAction ["<t align='left' color='#C0C0C0'>––[ <t color='#FFFFFF'>LAF3 Dev Snippets<t color='#C0C0C0'> ]––––––",nil];
	player addAction ["<t align='left' color='#F7D358'>Show Units / Veh. / Obj.</t>",{execVM "Core\D\LAF3_snipOjects.sqf";}];
	player addAction ["<t align='left' color='#F7D358'>Show Position</t>",{execVM "Core\D\LAF3_snipPosition.sqf";}];
	player addAction ["<t align='left' color='#F7D358'>Show Distance Object-Player</t>",{execVM "Core\D\LAF3_snipDistance.sqf";}];
	player addAction ["<t align='left' color='#F7D358'>Identify Classname</t>",{execVM "Core\D\LAF3_snipIdClassname.sqf";}];
	player addAction ["<t align='left' color='#F7D358'>Set time +12 hours</t>",{skipTime 12;}];
	player addAction ["<t align='left' color='#F7D358'>Set time -12 hours</t>",{skipTime -12;}];
	player addAction ["<t align='left' color='#F7D358'>Phantom Mode ON/OFF</t>",{if (player != player) exitWith {}; if (captive player) then {player setcaptive false; player allowDamage true; hintsilent "Phantom Mode OFF";} else {player setcaptive true; player allowDamage false; hintsilent "Phantom Mode ON";};}];
	//player addAction ["<t align='left' color='#F7D358'>Teleport</t>",{execVM "Core\D\LAF3_snipTeleport.sqf";}];
	player addAction ["<t align='left' color='#F7D358'>Spawn NATO Weapons Squad", {execVM "Core\D\LAF3_snipSpawnBluefor.sqf";}];
	player addAction ["<t align='left' color='#F7D358'>Spawn CSAT Weapons Squad", {execVM "Core\D\LAF3_snipSpawnOpfor.sqf";}];
	player addAction ["<t align='left' color='#F7D358'>Spawn Hummingbird", { _veh = createVehicle [ "B_Heli_Light_01_F", player modelToWorld [0,10,0], [], 0, "CAN_COLLIDE" ]; _veh setDir (direction player - 90); _veh setVectorUp surfaceNormal position _veh; _veh  setObjectTextureGlobal  [0, "A3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"];}];
	player addAction ["<t align='left' color='#F7D358'>Spawn Hunter", { _veh = createVehicle [ "B_MRAP_01_F", player modelToWorld [0,10,0], [], 0, "CAN_COLLIDE" ]; _veh setDir (direction player - 90); _veh setVectorUp surfaceNormal position _veh; _veh  setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,0,0,1)"]; /*_veh  setObjectTextureGlobal  [1, "#(rgb,8,8,3)color(0.64,0.64,0.64,1)"];*/}];
	player addAction ["<t align='left' color='#F7D358'>Spawn Speedboat", { _veh = createVehicle [ "C_Boat_Civil_01_rescue_F", player modelToWorld [0,10,0], [], 0, "CAN_COLLIDE" ]; _veh setDir (direction player - 90);}];
	player addAction ["<t align='left' color='#C0C0C0'>––––––––––––––––––––––––",nil];
};