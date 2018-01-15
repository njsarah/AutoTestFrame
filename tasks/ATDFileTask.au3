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
#include "..\Common.au3"
Global $handle1;ATD的handle
Opt("MouseCoordMode", 0)

;打开文件
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
	;打开Excel表格
	openExcel($ATD_FilePath)
	;读取Excel表格中的数据
	Local $filepath = $readExcelData("B2")
	;打开文件对话框
	Send("^O")
	Sleep($i_MaxTimeout)
	;打开文件
	openFile($filepath)
EndFunc

;保存文件
Func ATDSaveFile()
	Send("^S")
EndFunc

;另存为文件
Func ATDSaveAsFile()
	MouseClick($MOUSE_CLICK_LEFT,206,90,2)
	logInfo("Save as file")
	saveFile()
EndFunc

;导出文件
Func ATDExportFile()
	;鼠标移动到导出文件
	MouseClick($MOUSE_CLICK_LEFT,87,85,2)
	;导出文件
	logInfo("Export file")
	saveFile()
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






















