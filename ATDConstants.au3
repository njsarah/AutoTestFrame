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
_FileCreate($s_LogFileName)
Const $ATD_ApplicationName="C:\Program Files (x86)\ATreat Designer 3.0\bin\ATreatDesigner_x86.exe"
Const $ATD_Title = "ATreat Designer"
Const $ATD_SelectFile = "请选择文件"
Const $ATD_Tip = "提示"
Const

