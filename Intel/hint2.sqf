_russainText = "mission assignment:
<br/>send a squad to check the plane crash site (GRID:029018)
<br/>secure and lock down the area";
hint (parseText _russainText);
sleep 3;
//Translator
_splitList = _russainText splitString " ";
waitUntil 
{
	_deleteWord = _splitList call BIS_fnc_selectRandom;
	_index = _splitList find _deleteWord;
	_splitList deleteAt _index;
	_russainText = _splitList joinString " ";
	hintSilent (parseText _russainText);
	sleep  random [0.2,0.3,0.4];
	(count _russainText) == 0
};

if (language == "chinesesimp") then 
{
	hint "翻译中.";
	sleep 1;
	hint "翻译中..";
	sleep 1;
	hint "翻译中...";
	sleep 1;
}else
{
	hint "Translating.";
	sleep 1;
	hint "Translating..";
	sleep 1;
	hint "Translating...";
	sleep 1;
};


_chineseText = "任务:<br/>派一支小队前往坠机点(坐标:009039)<br/>确保区域安全并全面封锁";
_englishText = "mission assignment:
<br/>send a squad to check the plane crash site (GRID:029018)
<br/>secure and lock down the area";
if (language == "chinesesimp") then 
{
	hint (parseText _chineseText);
}else
{
	hint (parseText _englishText);
};
