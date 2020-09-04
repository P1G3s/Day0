//flash
{
	_pos = [[1053.37,1414.96,106.112],170,100,140] call getRandomPos;//getPos light1;
	_light = "#lightpoint" createvehiclelocal _pos;
	_light setLightDayLight true;
	_light setLightBrightness 500;
	_light setLightAmbient [1, 1, 1];
	_light setlightcolor [1, 1, 1];
	sleep 0.2;
	_light setLightBrightness 0;
	if (isServer) then
	{
		_bolt = createvehicle ["LightningBolt",_pos,[],0,"CAN_COLLIDE"];
		_bolt setposatl _pos;
		_bolt setdamage 1;
	};
	sleep 0.1;
	deleteVehicle _light;
	sleep random _x;
} foreach [1,0.02,0.1,0.01,0.1];