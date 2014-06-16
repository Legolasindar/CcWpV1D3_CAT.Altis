roundscomplete = false;
hintSilent parseText "<t color='#A1A4AD' align='left'>Blizzard: Fire mission received. Fire for Effect, R, F, High Explosive</t>";
sleep 5;
hintSilent parseText "<t color='#A1A4AD' align='left'>Blizzard: R, F, High Explosive in effect, 8 rounds out</t>";
sleep 5;
hintSilent parseText "<t color='#A1A4AD' align='left'>Blizzard: Shot out</t>";
sleep 5;
hintSilent parseText "<t color='#A1A4AD' align='left'>Blizzard: Splash in 40</t>";
sleep 35;
hintSilent parseText "<t color='#A1A4AD' align='left'>Blizzard: Splash out</t>";
sleep 5;

waitUntil {roundscomplete};
sleep 2;
hintSilent parseText "<t color='#A1A4AD' align='left'>Blizzard: Rounds complete. End of fire mission</t>";
commtwr = 1; publicVariable "commtwr";
