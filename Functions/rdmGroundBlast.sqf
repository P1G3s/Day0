randGroundBlast=
{
	_centre = getPosASL (_this select 0);
	_radius = _this select 1;
	_rounds = _this select 2;
	for "_i" from 1 to _rounds do
	{
		_times  = random 1;
		_randRadius = _radius * _times;
		_angle = random 359;
		_bomb = "M_Mo_82mm_AT" createVehicle 
				[
				(_centre select 0)+(sin _angle)*_randRadius,
				(_centre select 1)+(cos _angle)*_randRadius,
				500
				];
		[_bomb,-85,0] call bis_fnc_setpitchbank;
		sleep random [0,1,2];
	};
};