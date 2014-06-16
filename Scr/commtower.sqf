sleep 5;

hintSilent parseText "<t color='#A1A4AD' align='left'>All radar towers and radar equipment have been tagged.<br/><br/>Blizzard is on station for a missile strike.</t>";

//add trigger on server (hosted or dedicated)

if (isServer) then { 
	trBlizzard = createTrigger ["EmptyDetector", getPos ttRadar];
	publicVariable "trBlizzard"; //setup trigger on every client
}; 
	
if (!isDedicated) then {
	waitUntil {!isNil "trBlizzard"};
	trBlizzard setTriggerType "NONE";
	trBlizzard setTriggerActivation ["DELTA", "PRESENT", false];
	trBlizzard setTriggerArea [0,0,0,false];
	trBlizzard setTriggerStatements ["this", "0 = execVM 'Scr\missilestrike.sqf';",""];
	trBlizzard setTriggerText "Blizzard - missile strike";
};





