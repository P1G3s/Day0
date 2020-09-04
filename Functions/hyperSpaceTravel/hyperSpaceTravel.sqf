
hyperSpaceTravel=  //[vehicleclass,spawnPos,speed,distance,direction]
{
	private ["_planeClass","_spawnPos","_speed","_dis","_dir"];
	_planeClass = _this select 0;
	_spawnPos = _this select 1;
	_speed = _this select 2;
	_dis = _this select 3;
	_dir = _this select 4;


	//create vehicle
	_planeArray = [_spawnPos,_dir,_planeClass,WEST] call BIS_fnc_spawnVehicle;
	_plane = _planeArray select 0;
	_plane disableai "ALL";
	_plane setcombatmode "blue";
	_plane allowDammage false;


	//vehicel setup
	_crews = crew _plane;
	{deleteVehicle _x} foreach _crews;
	_plane setCenterOfMass [-1,0,0];
	_plane setMass 10;
	_dir = getDir _plane;
	_velocity = [_speed * (sin _dir), _speed * (cos _dir),0];		
	_plane setdir _dir;
	_plane setVelocity _velocity;

	/*
	_endPos = getPos _plane;
	_endPos set [2,0]; 
	_end = "Land_Battery_F" createVehicle ([_endPos,_dis,_dir]call BIS_fnc_relPos);
	_end enableSimulation false;
	_vectorDir = [getPos _plane,getPos _end] call bis_fnc_vectorFromXtoY;
	*/
	[_plane,0,0] call bis_fnc_setpitchbank;
	_reached = false;
	waitUntil
	{	
		if(_plane distance _spawnPos > _dis)then
		{
			_plane setVelocity [0,0,0];
			_reached = true;
		};
		_reached
	};
	[_plane, ["hyperSpace",2000]] remoteExec ["say3D"];
	sleep 0.1;
	[_plane,false] remoteExec ["enableSimulationGlobal"];
};
