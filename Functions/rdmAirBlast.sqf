/*
blastEffect=
{
    _pos = _this select 0;
    _size = 1 + random 2;
    _thingToFling = "Land_Battery_F" createVehicle [0,0,0];
    _thingToFling setPos _pos;
    _thingToFling allowDamage false;
    _smoke = "#particlesource" createVehicle _pos;
    _smoke setParticleCircle [0, [0, 0, 0]];
    _smoke setParticleRandom [0, [0.25, 0.25, 0], [0, 0, 0], 0, 1, [0, 0, 0, 0.1], 0, 0];
    _smoke setParticleParams [["\A3\data_f\ParticleEffects\Universal\smoke.p3d", 1, 0, 1], "", "Billboard", 1, 10, [0, 0, 2], [0, 0, 0], 0, 10, 7.85, 0.375, [_size,2*_size], [[.1, .1, .1, .75], [.1, .1, .1, 0]], [0.08], 1, 0, "", "", _thingToFling];
    _smoke setDropInterval 0.01;
    _thingToFling setVelocity [random [-100,0,100],random [-100,0,100],random[-20,0,120]];
    while {_size>0} do
    {
        _size = _size - random 0.25;
        _smoke setParticleParams [["\A3\data_f\ParticleEffects\Universal\smoke.p3d", 1, 0, 1], "", "Billboard", 1, 10, [0, 0, 2], [0, 0, 0], 0, 10, 7.85, 0.375, [_size,2*_size], [[.1, .1, .1, .75], [.1, .1, .1, 0]], [0.08], 1, 0, "", "", _thingToFling];
        sleep random 0.1;
    };
    deleteVehicle _thingToFling;
    deleteVehicle _smoke;
};
*/
cam_shake =
{
    private "_distance";
    _distance = _this;
    enableCamShake true;
    addCamShake [40*(1/_distance),5,300*(1/_distance)];
    sleep 0.3;
    enableCamShake false;
};

randomAirBlast=
{
    _centre = getPosASLW (_this select 0);    //the position of object
    _radius = _this select 1;
    _times  = random [0.4,0.7,1];
    _randRadius = _radius * _times;        //radius of the blast zone(have been randomize)
    _dir = getDir (_this select 0);
    _dir = _dir + random [-120,0,120];        //randomize direction
    _spawnPos = [(_centre select 0)+(sin _dir)*_randRadius,
                (_centre select 1)+(cos _dir)*_randRadius,
                (_centre select 2)+random [-5,-2,2]];
    _bomb = "DemoCharge_Remote_Ammo_Scripted" createVehicle _spawnPos;  //DemoCharge_Remote_Ammo_Scripted
    _bomb setdamage 1;

    //camshake
    _distance = _spawnPos distance (getPos evac_heli);
    [_distance,cam_shake] remoteExec ["spawn"]

        //for "_i" from 0 to 3 do {[_spawnPos] spawn blastEffect};
};


