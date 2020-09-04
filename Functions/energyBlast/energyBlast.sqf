//[center,raduis,duration] execVM energyBlast;  center - object
if !(isServer) exitWith {};
_handle = execVM "Functions\getRandomPos.sqf";
waitUntil {scriptDone _handle};

_center = _this select 0;
_radius = _this select 1;
_duration = _this select 2;
_blowDuration = _this select 3;
_bombAmount = _this select 4;
[[_center,_radius,_duration,_blowDuration,_bombAmount],"Functions\energyBlast\floatEffect.sqf"] remoteExec ["execVM"];


//suck
_isBlow = false;
_current_time = time;
_height = (getPos _center) select 2;
_radius = sqrt (_height*_height + _radius*_radius);
while {time < (_current_time+_duration+((_blowDuration*_bombAmount*2)+2))} do
{
	_nearby_units = (getPos _center) nearEntities [["Man", "Air", "Car", "Tank"], _radius];
	{
		_unit = _x;
		_pos = getPos _x;
		_unit allowDammage false;
		_vectorDir = [_pos,getPos _center] call bis_fnc_vectorFromXtoY;
		_velocity = [_vectorDir,4] call bis_fnc_vectorMultiply;
		_unit setVelocity _velocity;
	}foreach _nearby_units;


	if (time > ((_current_time+_duration)) AND !(_isBlow)) then
	{
		_height = (getPos _center) select 2;
		_blowPosList = [];
		for "_i" from 1 to _bombAmount do 
		{
			_randomPos = [getPos _center,25,10,random [_height-7,_height,_height+7]] call getRandomPos;
			_blowPosList set [(count _blowPosList),_randomPos];
		};
		[[_blowPosList,_blowDuration],"Functions\energyBlast\flashAndBlow.sqf"] remoteExec ["execVM"];
		_isBlow = true;
	};
	sleep 0.1;
};
_nearby_units = (getPos _center) nearEntities [["Man", "Air", "Car", "Tank"], _radius+8];
{_x allowDammage true;_x setDammage 1} foreach _nearby_units;
_secondBlowPos = getPos _center;
_secondBlowPos set [2,0];
deleteVehicle _center;
sleep 1;
[_secondBlowPos,"Functions\energyBlast\secondExplosion.sqf"] remoteExec ["execVM"];
sleep 6;
_secondExplosion = "Bo_GBU12_LGB_MI10" createVehicle _secondBlowPos;
