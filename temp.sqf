_smoke setParticleParams [
["\A3\data_f\cl_fireD", 1, 0, 1],//ShapeName 
"",                              //AnimationName
"Billboard",                     //Type
1,                               //TimerPeriod
10,                              //LifeTime
[0, 0, 2],                       //Position
[0, 0, 0],                       //MoveVelocity
0,                               //RotationVelocity
10,                              //Weight
7.85,                            //Volume
0.375,                           //Rubbing
[_size,2*_size],                 //Size
[[.1, .1, .1, .75],[0.78, 0.76, 0.71, 0]],              //Color          
[0.08],                          //AnimationPhase
1,                               //RandomDirectionPeriod
0,                               //RandomDirectionIntensity
"",                              //OnTimer
"",                              //BeforeDestroy
_thingToFling                    //Object
];



0=[]spawn 
{ 
 drop2 allowDammage false; 
 _fire = "test_EmptyObjectForFireBig" createVehicle (getPosASL drop2);  
 _fire attachTo [drop2,[0,0,-2]]; 
 sleep 14; 
 _velocity = velocity drop2;
 _bomb = "SatchelCharge_Remote_Ammo_Scripted" createVehicle getPos drop2;
 _bomb attachTo [drop2,[0,0,1]];
 _bomb setdamage 1;
 sleep 0.1;
 [drop2,0,0] call bis_fnc_setpitchbank;
 drop2 setVelocity _velocity;
 waitUntil 
 {	 
	 _pos1 = getPos drop2;
	 sleep 0.05;
	 _pos1 select 2 < 4
 };
 _pos1 = getPos drop2;
 deleteVehicle _fire;
 _bombPos = getPos drop2;
 _bombPos set [2,0];
 _bomb = "Bo_GBU12_LGB_MI10" createVehicle _bombPos;
 sleep 0.1;
 [drop2,0,0] call bis_fnc_setpitchbank;
 drop2 setVelocity [0,0,0];
}; 



drop2 setVectorDir [0,0,-1];
	 drop2 setVelocity [0,0,_velocity select 2];
	 _velocity set [2,(_velocity select 2)-15];




if (isServer) then {comment "Exported from Arsenal by Goblin"; 
 
comment "Remove existing items"; 
removeAllWeapons this; 
removeAllItems this; 
removeAllAssignedItems this; 
removeUniform this; 
removeVest this; 
removeBackpack this; 
removeHeadgear this; 
removeGoggles this; 
 
comment "Add containers"; 
this forceAddUniform "U_I_G_resistanceLeader_F"; 
for "_i" from 1 to 2 do {this addItemToUniform "rhs_mag_30Rnd_556x45_Mk318_Stanag";}; 
this addVest "V_Chestrig_blk"; 
for "_i" from 1 to 6 do {this addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";}; 
for "_i" from 1 to 6 do {this addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";}; 
for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_M433_HEDP";}; 
this addBackpack "B_FieldPack_blk"; 
for "_i" from 1 to 2 do {this addItemToBackpack "FirstAidKit";}; 
for "_i" from 1 to 3 do {this addItemToBackpack "DemoCharge_Remote_Mag";}; 
this addHeadgear "rhsusf_Bowman"; 
this addGoggles "G_Lowprofile"; 
 
comment "Add weapons"; 
this addWeapon "rhs_weap_mk18_m320"; 
this addPrimaryWeaponItem "rhsusf_acc_SF3P556"; 
this addPrimaryWeaponItem "rhsusf_acc_anpeq15_wmx_light"; 
this addPrimaryWeaponItem "rhsusf_acc_eotech_552"; 
this addWeapon "rhsusf_weap_m9"; 
this addWeapon "Binocular"; 
 
comment "Add items"; 
this linkItem "ItemMap"; 
this linkItem "ItemCompass"; 
this linkItem "ItemWatch"; 
this linkItem "ItemRadio"; 
this linkItem "ItemGPS"; 
 

this setIdentity "p1";};


0=[]spawn{
	for "_1" from 1 to 2 do
	{
		"M_Mo_82mm_AT" createVehicle getPos car111;
		sleep 1.5;
		
	}
}

/*
0=[]spawn {_smoke = "test_EmptyObjectForSmoke" createVehicle (getPosASL wreck1); 
_smoke attachTo [wreck1,[5,-13,0]];}
*/


 _mud = "#particlesource" createVehicle (getPos drop2);
 _mud setParticleCircle [0, [0, 0, 0]];
 _mud setParticleRandom [0, [1, 1, 0], [20, 20, 15], 3, 0.25, [0, 0, 0, 0.1], 0, 0];
 _mud setParticleParams [["\A3\data_f\ParticleEffects\Universal\Mud.p3d", 1, 0, 1], "", "SpaceObject", 1, 12.5, [0, 0, 0], [0, 0, 15], 5, 100, 7.9, 1, [.45, .45], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", drop2,0,false,0.3];
 _mud setDropInterval 0.04;


 [
	 intel2,
	 "Upload data",
	 "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
	 "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
	 "_this distance _target < 3",
	 "_caller distance _target < 3",
	 {},
	 {},
	 {hint "complete"}, 
	 {}, 
	 [],
	 12,
	 0,
	 true,
	 false
 ] remoteExec ["BIS_fnc_holdActionAdd"];