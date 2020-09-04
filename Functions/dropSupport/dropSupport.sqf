blowEffect=
{
	private ["_vehicle","_smoke","_smoke2","_light"];
	_vehicle = _this;
	_smoke = "#particlesource" createVehicleLocal (getPos _vehicle);
	_smoke setParticleCircle [2, [0,150,0]];
	_smoke setParticleRandom [1, [0.1, 0.1, -0.5], [2, 2, -2], 1, 0.25, [0, 0, 0, 0], 0, 0];
	_smoke setParticleParams [["\A3\data_f\ParticleEffects\Universal\smoke.p3d", 1, 0, 1], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, -10], 0, 11, 7.85, 0.6, [12,14], [[.1, .1, .1, .8], [.1, .1, .1, 0]], [0.08], 1, 0, "", "", _this, 0 , false, 0];
	_smoke setDropInterval 0.0007;
	sleep 0.15;
	deleteVehicle _smoke;
	sleep random [0.2,0.3,0.4];


	_light = "#lightpoint" createvehiclelocal (getPos _vehicle);
	_light lightAttachObject [_vehicle,[0,0,0]];
	_light setLightBrightness random [5,8,10];
	_light setLightAmbient [1, 1, 1];
	_light setlightcolor [1, 1, 1];
	_light setLightDayLight true;	
	_light setLightUseFlare true;
	_light setLightFlareSize 3;
	_light setLightFlareMaxDistance 8000;


	_smoke1 = "#particlesource" createVehicleLocal (getPos _vehicle);
	_smoke1 setParticleCircle [2, [0,100,0]];
	_smoke1 setParticleRandom [1, [0.1, 0.1, -0.5], [2, 2, -2], 1, 0.25, [0, 0, 0, 0], 0, 0];
	_smoke1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\smoke.p3d", 1, 0, 1], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, -10], 0, 10, 7.85, 0.75, [8,8], [[.1, .1, .1, .7], [.1, .1, .1, 0]], [0.08], 1, 0, "", "", _this, 0 , false, 0];
	_smoke1 setDropInterval 0.0007;
	_light setLightBrightness 0;
	sleep 0.15;
	deleteVehicle _smoke1;

	for "_i" from 1 to 2 do
	{	
		sleep random 0.1;
		_light setLightBrightness random [4,5,6];
		sleep random 0.1;
		_light setLightBrightness 0;
	};
	deleteVehicle _light;
};

dropSupport=   //[pos,crew,alt]
{
	private ["_spawnPos","_crew","_alt"];
	_spawnPos = _this select 0;
	_crew = _this select 1;
	_alt = _this select 2;
	_spawnPos set [2,_alt];
	_vehicle =  createVehicle ["OPTRE_HEV",_spawnPos,[],0,"CAN_COLLIDE"];
	_vehicle allowDammage false;
	camTarget1 attachTo [_vehicle,[0,0,-1]];
	_fire = "test_EmptyObjectForFireBig" createVehicle (getPos _vehicle);  
	_fire attachTo [_vehicle,[0,0,-3.5]]; 
	_flag = false;
	waitUntil 
	{	
		_currentPos = getPos _vehicle;
		if(_currentPos select 2 < 350)then
		{
			_bomb = "ClaymoreDirectionalMine_Remote_Ammo_Scripted" createVehicle getPos _vehicle;
			_bomb attachTo [_vehicle,[0,0,1]];
			_bomb setdamage 1;
			deleteVehicle _fire;
			[_vehicle,blowEffect] remoteExec ["spawn"];
			sleep 0.1;
			[_vehicle,0,0] call bis_fnc_setpitchbank;
			_flag = true;
		};
		sleep 0.5;
		_flag
	};
	waitUntil 
	{
		_currentPos = getPos _vehicle;
		sleep 0.08;
		(_currentPos select 2) < 4
	};
	_currentPos = getPos _vehicle;
	_bombPos = getPos _vehicle;
	_bombPos set [2,0];
	_bomb = "Bo_GBU12_LGB_MI10" createVehicle _bombPos;
	sleep 0.1;
	_vehicle setVelocity [0,0,0];
	[_vehicle,0,0] call bis_fnc_setpitchbank;
	_bombPos set [0,(_bombPos select 0)+3];
	sleep 3;
	_crew setPos _bombPos;
	_vehicle lock true;
};
