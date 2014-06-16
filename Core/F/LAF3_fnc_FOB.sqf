// FOB functions

LAF3_fnc_fobDeploy = { // deploy the fob
	if (MHQ_FOB_deployed) exitWith { // Exit with a message if the FOB already is deployed
		HintSilent parseText "
			<t color='#2E80C6' size='1.5'>Mobile HQ</t><br/><br/>
			<t color='#A1A4AD' align='left'>The F.O.B. is already deployed</t><br/>
		";		
	};
	
	if (speed MHQ > 1) exitWith {  // Exit with a message if the the MHQ is not stationary
		HintSilent parseText "
			<t color='#2E80C6' size='1.5'>Mobile HQ</t><br/><br/>
			<t color='#A1A4AD' align='left'>The MHQ needs to be stationary for the F.O.B. to be deployed!</t><br/>
		";
	};
	
	// Remove the FOB deploy action menu item 
	MHQ removeAction MHQ_FOB_deployAction;	
	MHQ setFuel 0; // Once deployed, remove the fuel so the MHQ cannot elope
	
	HintSilent parseText "
		<t color='#2E80C6' size='1.5'>Mobile HQ</t><br/><br/>
		<t color='#A1A4AD' align='left'>Deploying the F.O.B.</t><br/>
	";
	sleep 5;
	hint "";
	
	// Add the FOB packUp action menu item
	MHQ_FOB_PackupAction = MHQ addAction ["<t align='left' color='#CEE5F6'>Pack up the F.O.B.</t>",{[[],"LAF3_fnc_fobPackUp"] call BIS_fnc_MP;},[],-98,false,true,"",""];
	
	if (!isServer) exitWith {};
	private ["_MHQ_FOB_dir","_MHQ_FOB_objects"];
	_MHQ_FOB_dir = getDir MHQ;
	
	_MHQ_FOB_objects = [
		["Flag_NATO_F",[-5.23633,0.240234,0],70,1,0,[],"","",true,false], 
		["Land_Pallet_MilBoxes_F",[5.23633,2.33203,0],90,1,0,[],"","",true,false], 
		["CamoNet_BLUFOR_F",[6.56055,-0.185547,1],90,1,0,[],"","",true,false], 
		["B_supplyCrate_F",[6.91406,-0.630859,0],0,1,0,[],"","",true,false], 
		["Land_Pallet_MilBoxes_F",[7.19336,2.43555,0],70,1,0,[],"","",true,false], 
		["Land_PaperBox_open_full_F",[6.25,4.49609,0],10,1,0,[],"","",true,false], 
		["Land_Cargo20_military_green_F",[-7.71875,-0.671875,0],90,1,0,[],"","",true,false], 
		["Land_HBarrierBig_F",[-0.175781,-8.28125,0],0,1,0,[],"","",true,false], 
		["Land_HBarrier_3_F",[-7.64063,5.05859,0],90,1,0,[],"","",true,false], 
		["Land_HBarrierBig_F",[-0.0683594,9.27734,0],0,1,0,[],"","",true,false], 
		["Land_HBarrier_3_F",[-7.67578,-4.50586,0],90,1,0,[],"","",true,false], 
		["Land_HBarrierBig_F",[11.9688,3.82813,0],70,1,0,[],"","",true,false], 
		["Land_HBarrierBig_F",[12.0762,-4.19727,0],110,1,0,[],"","",true,false]
	];
	[position MHQ,_MHQ_FOB_dir,_MHQ_FOB_objects] call BIS_fnc_ObjectsMapper;	
	
	MHQ_FOB_deployed = true; publicVariable "MHQ_FOB_deployed"; // Announce that the FOB has been deployed
	
	[] spawn LAF3_fnc_MHQ_lastPos; // update LastPos
	[] spawn LAF3_fnc_MHQ_PlayerRespawnPos; // update respawn_west
};
	
LAF3_fnc_fobPackUp = { // pack up the fob
	MHQ removeAction MHQ_FOB_PackupAction;	
	
	HintSilent parseText "
		<t color='#2E80C6' size='1.5'>Mobile HQ</t><br/><br/>
		<t color='#A1A4AD' align='left'>Packing up the F.O.B.</t><br/>
	";
	sleep 5;
	hint "";
	
	MHQ setFuel 1; // FOB packed up, Adding fuel back to the MHQ
	MHQ_FOB_deployed = false; publicVariable "MHQ_FOB_deployed"; // Announce that the FOB has been packed up		
	// Add the FOB deploy action menu item
	MHQ_FOB_deployAction = MHQ addAction ["<t align='left' color='#CEE5F6'>Deploy the F.O.B.</t>",{[[],"LAF3_fnc_fobDeploy"] call BIS_fnc_MP;},[],-98,false,true,"",""];
	
	[[],"LAF3_fnc_fobDeleteObj"] spawn BIS_fnc_MP; // Romove all the FOB items (Camo netting, H-Barriers, etc)
};

LAF3_fnc_fobDeleteObj = {
	if (!isServer) exitWith {};
	
	private ["_delArray","_del"];
	_delArray = ["Flag_NATO_F","Land_Pallet_MilBoxes_F","CamoNet_BLUFOR_F","B_supplyCrate_F","Land_Pallet_MilBoxes_F","Land_PaperBox_open_full_F","Land_Cargo20_military_green_F","Land_HBarrierBig_F","Land_HBarrier_3_F"];
	_del = nearestObjects [getPos MHQ,_delArray,14];
	
	while {true} do { // Delete the FOB objects
		{deleteVehicle _x;} forEach _del;		
	};
	
	// FOB has been packup completely. Let's update the marker functions:
	[] spawn LAF3_fnc_MHQ_lastPos; // update LastPos
	[] spawn LAF3_fnc_MHQ_PlayerRespawnPos; // update respawn_west
};
