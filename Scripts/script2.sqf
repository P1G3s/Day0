if !(isServer) exitWith{};
//spawn missile
missile1 = "M_Scalpel_AT" createVehicle  getPos spawnPos;
publicVariable "missile1";
waitUntil 
{
	_targetPos = getPos reclaim_heli;
	_targetPos set [2,(_targetPos select 2)+2];
	_pitch = acos((missile1 distance2D reclaim_heli)/(missile1 distance reclaim_heli));
	_vectorDir = [getPos missile1,_targetPos] call bis_fnc_vectorFromXtoY;
	_velocity = [_vectorDir,180] call bis_fnc_vectorMultiply;
	[missile1,_pitch,0] call bis_fnc_setpitchbank;
	missile1 setvectordir _vectorDir;
	missile1 setVelocity _velocity;
	(getDammage reclaim_heli == 1) OR (isNull missile1)
};
_smoke = "test_EmptyObjectForSmoke" createVehicle (getPosASL reclaim_heli);
_smoke attachTo [reclaim_heli,[0,0,2.5]];
reclaim_heli setVelocity [8*sin ((getDir reclaim_heli)+90),8*cos ((getDir reclaim_heli)+90),0];
reclaim_heli allowDammage true;
reclaim_heli setDammage 0.8; 
reclaim_heli setHit ["mortor",1]; 
reclaim_heli setHit ["elektronika",1]; 
reclaim_heli setHit ["velka vrtule",1]; 
reclaim_heli setHit ["mala vrtule",1]; 
reclaim_heli setHit ["fuel_hit",1]; 
{_x setDammage 1;} foreach crew reclaim_heli;
reclaim_heli setCenterOfMass [4,2,1];
sleep 2;


//ambush

Acar1 setPos (getPos carPad1);
Acar1 enableAI "MOVE";
Acar1 enableAI "AUTOTARGET";
{_x setSkill 0.1;}foreach (crew Acar1);
{_x setPos (getPos trooperPad1);sleep 1;}foreach [man1,man2,man3,man4,man5];
Acar1 doMove getPos center1;
(group man1) addWaypoint [center1,10];


//mine
_flag = false;
_time = time+20;
waitUntil 
{
	if(Acar1 distance2d center1 < 15)then
	{
		Acar1 doMove getPos center1;
		_mine = "ClaymoreDirectionalMine_Remote_Ammo_Scripted" createVehicle getPos Acar1;
		_mine setDammage 1;
		Acar1 setHit ["wheel_1_1_steering",1];
		Acar1 setHit ["wheel_2_1_steering",1];
		Acar1 setHit ["wheel_1_2_steering",1];
		(driver Acar1) disableAI "MOVE";
		_flag = true;
	};
	sleep 0.75;
	_flag OR (time>_time)
};


sleep 8;
[blast1,50,10,0.2,8]execVM "Functions\energyBlast\energyBlast.sqf";

