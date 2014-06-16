class CfgORBAT {
	class 7thInfantry {
		id = 7; // Unit ID
		idType = 0; // Unit ID type (0=ordinal number, e.g. "7th"), (1=roman numeral, e.g. "VII"), (2=NATO phonetical alphabet word, e.g. "Golf")
		side = "West";  // Unit side from CfgChainOfCommand >> Sides
		size = "Division";  // Unit size from CfgChainOfCommand >> Sizes
		type = "HQ"; // Unit type from CfgChainOfCommand >> Types
		insignia = "\ca\missions_f\data\orbat\7thInfantry_ca.paa"; // Unit insignia, displayed in ORBAT background and in tooltip
		colorInisgnia[] = {0,0,1,1}; // Insignia image color, white by default (Can be either RGBA array, or class from CfgMarkerColors)
		commander = "Gandalph"; // Name of unit commander
		commanderRank = "GENERAL"; // Rank of unit commander (by default selected based on unit size)
		tags[] = {BIS,USArmy,Kerry,Hutchison,Larkin}; // Group tags. When opening ORBAT viewer, user can define what tags will be accepted.

		// ALTERNATIVE SETTINGS
		// Custom text and short text, can still use some arguments when defined:
		// 	%1 - ID (e.g. "7th")
		// 	%2 - Type (e.g. "Infantry")
		// 	%3 - Size (e.g. "Division")
		text = "%1 Combat Technology Research %3";
		textShort = "%1 CTR %3";
		texture = "\ca\missions_f\data\orbat\customTexture_ca.paa"; // Custom texture, will replace icon set by 'type' param.
		color[] = {0,0,1,1}; // Custom color, will replace color set by 'side' param. (Can be either RGBA array, or class from CfgMarkerColors)
		subordinates[] = {2ndBCT}; // Subordinates, searched on the same level as this class.

		// When 'subordinates' are missing, child classes will be used. They can have their own subs - number of tiers is not limited.
		class 1stBCT
		{
			id = 1;
			type = "Armored";
			size = "BCT";
			side = "West";
			commander = "NATOMen";
			tags[] = {"BLUFOR", "USArmy","Kerry"};
 		};
	};
	class 2ndBCT
	{
	};
};