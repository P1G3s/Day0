//create bomb
[true] remoteExec ["enableCamShake"];
[[5, 30, 7]] remoteExec ["addCamShake"];
_bomb = "SatchelCharge_Remote_Ammo_Scripted" createVehicle (evac_heli modelToWorld [4,2,1]);
_bomb setdamage 1;
sleep 0.1;
evac_heli allowDammage True;
sleep 0.1;


//Dammage heli
evac_heli setDammage 0.4;
evac_heli setHit ["engine_hit",0.8];
evac_heli setHit ["elektronika",1];
evac_heli setHit ["velka vrtule",1];
evac_heli setHit ["mala vrtule",1];
["warning"] remoteExec ["playMusic"];


//smoke
_smoke = "test_EmptyObjectForSmoke" createVehicle (getPosASL evac_heli);
_smoke attachTo [evac_heli,[0,0,0]];
sleep 2.5;
driver evac_heli setDammage 1;

waitUntil {((getPosASL evac_heli) select 2) < 5};
[""] remoteExec ["playMusic"];
deleteVehicle evac_heli;
deleteVehicle _smoke;

["Functions\playMusic.sqf"] remoteExec ["execVM"];
sleep 1;
//{_x setPos [0,0,0]}foreach playableUnits;
skipTime 18;
sleep 9;



