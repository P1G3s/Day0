_handle1 = execVM "Functions\hyperSpaceTravel\hyperSpaceTravel.sqf";
_handle2 = execVM "Functions\getRandomPos.sqf";
waitUntil {(scriptDone _handle1)&&(scriptDone _handle2)};





_spawnList = [spawnPos1,spawnPos3];//[spawnPos2,spawnPos3,spawnPos4];  
_dir = [spawnPos1,endPos1] call BIS_fnc_relativeDirTo;
_alt = 150;
_speed = 3500;
_planeClass = "OPTRE_Longsword_Bomb";//"OPTRE_Pelican_unarmed"   "OPTRE_Longsword_Bomb"
["Functions\hyperSpaceTravel\flash.sqf"] remoteExec ["execVM"];
sleep 3;
{
	_spawnPos = getPos _x;
	_spawnPos set [2,_alt];
	[_planeClass,_spawnPos,_speed,1950,_dir] spawn hyperSpaceTravel;
	sleep 0.8;
}foreach _spawnList;
