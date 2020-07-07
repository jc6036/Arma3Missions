["High Command", "Add Group to Blufor", { blu_gamemaster hcSetGroup [group (_this select 1)]; hint "Group added!"; }] call Ares_fnc_RegisterCustomModule;
["High Command", "Add Group to Opfor", { opf_gamemaster hcSetGroup [group (_this select 1)]; hint "Group added!"; }] call Ares_fnc_RegisterCustomModule;
["High Command", "Add Group to Independant", { ind_gamemaster hcSetGroup [group (_this select 1)]; hint "Group added!"; }] call Ares_fnc_RegisterCustomModule;

["High Command", "Remove Group from Blufor", { blu_gamemaster hcRemoveGroup group (_this select 1); hint "Group removed!"; }] call Ares_fnc_RegisterCustomModule;
["High Command", "Remove Group from Opfor", { opf_gamemaster hcRemoveGroup group (_this select 1); hint "Group removed!"; }] call Ares_fnc_RegisterCustomModule;
["High Command", "Remove Group from Independant", { ind_gamemaster hcRemoveGroup group (_this select 1); hint "Group removed!"; }] call Ares_fnc_RegisterCustomModule;

["High Command", "Clear Blufor Command", { hcRemoveAllGroups blu_gamemaster; hint "Command cleared!"; }] call Ares_fnc_RegisterCustomModule;
["High Command", "Clear Opfor Command", { hcRemoveAllGroups opf_gamemaster; hint "Command cleared!"; }] call Ares_fnc_RegisterCustomModule;
["High Command", "Clear Independant Command", { hcRemoveAllGroups ind_gamemaster; hint "Command cleared!"; }] call Ares_fnc_RegisterCustomModule;
