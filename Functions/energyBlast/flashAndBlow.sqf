_blowPosList = _this select 0;
_blowDuration = _this select 1;
{
	_pos = _x;
	_light = "#lightpoint" createvehiclelocal _pos;
	_light setLightBrightness 3;
	_light setLightAmbient [1, 1, 1.2];
	_light setlightcolor [1, 1, 1.2];
	_light setLightDayLight true;	
	_light setLightUseFlare true;
	_light setLightFlareSize 2;
	_light setLightFlareMaxDistance 8000;	
	sleep _blowDuration;
	_light setLightBrightness 0;
	deleteVehicle _light;
} foreach _blowPosList;
sleep 1.5;
if (isServer) then
{
	{
		_bomb = "DemoCharge_Remote_Ammo_Scripted" createVehicle _x;
		_bomb setDammage 1;
		sleep _blowDuration;
	}foreach _blowPosList;
}