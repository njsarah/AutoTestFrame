#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#RequireAdmin
#include "..\ATDConstants.au3"
#include "..\ATDMessageResource.au3"
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
		Return $i_Val
	EndIf
	;打开文件对话框
	Send("^O")
	Sleep($i_MaxTimeout)
	Local $handle2 = WinGetHandle($ATD_SelectFile);选择文件对话框handle
	If $handle2 <> 0 Then
		ControlCommand($handle2,"","ComboBox2","SelectString","ODS files")
		ControlSetText($handle2,"","Edit1","C:\Users\dongqianqian\Desktop\Special\中期\拔4.ods")
		ControlClick($handle2,"","Button1")
	Else
		LogError("Failed to Open the File")
		Return $handle2
	EndIf
	Return $handle2
EndFunc
;保存文件
Func ATDSaveFile()
	Send("^S")
EndFunc
;另存为文件
Func ATDSaveAsFile()
	MouseClick($MOUSE_CLICK_LEFT,206,90,2)
	Local $handle3 = WinGetHandle($ATD_SaveAsDialog)
	Local $tmp = ControlGetText($handle3,"","Edit1")
	ControlSetText($handle3,$tmp,"Edit1",$tmp&"_SaveAs")
	ControlClick($handle3,"","Button1")
EndFunc
;导出文件
Func ATDExportFile()
	MouseClick($MOUSE_CLICK_LEFT,87,85,2)
	Local $handle4 = WinGetHandle($ATD_SaveAsDialog)
	Local $tmp = ControlGetText($handle4,"","Edit1")
	ControlSetText($handle4,$tmp,"Edit1",$tmp&"_Export")
	ControlClick($handle4,"","Button1")
EndFunc
;关闭文件
Func ATDCloseFile()
	MouseClick($MOUSE_CLICK_LEFT,263,90,2)
EndFunc
Func VerifyOpenFile()
	;检查是否成功打开文件
	$i_Val = WinWaitActive($ATD_Tip,"",$i_MaxTimeout)
	If WinWait($ATD_Tip,"",1)<>0 Then
		ControlClick($ATD_Tip,"","Button1")
		logInfo("Open File Failed")
		Return 0
	ElseIf WinWait($handle1,"",$i_MaxTimeout)<>0 Then
		ControlClick($handle1,"","Button1")
		logInfo("Open File Failed")
		Return 0
	Else
		logInfo("Open File Sucessfully")
		Return 1
	EndIf
EndFunc






















