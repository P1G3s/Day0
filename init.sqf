player enableStamina false;
player addaction ["Invincible",
{
    (_this select 0) allowDammage false;
    if(isServer)then{hint "Yes"}else{hint "No"};
}];
//execVM "Scripts\intro.sqf";

//delete
if(isServer)then{
    player addaction ["CAS",
    {
        _planeArray = [[195.921,234.16,300],50,"B_Plane_CAS_01_dynamicLoadout_F",WEST] call BIS_fnc_spawnVehicle;
        _plane = _planeArray select 0;
        {deleteVehicle _x} foreach (crew _plane);
        (_this select 1) moveInDriver _plane;
        _plane allowDammage false;
    }];
};
