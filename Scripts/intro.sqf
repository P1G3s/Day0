cutText ["", "BLACK IN", 5];
_camera = "camera" camCreate [1284.6,4203.31,0.4];
showCinemaBorder true;
_camera cameraEffect ["internal", "BACK"];
_camera camCommand "inertia on";
_camera camPrepareTarget [1277.63,4221.19,2];
_camera camPrepareFOV 0.8;
_camera camCommitPrepared 2;
_camera camSetFocus [-1, -1];
sleep 2;
_listAI = [AI1,AI2,AI3,AI4];

{_x switchMove "AmovPercMevaSlowWrflDf";sleep 0.5}foreach _listAI;

sleep 10;
cutText ["", "BLACK", 3];
sleep 5;


AI1 setPos [1284.88,4262.23,0];
AI2 setPos [1283.47,4257.99,0];
AI3 setPos [1289.33,4258.57,0];
AI4 setPos [1287.37,4255.06,0];

AI1 switchMove "Acts_SupportTeam_Front_Move";
sleep 0.1;
AI2 switchMove "Acts_SupportTeam_Left_Move";
sleep 0.5;
AI3 switchMove "Acts_SupportTeam_Right_Move";
sleep 0.1;
AI4 switchMove "Acts_SupportTeam_Back_Move";


_camera = "camera" camCreate [1288.5,4251.67,7];
_camera cameraEffect ["internal", "BACK"];
_camera camCommand "inertia on";
_camera camPrepareTarget (getPos AI1);
_camera camPrepareFOV 0.8;
_camera camCommitPrepared 0.1;
_camera camSetFocus [-1, -1];
cutText ["", "BLACK IN", 4];
sleep 4;
cutText ["", "BLACK OUT", 2];
sleep 4;
[west,"BLU"] sideRadio "mp_groundsupport_01_medevacrequested_BHQ_0";

{_x setPos [0,0,0];_x switchMove "";sleep 0.2;} foreach _listAI;
{_x setPos [1255.91,4270.54,0];sleep 0.2;} foreach [player1,player2,player3,player4];

_camera cameraEffect ["terminate", "BACK"];
cutText ["", "BLACK IN", 2];
sleep 5;
["RadioAmbient2"] remoteExec ["playSound"];
[west,"Base"] sideChat "Affirmative. Maintain your position, medevac ETA 20 seconds.";



