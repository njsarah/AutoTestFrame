#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#RequireAdmin
#include "..\ATDConstants.au3"
Global $handle1;ATD的handle
Opt("MouseCoordMode", 0)
Func runExe()
	Run($ATD_ApplicationName)
	WinWaitActive($ATD_Title)
	$handle1 = WinGetHandle($ATD_Title)
EndFunc
Func ATDOpenFile()
	;启动ATD应用程序
	Run($ATD_ApplicationName)
	$i_Val = WinWaitActive($ATD_Title,"",$i_MaxTimeout)
	If $i_Val <> 0 Then
		logInfo("Start the ATreat Designer sucessfully.")
	Else
		logError("Failee to start the ATreat Designer.")
	EndIf
	Send("^O")
	Sleep(2000)
	Local $handle2=WinGetHandle($ATD_SelectFile);选择文件对话框handle
	ControlCommand($handle2,"","ComboBox2","SelectString","ODS files")
	ControlSetText($handle2,"","Edit1","C:\Users\dongqianqian\Desktop\Special\中期\拔4.ods")
	ControlClick($handle2,"","Button1")
	Sleep(1000)
	judgeResutl()
EndFunc
Func judgeResutl()
	If WinWait($ATD_Tip,"",1)>0 Then
		ControlClick($ATD_Tip,"","Button1")
	ElseIf WinWait($handle1,"",1)>0 Then
		ControlClick($handle1,"","Button1")
		Sleep(1000)
		;shortCutATD()
		;getTeethNums($handle1)
	Else
		MsgBox(0,"提示","打开文件失败")
	EndIf
EndFunc






















