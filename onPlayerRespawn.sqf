# Housekeeping to ensure that respawn doesn't fuck anything up.
player setUnitLoadout (player getVariable ["Saved_Loadout",[]]);
player enableFatigue false;
player enableStamina false;
player allowSprint true;
player setUnitTrait ["medic",true];
player setUnitTrait ["engineer",true];
player setUnitTrait ["explosiveSpecialist",true];
