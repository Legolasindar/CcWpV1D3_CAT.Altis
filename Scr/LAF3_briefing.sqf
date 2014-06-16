/****************************************************************
L.A.M.B.S. Mission Framework
LAF3 version: 1.01 / APR 2014

Script: Mission Briefing
Author: Whiztler
Script version: 1.0

Game type: COOP
File: LAF3_Briefing.sqf
****************************************************************
Instructions:

Note the reverse order of topics. Start from the bottom.
Change the "Text goes here..." line with your info. Use a <br/> to
start a new line.
****************************************************************/

#include "LAF3_JIP.sqf"

player createDiarySubject ["LAF3","LAF3"];
player createDiaryRecord ["LAF3",["L.A.M.B.S Arma 3 Framework","
<br/><br/>L.A.M.B.S ARMA3 Framework<br/>
LAF3 version: 1.02 / MAY 2014
<br/><br/>
"]];

///// CREDITS

player createDiaryRecord ["Diary",["Credits","
Wolfpack Vol. 1 by Whiztler // www.nopryl.no<br/><br/>
"]];

///// SUPPORT & LOGISTICS

player createDiaryRecord ["Diary",["M.O.B. & Logistics","

*** PLAYER RESPAWN / PLAYER JIP ***<br/><br/>
No respawn available.<br/>
JIP is disabled. New players join as seagull.

<br/><br/>*** PLAYER LOADOUT ***<br/><br/>
Pre-defined, role-specific loadout.<br/>
Make sure you bring a lot of demo equipment from Nikko's supply.

<br/><br/>*** VEHICLE RESPAWN ***<br/><br/>
No respawn available.

<br/><br/>*** VEHICLE SUPPLY CARGO ***<br/><br/>
Not applicable.

<br/><br/>*** TRANSPORT ARRANGEMENTS ***<br/><br/>
Wet insertion<br/>
Exfil to be briefed on-site.
"]];


///// SIGNAL & COMMS

player createDiaryRecord ["Diary",["COMMUNICACIONS I SENYALS","

*** RADIO COMMS ***<br/><br/>

Wolf 1: CH 1 201Hz<br/>
Wolf 2: CH 2 202Hz<br/>
Wolf 3: CH 3 203Hz<br/>
Alter.: CH 4 401Hz<br/>

<br/><br/>*** SENYALS ***<br/><br/>
Fum blanc - ocultament amb fum. Sense significat<br/>
Fum verd - Senyal de zona segura<br/>
Fum vermell - Senyal de zona hostil (posició coneguda)<br/>
Fum taronja -  Senyal de zona hostil (posició desconeguda)<br/>
Fum lila  - Senyal tropes aliades al fum, hostils aprop<br/><br/>

Llum química verda - Assegurat / Netejat (en edificis)<br/>
Llum química vermella - No segur / No netejat (en edificis))
"]];


///// TACTICAL PLAN & EXECUTION

player createDiaryRecord ["Diary",["Tactical / Execution","

*** CONCEPT OF OPERATIONS ***<br/><br/>
The area of operations is partly urban. This will provide opportunity to approach the objectives covertly. Some of the properties are used as CSAT army barracks.<br/>
Weather forecast is similar to yesterday. Slight fog, moderate wind.<br/><br/>

You'll meet Nikko at the RV. He'll update you with the latest ground intel,<br/>
TOC will support with up to date Satnav intel.

<br/><br/>*** TACTICAL MOVEMENT ***<br/><br/>
AT's will relocate in a bounding fashion unless otherwise ordered. Command troop will provide cover and support for the AT's. TOC wants you to take out the power station first before you engage the communications station.<br/>
Control points, BP's and routes will be briefed on-site by SSC.

<br/><br/>*** ARMAMENT/SUBMINISTRES ***<br/><br/>
En cas de ser ferits durant la insercció el nostré contacte tindrà subministres mèdics.<br/>
DEVGRU TOC / Satnav will be monitoring the op. 

<br/><br/>*** OPERACIONS ESPECIALS ***<br/><br/>
No hi ha cap altre operació disponible.

<br/><br/>*** SUPPORT ***<br/><br/>
Per determinar durant la missió.
"]];


///// OBJECTIVES

player createDiaryRecord ["Diary",["Objectives","

*** OBJECTIUS ***<br/><br/>
Primari: Sabotage de la estació de comunicacions.<br/>
Secundari: Sabotage de la central elèctrica.
"]];


///// SITUATION

player createDiaryRecord ["Diary",["Situation","

*** SUMMARY ***<br/><br/>
CSAT's primary communications station is based on the outskirts of Kavala. It is essential we disrupt communications before we commence the NATO invasion. The nearby power station provides power to the communications station. We need to take both out in order to be sure that their communications ability stays frozen from a while.

<br/><br/>*** INTEL ON ENEMY FORCES ***<br/><br/>
The communications station is moderately protected. The station itself is located on a hill. The main security forces patrol the immediate area.<br/>
The power station has a permanent security detail. The power station also functions as an interim military base, although TOC suggests that the garrison is on maneuver elsewhere.

<br/><br/>*** NATO FORCES ***<br/><br/>
Three troops:<br/>
One command troop - SSC, marksman, squadron paramedic and a recon/UAV specialist.<br/>
Two assault troops (AT) - Troop Leader and 4 Assault Specialists<br/><br/>

There will be no support on this op as well. This is a 'plausible deniability' op. We cannot offer any help or assistance if you get caught. You are on your own. You know the drill.<br/><br/>
Wolf 4 (call sign Birdie) is on a recon op near Pyrgos on the south eastern peninsula.
"]];