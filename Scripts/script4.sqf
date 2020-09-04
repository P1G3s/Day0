_handle = execVM "Functions\dropSupport\dropSupport.sqf";
waitUntil {scriptDone _handle};
[endPos1, ["air_raid",2000]] remoteExec ["say3D"];
sleep 8;


//camTarget1
camTarget1 = "Land_Battery_F" createVehicle [0,0,0];
publicVariable "camTarget1";

_Alist = [[A1,pos1,1500],[A2,pos2,1560],[A3,pos4,1480],[A5,pos5,1530]];
{
	_crew = _x select 0;
	_pos = getPos (_x select 1);
	_alt = _x select 2;
	[_pos,_crew,_alt] spawn dropSupport;
	sleep .1;
}foreach _Alist;


sleep 2;
["Scripts\outro.sqf"] remoteExec ["execVM"];
sleep 36;
execVM "Scripts\script3.sqf";