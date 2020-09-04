cutText ["", "BLACK OUT",3];
cutText ["", "BLACK IN", 5];

_camera = "camera" camCreate [2929.81,3232.81,17.2793];
showCinemaBorder true;
_camera cameraEffect ["Internal", "BACK"];
_camera camCommand "inertia on";
_camera camPrepareTarget reclaim_heli;
_camera camPrepareFOV 0.7;
_camera camCommitPrepared 3;
sleep 5;
if (isServer) then 
{
	execVM "Scripts\script2.sqf";
};
sleep 0.2;
_camera camPrepareTarget missile1;
_camera camCommitPrepared 1;
waitUntil {getDammage reclaim_heli > 0.1};
sleep 5;
_camera cameraEffect ["Terminate", "BACK"];