closeAirSupport=
{
	_mrk = _this select 0; //_this select 0;  //Marker or object
	_planeClass = "B_Plane_CAS_01_dynamicLoadout_F";  //Plane Type
	_dis = 3000;
	_alt = 1000;
	_dir = 45;
	_pitch = atan (_dis / _alt);
	_speed = 450/3.6;
	_mrkPos = getPosASL _mrk;
	_alt = _alt + (_mrkPos select 2);
	_spawnPos = [_mrkPos,_dis,_dir]call BIS_fnc_relPos;
	_spawnPos set [2,_alt];
	//weaponsList
	_missile = true;
	_GBUbomb = false;
	_gatling = true;
	_countMissile = 2;


	//Spawn vehicle
	_planeArray = [_spawnPos,_dir+180,_planeClass,WEST] call BIS_fnc_spawnVehicle;
	_plane = _planeArray select 0;
	_plane setPosASL _spawnPos;
	_plane disableai "target";
	_plane disableai "autotarget";
	_plane setcombatmode "blue";
	_plane move ([_mrkPos,_dis,_dir+180]call BIS_fnc_relPos);
	_vectorDir = [getPosASL _plane,_mrkpos] call bis_fnc_vectorFromXtoY;
	_velocity = [_vectorDir,_speed] call bis_fnc_vectorMultiply;
	_plane setvectordir _vectorDir;
	_plane setVelocity _velocity;
	[_plane,-90 + _pitch,0] call bis_fnc_setpitchbank;


	//Keep direction and velocity
	waituntil 
	{
		_isFireComplete = false;
		_vectorDir = [getPosASL _plane,_mrkpos] call bis_fnc_vectorFromXtoY;
		_velocity = [_vectorDir,_speed] call bis_fnc_vectorMultiply;		
		_plane setvectordir _vectorDir;
		_plane setVelocity _velocity;
		[_plane,-90 + _pitch,0] call bis_fnc_setpitchbank;
	

	//Fire
		if(_mrkPos distance (getPos _plane) < 900) then
		{
			//_mrkPos set [2,(_mrkPos select 2)-2];
			_planeDriver = driver _plane;
			_timeToStop = time + 3;
			_target = createvehicle ["LaserTargetC",_mrkPos,[],0,"none"];
			_plane reveal lasertarget _target;
			_plane dowatch lasertarget _target;
			_plane dotarget lasertarget _target;

			//Fire Gatling
			if(_gatling)then
			{
				waituntil 
				{
					_vectorDir = [getPosASL _plane,_mrkPos] call bis_fnc_vectorFromXtoY;
					_velocity = [_vectorDir,_speed] call bis_fnc_vectorMultiply;	
					[_plane,-90 + _pitch,0] call bis_fnc_setpitchbank;
					_plane setvectordir _vectorDir;
					_plane setVelocity _velocity;
					_planeDriver fireAtTarget [_target,"Gatling_30mm_Plane_CAS_01_F"];
					sleep 0.01;
					time>_timeToStop
				};
			};


			//launch _GBUbomb
			if(_GBUbomb)then
			{
				_target setPosASL _mrkPos;
				_planeDriver fireAtTarget [_target,"Bomb_04_Plane_CAS_01_F"];
			};


			//Lunch missile
			_plane setAmmo ["Missile_AGM_02_Plane_CAS_01_F",2];
			if(_missile)then{
				_currentMissile = 0;
				_timeToStop = time + 1.5;
				_target setPosASL _mrkPos;
				_mrkPos set [2,(_mrkPos select 2)+40];
				waitUntil 
				{
					_mrkPos set [2,(_mrkPos select 2)+6];
					[_plane,-90 + _pitch,0] call bis_fnc_setpitchbank;
					_vectorDir = [getPosASL _plane,_mrkPos] call bis_fnc_vectorFromXtoY;
					_velocity = [_vectorDir,_speed] call bis_fnc_vectorMultiply;
					_plane setvectordir _vectorDir;
					_plane setVelocity _velocity;
					sleep 0.1;
					//_planeDriver fireAtTarget [_target,"Missile_AGM_02_Plane_CAS_01_F"];
					
					if (_currentMissile < _countMissile)then
					{
						_planeDriver fireAtTarget [_target,"Missile_AGM_02_Plane_CAS_01_F"];
						_currentMissile = _currentMissile + 1;
					};
							
					time>_timeToStop
				};
			};

			
			_isFireComplete = true;
	    };
		sleep 0.05;
		(isNull _plane)||(_isFireComplete)
	};
	
	_plane flyInHeight _alt;

	//Delete vehicle
	waituntil 
	{
		_plane distance _mrkPos > 3000
	};
	_crew = crew _plane;
	{deleteVehicle _x} foreach _crew;
	deleteVehicle _plane;
};
