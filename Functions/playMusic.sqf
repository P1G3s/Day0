enableCamShake false;
titleCut ["", "BLACK FADED", 999];
0 fadeSound 0;
if (isServer) then
{
	{_x setPos [4722.53,4832.11,1];sleep 0.5;}foreach [player1,player2,player3,player4];
};
sleep 3;
playMusic "DAY1";

[ 
"<t  size = '1'>DAY1</t>", 
-1, -1, 8.7, 0, 0, 789 
] spawn bis_fnc_dynamicText;
sleep 8.7;

[ 
"<t  size = '1'>6 hours ago<br />
 六小时之前</t>", 
-1, -1, 8.7, 0, 0, 789 
] call bis_fnc_dynamicText;

////////
sleep 5;

[
 "<t  size = '0.8'>
 A US airplane was shot down
 <br />and crash into Russain territory for unkown reason<br />  
一架美军运输机被击中并迫降在俄罗斯领土，原因不明....</t>",-1,-1,8,2,0,789] spawn BIS_fnc_dynamicText;

sleep 12.5;
[ 
 "<t  size = '0.8'>
 A mecenary squad Disguised as US Forces
 <br />was sent to Rusia<br /> 
一支伪装成美军的雇佣军小队被派遣至俄罗斯</t>", 
 -1, -1, 8, 2, 0, 789 
] spawn bis_fnc_dynamicText;

sleep 12.5;
[ 
 "<t  size = '0.8'>to start a war<br /> 
第三次世界大战一触即发</t>", 
 -1, -1, 8, 2, 0, 789 
] spawn bis_fnc_dynamicText;

////////

if (isServer) then
{
	{_x moveInCargo boat1;_x allowDammage true;}foreach [player1,player2,player3,player4];
};
3 fadeSound 1;
player moveInCargo boat1;
player allowDammage True;
sleep 2;
titleCut ["", "BLACK IN", 7];
