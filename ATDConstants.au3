#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#RequireAdmin
#include <File.au3>
Const $i_MaxTimeout = 1000
Const $s_LogFileName = "D:\AutoTestFrame\logs\ATDAutomation_"&@YEAR&"."&@MON&"."&@MDAY&"."&@HOUR&"."&@MIN&".log"
Const $ATD_ApplicationName="C:\Program Files (x86)\ATreat Designer 3.0\bin\ATreatDesigner_x86.exe"
Const $ATD_Title = "ATreat Designer"
Const $ATD_SelectFile = "请选择文件"
Const $ATD_Tip = "提示"
Const $ATD_SaveAsDialog = "请输入保存文件名"
Const $ATD_Rename = "确认另存为"
$ATD_TestResult = "Pass"
Const $ATD_UpperJaw = "上牙颌"
Const $ATD_LowerJaw = "下牙颌"
Const $ATD_FilePath = "D:\AutoTestFrame\testdata\FilePath.xlsx"

