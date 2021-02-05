// Obviously you can put whatever you want into init.sqf, but this version is for a certain freeform zeus mission I've made.
["High Command", "Add Group to Blufor", { blu_gamemaster hcSetGroup [group (_this select 1)]; hint "Group added!"; }] call zen_custom_modules_fnc_register;
["High Command", "Add Group to Opfor", { opf_gamemaster hcSetGroup [group (_this select 1)]; hint "Group added!"; }] call zen_custom_modules_fnc_register;
["High Command", "Add Group to Independant", { ind_gamemaster hcSetGroup [group (_this select 1)]; hint "Group added!"; }] call zen_custom_modules_fnc_register;

["High Command", "Remove Group from Blufor", { blu_gamemaster hcRemoveGroup group (_this select 1); hint "Group removed!"; }] call zen_custom_modules_fnc_register;
["High Command", "Remove Group from Opfor", { opf_gamemaster hcRemoveGroup group (_this select 1); hint "Group removed!"; }] call zen_custom_modules_fnc_register;
["High Command", "Remove Group from Independant", { ind_gamemaster hcRemoveGroup group (_this select 1); hint "Group removed!"; }] call zen_custom_modules_fnc_register;

["High Command", "Clear Blufor Command", { hcRemoveAllGroups blu_gamemaster; hint "Command cleared!"; }] call zen_custom_modules_fnc_register;
["High Command", "Clear Opfor Command", { hcRemoveAllGroups opf_gamemaster; hint "Command cleared!"; }] call zen_custom_modules_fnc_register;
["High Command", "Clear Independant Command", { hcRemoveAllGroups ind_gamemaster; hint "Command cleared!"; }] call zen_custom_modules_fnc_register;
