     jump_alt = _this select 0;
     jump_safety = _this select 1;
     _pole = _this select 2;
     fnc_orient = {_obj = _this select 0;
                   _y = _this select 1;
                   _p = _this select 2;
                   _r = _this select 3;
                   _a = _this select 4;
                   _b = _this select 5;
                   _c = _this select 6;
        _obj setVectorDirAndUp [
        [ sin _y * cos _p,cos _y * cos _p,sin _p],
        [[ sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D
        ]
     };
     _pole addAction ["<t color='#2222ff'>HALO jump</t>",{
       openmap [true,false];
       titleText["Select Map Position", "PLAIN"];
       bpk = createVehicle ["WeaponHolderSimulated",getPosATL player,[],0,"CAN_COLLIDE"];
       if (backpack player !="") then {
        bpk addBackpackCargoGlobal [backpack player, 1];
        [] spawn {
         ["chute_bpk", "onEachFrame", {
          if (!isNull bpk) then {
           call{
            if (stance player == "UNDEFINED") exitWith {
               bpk attachTo [player,[-0.1,-0.05,-0.7],'leaning_axis'];
              [bpk,0,-180,0,0,0,0] remoteExec ["fnc_orient"]};
            if (stance player == "STAND") exitWith {
               bpk attachTo [player,[-0.1,0.75,-0.05],'leaning_axis'];
              [bpk,0,-90,0,0,0,0] remoteExec ["fnc_orient"]};
          };
         };
        }] call BIS_fnc_addStackedEventHandler;
       };
      };
       onMapSingleClick "player setPos [_pos select 0,_pos select 1, jump_alt];
       [player, [missionNamespace, 'inv']] call BIS_fnc_saveInventory;
        player setVariable ['MGI_ammo1',player ammo (primaryWeapon player)];
        player setVariable ['MGI_ammo2',player ammo (handgunWeapon player)];
        player setVariable ['MGI_ammo3',player ammo (secondaryWeapon player)];
        player setVariable ['MGI_mags',magazinesAmmoFull player];
        player setVariable ['MGI_weapon',currentWeapon player];
       removeBackpackGlobal player;
       player addBackpack 'B_parachute';
       openmap [false,false];
       [] spawn {
         waitUntil {(getpos player select 2) < jump_safety or isTouchingGround player};
         if (!isTouchingGround player) then {player action ['OpenParachute', player]};
         waitUntil {isTouchingGround player};
         if (!isnull bpk) then {
           detach bpk;
           deleteVehicle bpk};
         sleep 2;
         if (alive player) then {
           [player, [missionNamespace, 'inv']] call BIS_fnc_loadInventory;
           {player removeMagazine _x} forEach magazines player;
           player setAmmo [primaryWeapon player, 0];
           player setAmmo [handGunWeapon player, 0];
           player setAmmo [secondaryWeapon player, 0];
           {if (((player getVariable 'MGI_mags') select _foreachindex select 3) <= 0) then {
             player addMagazine [_x select 0,_x select 1]}} forEach (player getVariable 'MGI_mags');
           player setAmmo [primaryWeapon player,player getVariable 'MGI_ammo1'];
           player setAmmo [handGunWeapon player,player getVariable  'MGI_ammo2'];
           player setAmmo [secondaryWeapon player,player getVariable 'MGI_ammo3'];
           player selectWeapon (player getVariable 'MGI_weapon')
         };
       }
      onMapSingleClick '';
      false"},nil, 5,false, true,"","vehicle _this == _this"];