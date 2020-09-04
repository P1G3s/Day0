_russainText = "спутник  журнал:
<br/>гравитационная аномалия обнаружена
<br/>расположение: thrisk (сетка: 009039)
<br/>время: 2017.6.6
<br/>нынешний статус: стабильная
<br/>статус: к информации
<br/>замечания: уровень электронное устройство вмешательства увеличить";
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


_chineseText = "卫星日志:<br/>检测到重力异常<br/>地点: THRISK (坐标:009039)<br/>目前状态: 稳定<br/>信息状态 : 保密<br/>备注: 电子设备干扰程度增加";
_englishText = "Satellite log: <br/>Gravity Anomaly Detected <br/>Location: THRISK (GRID:009039)<br/>Time: 2017.6.6<br/>Current Status: Stable<br/>Information Status : Classified<br/>Remarks: Level of electronic device interference increase";

if (language == "chinesesimp") then 
{
	hint (parseText _chineseText);
}else
{
	hint (parseText _englishText);
};

