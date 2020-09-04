getRandomPos=  //[center,max radius,min radius,height]
{
	private ["_center","_maxRadius","_minRadius","_height"];
	_center = _this select 0;
	_maxRadius = _this select 1;
	_minRadius = _this select 2;
	_height = _this select 3;
	_times = random [_minRadius/_maxRadius,(1+(_minRadius/_maxRadius))/2,1];
	_radius = _times * _maxRadius;
	_angle = random 720;
	_pos = [
			(_center select 0)+_radius*(cos _angle),
			(_center select 1)+_radius*(sin _angle),
			_height
			];
	_pos
};