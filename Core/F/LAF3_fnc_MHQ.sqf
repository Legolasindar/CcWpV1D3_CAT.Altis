// MHQ functions

LAF3_fnc_MHQ_respawnClient = { // Function fired up by the 'KILLED' eventhandler when the MHQ is destroyed
	MHQ_respawnLeft = MHQ_respawnLeft - 1;	
	if (MHQ_respawnLeft != 0) then { // There are still MHQ vehicle respawns left
		HintSilent parseText format ["
			<t color='#2E80C6' size='1.5'>Mobile HQ</t><br/><br/>
			<t color='#A1A4AD' align='left'>The mobile HQ was destroyed. The mobile HQ will respawn in</t>
			<t color='#FFFFFF' align='left'> %1 </t>
			<t color='#A1A4AD' align='left'>minutes.</t><br/><br/>
			<t color='#A1A4AD' align='left'>Mobile HQ respawns left:</t>
			<t color='#FFFFFFm' align='left'> %2 </t><br/>
		",(MHQ_respawn_time / 60),MHQ_respawnLeft];

		if (MHQ_FOB_deployed) then { // Clean up the FOB if the MHQ was destroyed whilst the FOB was deployed
			[[],"LAF3_fnc_fobDeleteObj"] spawn BIS_fnc_MP;		
		};

		MHQ_FOB_deployed = false; publicVariable "MHQ_FOB_deployed"; // Announce that the FOB is no longer deployed
		
		[[],"LAF3_fnc_MHQ_respawn"] spawn BIS_fnc_MP; // Load the MHQ respawn function
		
	} else { // All mobile HQ respawns used!
		HintSilent parseText format ["
			<t color='#2E80C6' size='1.5'>Mobile HQ</t><br/><br/>
			<t color='#A1A4AD' align='left'>The mobile HQ was destroyed. There are</t>
			<t color='#FFFFFF' align='left'> no </t>
			<t color='#A1A4AD' align='left'>more Mobile HQ reinforcements left.</t><br/><br/>
			<t color='#A1A4AD' align='left'>The new player respawn position is now at grid: </t>
			<t color='#FFFFFF' align='left'>%1 %2</t><br/>
		",round (MHQ_lastPos select 0),round (MHQ_lastPos select 1)];
		
		[[],"LAF3_fnc_MHQ_FinalSpawn"] call BIS_fnc_MP;	// Create a permanent player respawn location
	};
	
	if (true) exitWith {}; 
};

LAF3_fnc_MHQ_lastPos = {  // Create the last safe MHQ position marker (updated every 1 minute)
	while {alive MHQ && MHQ_FOB_deployed} do {
		MHQ_lastPos = getPosATL MHQ; publicVariable "MHQ_lastPos";
		if (LAF3_MHQ_debug) then {player sideChat format ["MHQ LastPos set",str MHQ_lastPos];};
		sleep 60; // 1 minute
	};	
	if (true) exitWith {}; // Exit when MHQ is moving or FOB is not deployed
};

LAF3_fnc_MHQ_PlayerRespawnPos = { // Attach the respawn_west marker to the FOB (updated every 10 seconds)
	while {alive MHQ && MHQ_FOB_deployed} do {
		private ["_posMHQ"];
		_posMHQ = getPosATL MHQ;
		"respawn_west" setMarkerPos [(_posMHQ select 0) + 3, (_posMHQ select 1) + 3, 0];				
		sleep 10;
	};
	
	"respawn_west" setMarkerPos MHQ_lastPos; // last safe MHQ position in case MHQ is destroyed or on the move
	
	if (true) exitWith {};
};

LAF3_fnc_MHQ_MHQmarker = {	// Attach the HQ Flag marker to the Bobcat HQ vehicle (updated every half second when on the move)
	while {alive MHQ} do {
		"mMHQ" setMarkerPos getPosATL MHQ;
		if (speed MHQ > 0) then {sleep .5;} else {sleep 5}; // Marker refresh time		
	};

	deleteMarker "mMHQ"; // MHQ is destroyed, delete the Flag Marker
	if (LAF3_MHQ_debug) then {player sideChat "MHQ Flag marker deleted";};
	if (true) exitWith {};
};

LAF3_fnc_MHQ_respawn = {
	if (isServer) then {
		MHQ = nil; // destroy the MHQ variable		
		sleep MHQ_respawn_time; // MHQ vehicle respawn time as configured in init.sqf
		
		MHQ = createVehicle [MHQ_vehicle,MHQ_orgPos, [], 0, "none"]; publicVariable "MHQ"; // Create a new MHQ
		MHQ setDir MHQ_dir;
		
		_m = createMarker ["mMHQ",MHQ_orgPos]; _m setMarkerShape "ICON"; _m setMarkerType "b_hq"; // Create a new 'HQ flag' marker
		if (LAF3_MHQ_debug) then {player sideChat "MHQ Respawn: vehicle created";};
		
		[[],"LAF3_fnc_MHQ_addEH"] call BIS_fnc_MP; // Add a new KILLED eventhandler to the MHQ
		[MHQ] execVM "Core\C\LAF3_vCargo_B_TruckAmmo.sqf"; // Load the supplies
		
		if (LAF3_MHQ_debug) then {player sideChat "MHQ Respawn: re-loading functions...";};
		[] spawn LAF3_fnc_MHQ_lastPos; // reload to update with new data
		[] spawn LAF3_fnc_MHQ_PlayerRespawnPos; // reload to update with new data
		[] spawn LAF3_fnc_MHQ_MHQmarker; // reload to update with new data
		[[],"LAF3_fnc_MHQ_respawned"] call BIS_fnc_MP; // Display a message that the MHQ has respawned
		
		if (LAF3_MHQ_debug) then {player sideChat "MHQ Respawn: done (server)";};
		if (true) exitWith {};
	};
};

LAF3_fnc_MHQ_addEH = { // re-add the EH and AddAction (new spawned MHQ)
	_MHQ_EH = MHQ addEventHandler ["killed", {[] spawn LAF3_fnc_MHQ_respawnClient;}];
	MHQ addAction ["<t align='left' color='#CEE5F6'>Deploy the F.O.B.</t>",{[[],"LAF3_fnc_fobDeploy"] call BIS_fnc_MP;},[],-98,false,true,"",""];
};

LAF3_fnc_MHQ_respawned = { // Display a hint that the MHQ has respawned
	HintSilent parseText format ["
		<t color='#2E80C6' size='1.5'>Mobile HQ</t><br/><br/>
		<t color='#A1A4AD' align='left'>Mobile HQ respawned at grid:</t><br/>
		<t color='#FFFFFF' align='left'>%1 %2</t><br/>
	",round (MHQ_orgPos select 0), round (MHQ_orgPos select 1)];
	sleep 10;
	HintSilent parseText "
		<t color='#2E80C6' size='1.5'>Mobile HQ</t><br/><br/>
		<t color='#A1A4AD' align='left'>Loading MHQ supplies...</t><br/>
	";	
	sleep 20;
	HintSilent parseText "
		<t color='#2E80C6' size='1.5'>Mobile HQ</t><br/><br/>
		<t color='#A1A4AD' align='left'>MHQ supplies loaded.</t><br/>
	";
	sleep 5;
	hint "";
	if (true) exitWith {};	
};

LAF3_fnc_MHQ_FinalSpawn = { // All MHQ's destroyed. Create marker to show final player respawn location
	if (!isServer) exitWith {};
	_m = createMarker ["finalSpawn",getMarkerPos "respawn_west"];
	_m setMarkerShape "ICON"; 
	_m setMarkerType "respawn_inf";	
	_m setMarkerColor "ColorWEST";
	_m setMarkerText "Reinforcements";
	if (true) exitWith {};
};

if (LAF3_MHQ_debug) then {player sideChat "Functions loaded"};