_secondBlowPos = _this;
playSound "shell1";
sleep 1;
//smoke

_smoke = "#particlesource" createVehicleLocal _secondBlowPos;
_smoke setParticleCircle [40, [0,-500,1]];
_smoke setParticleRandom [2, [1, 1, -1], [2, 2, 0], 1, 2, [0.2, 0.2, 0.1, 0.1], 0, 0];
_smoke setParticleParams [["\A3\data_f\ParticleEffects\Universal\smoke.p3d", 1, 0, 1], "", "Billboard", 1, 1.3, [0, 0, -2], [0,0,0], 0, 10, 7.85, .75, [1,2], [[.11, .1, .1, 0], [.11, .1, .1, 0.4]], [0.08], 1, 0, "", "", _this, 0 , false, 0];
_smoke setDropInterval 0.008;


sleep 4;
deleteVehicle _smoke;