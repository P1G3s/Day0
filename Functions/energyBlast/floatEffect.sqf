_center = _this select 0;
_radius = _this select 1;
_duration = _this select 2;
_blowDuration = _this select 3;
_bombAmount =_this select 4;


[_center, ["electronicField",1000]] remoteExec ["say3D"];


//refract
_refract = "#particlesource" createVehicleLocal (getPos _center);
_refract setParticleCircle [0, [0, 0, 0]];
_refract setParticleRandom [0, [_radius-_radius*(1/4), _radius-_radius*(1/4),0-((getPos _center) select 2)], [1, 1, 1], 0, 1, [0.05, 0.05, 0.05, 0.1], 0, 0];
_refract setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1,0],"","Billboard",1, 1, [0,0,.4],[0,0,1],0,1,1,0,[6,10],[[0,1,1,0],[1,1,1,1]],[1.5,0.5],0,0,"","",_center];
_refract setDropInterval 0.01; 

//spark
_spark = "#particlesource" createVehicleLocal (getPos _center);
_spark setParticleCircle [0, [0, 0, 0]];
_spark setParticleRandom [0, [_radius-_radius*(1/6),_radius-_radius*(1/6),0-((getPos _center) select 2)], [1,1,0.5], 0, 0.1, [0, 0, 0, 0.1], 0, 0];
_spark setParticleParams [["\A3\data_f\blesk2", 1, 0, 1], "", "SpaceObject", 1, 0.5, [0, 0, 0], [0, 0, 0], 0, 10, 7.9, 0.075, [0.010, 0.005], [[1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _center];
_spark setDropInterval 0.01;

//mud
_mudPos = getPos _center;
_mudPos set [2,0];
_mudCenter = "Land_HelipadEmpty_F" createVehicleLocal _mudPos;
_mud = "#particlesource" createVehicle _mudPos;
_mud setParticleCircle [0, [0, 0, 0]];
_mud setParticleRandom [0, [_radius, _radius, 0], [0, 0, 0], 0, 1.5, [0, 0, 0, 0], 0, 0];
_mud setParticleParams [["\Ca\Data\ParticleEffects\Pstone\Pstone.p3d", 8, 3, 1], "", "SpaceObject", 5, 6, [0, 0, 0], [0, 0, 0.00001], 0.5, 1, 1, 0.2, [0.2, 0.1], [[1, 1, 1 ,1], [1, 1, 1, 1], [1, 1, 1, 1]], [0, 1], 1, 0, "", "", _mudCenter];
_mud setDropInterval 0.01;

sleep (_duration+((_blowDuration*_bombAmount*2)+2));

deletevehicle _refract;
deleteVehicle _spark;
deleteVehicle _mud;