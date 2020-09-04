_handle = execVM "Functions\rdmAirBlast.sqf";
waitUntil {scriptDone _handle};
sleep 1;
waitUntil
{
	[evac_heli,70] spawn randomAirBlast;
	sleep random 2;
	(getDammage evac_heli > 0.1)
};