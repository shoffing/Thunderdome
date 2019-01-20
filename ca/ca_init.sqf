
// CA - Mission briefing
execVM "ca\briefing\ca_briefing_player.sqf";
if (serverCommandAvailable "#kick") then {
  execVM "ca\briefing\ca_briefing_admin.sqf";
};

// CA - Thermals
// Disable thermal sights for everything
//player addEventHandler ["WeaponAssembled",{(_this select 1) disableTIEquipment true}];
//[] execVM "ca\misc\disableThermals.sqf";

// KK - Who's Marking?
// Show who is messing with markers
// seems to mess up AGM markers
//[] execVM "ca\misc\KK_whosMarking.sqf";

// PabstMirror - Mission Intro
// Credits: PabstMirror
[] execVM "ca\misc\PM_missionIntro.sqf";

// CA - Force First Person
// Disable 3PV regardless of server settings
//[] execVM "ca\misc\forceFirstPerson.sqf";

// WS - AI Flashlights
// Credits: Wolfenswan
// [] execVM "ca\misc\forceFlashLightAI.sqf";

// Headless join in progress support.
_ishc = !hasInterface && !isDedicated;
if (_ishc) then {
    [] spawn ca_fnc_hcmarker;
};
if (_ishc && didJIP) then {
	if (!ca_hc) then {
		remoteExec ["ca_fnc_hcinit", 2];
	};
};

/*
if (isServer) then {
	_side = east; // Optional, to be defined in a parameter, use ca\core\fn_setparams for now.
    _faction = "opf_f";
	//predefined teams according to F3 array.
	_FTA = ["ftl","ar","r","r","r"];
	_FTB = ["ftl","r","ar","r","r"];
	//_UAZ = "rhs_uaz_open_MSV_01";
	//_VC = ["r","r","r"]; //VC = Vehicle Crew

	//predefined markers
	// Marker meanings: FT = Fireteam, AP = A Patrol, AF, A fortify, where A is Fire team A
    _fireteamAParray = ["FT_AP",10] call ca_fnc_getmarkerarray;
	_fireteamAFarray = ["FT_AF","FT_AF_1","FT_AF_2","FT_AF_3","FT_AF_4","FT_AF_5","FT_AF_6","FT_AF_7","FT_AF_8","FT_AF_9","FT_AF_10"];
	//_VCuazArray = ["VC_UP","VC_UP"]; // Vehicle Crew_UAZ Patrol

	//actually spawn the enemies spawn or call doesn't matter, might lag badly if using call on local hosting, so we use spawn.
	[_fireteamAParray,_FTA,300] spawn ca_fnc_masspatrol;
	[_fireteamAFarray,_FTA] spawn ca_fnc_massfortify;
	//[_VCuazArray,_VC,_UAZ,500] spawn ca_fnc_massvehiclepatrol;

    //Optional way of manually setting faction or side, this is normally done automatically so don't bother unless you want to! [_VCuazArray,_VC,_UAZ,500,_faction,_side] spawn ca_fnc_massvehiclepatrol;
};
*/
