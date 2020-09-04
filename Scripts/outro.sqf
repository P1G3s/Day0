titleCut ["","BLACK OUT",1];
sleep 2;
if (isServer) then 
{
	{_x setPos [2674.68,4824.43,0];sleep 0.1;} foreach [player1,player2,player3,player4];
};
player setPos [2674.68,4824.43,0];


//Scene1
_camera = "camera" camCreate (camtarget1 modelToWorld [0,25,0]);
/*
enableCamShake true;
addCamShake [40,20,10];
*/
showCinemaBorder true;
_camera cameraEffect ["internal", "BACK"];
_camera camCommand "inertia on";
_camera camSetTarget camtarget1;
_camera attachTo [camTarget1,[0,35,0]];
_camera camPrepareFOV 1;
_camera camCommit 0;
playMusic "outro";
sleep 0.4;
titleCut ["","BLACK OUT",999];
sleep 2.8;


//Scene2
_camera attachTo [camTarget1,[0,200,0]];
sleep 2.8;
titleCut ["", "BLACK FADED", 999];
sleep 2.8;
detach _camera;


//Scene3
enableCamShake false;
_camera camsetPos [1150,3433.81,300];
_camera camSetTarget [1556.47,3059.17,120];
_camera camPrepareFOV 0.8;
_camera camCommit 0;
cutText ["","BLACK IN",1];
sleep 7;
0 fadeSound 0;
sleep 3;

//Scene4
cutText ["","BLACK OUT",2];
sleep 8;
1 fadeSound 1;
cutText ["","BLACK IN",2];
_camera camSetPos [1647.92,3234.31,20];
_camera camsettarget [1347.93,2161.26,0];
_camera camPrepareFOV 0.8;
_camera camCommit 0;

//Scene5
_camera camSetPos [1647.92,3234.31,80];	
_camera cameraEffect ["internal", "BACK"];
_camera camCommand "inertia on";
_camera camPrepareTarget [1348.05,2167.84,-3];
_camera camPrepareFOV 0.8;
_camera camCommitPrepared 8;
sleep 15;

//refract
_source = "#particlesource" createVehicleLocal (getPos _camera);
_source setParticleCircle [0, [0, 0, 0]];
_source setParticleRandom [0, [5, 5, 1], [2, 2, 0.5], 0, 1, [0.05, 0.05, 0.05, 0.1], 0, 0];
_source setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1,0],"","Billboard",1, 1, [0,0,.4],[0,0,1],0,1,1,0,[6,10],[[0,1,1,0],[1,1,1,1]],[1.5,0.5],0,0,"","",_camera];
_source setDropInterval 0.01;
3 fadeSound 0.2;
sleep 3;

//spark1
_spark = "#particlesource" createVehicleLocal (getPos _camera);
_spark setParticleCircle [0, [0, 0, 0]];
_spark setParticleRandom [0.1, [2,2,2], [0,0,0], 0, 0.5, [0, 0, 0, 0.1], 0, 0];
_spark setParticleParams [["\A3\data_f\blesk2",1, 0, 1 ], "", "SpaceObject", 1, 0.2, [0, 0, 0], [0, 0, 0], 0, 0, 5, 1000, [0.005], [[1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _camera];
_spark setDropInterval 0.1;

//spark 2
_spark = "#particlesource" createVehicleLocal (getPos _camera);
_spark setParticleCircle [0, [0, 0, 0]];
_spark setParticleRandom [0.1, [2,2,2], [0,0,0], 0, 0.5, [0, 0, 0, 0.1], 0, 0];
_spark setParticleParams [["\A3\data_f\blesk1",1, 0, 1 ], "", "SpaceObject", 1, 0.2, [0, 0, 0], [0, 0, 0], 0, 0, 5, 1000, [0.005], [[1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _camera];
_spark setDropInterval 0.1;


_camera say3D "electronicField";
sleep 5;
0 fadeMusic 0;
0 fadeSound 0;
titleCut ["", "BLACK FADED", 999];
_camera cameraEffect ["terminate","back"];
deleteVehicle _camera;
deleteVehicle _spark;


sleep 3;
[ 
 "<t  size = '0.8'>
 To be continued....
 <br />未完待续....</t>", 
 -1, -1, 4, 2, 0, 789 
] spawn bis_fnc_dynamicText;
sleep 6;
endMission "END1";