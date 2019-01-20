// CA - Briefing
// ====================================================================================
if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};
_briefing = "";
_briefing = _briefing + "
<font size='20'>Marker Controls</font><br/><br/>

|- <execute expression=""if(leader player == player) then { [(netId group player)] remoteExec ['ca_fnc_groupMarker', (side player)];} else {hint 'You are not the group leader!'};"">
Create new marker for my group(Leader only)</execute><br/><br/>
|- <execute expression=""if(leader player == player) then {_handle=createdialog 'ca_groupid'; } else {hint 'You are not the group leader!'};"">
Change marker status(Leader only)</execute><br/>
|- <execute expression=""_handle=createdialog 'ca_respawndiag';"">
Respawn system</execute><br/>
|- <execute expression=""if (serverCommandAvailable '#kick') then { [] execvm 'ca\briefing\ca_briefing_admin.sqf'}else {hint 'You need to be an admin to get this!'};"">
Give self admin menu</execute><br/>

";
// ====================================================================================

// CREATE DIARY ENTRY

player createDiaryRecord ["diary", ["CA Player Controls",_briefing]];

// ====================================================================================
