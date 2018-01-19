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
#include "..\excelData.au3"
Global $handle1;ATD的handle
Global $filepath
Opt("MouseCoordMode", 0)
ATDOpenFile()
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
	$filepath = readExcelData("B2")
	closeExcel()
	;打开文件对话框
	Send("^O")
	Sleep($i_MaxTimeout)
	;打开文件
	openFile($filepath)
	ATDExportFile()

	VerifySaveFile()
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
	If WinWait($ATD_Tip,"",$i_MinTimeout)<>0 Then     ;文件本身有问题造成打开失败
		logInfo("The wrong with file"&$filepath)
		tip()
		Return 0
	ElseIf WinWait($ATD_Title,"",$i_MinTimeout)<>0 Then  ;成功打开文件
		logInfo("Sucessfully open file"&$filepath)
		Return 1
	Else
		logError("Failed to open file"&$filepath)     ;应用程序有问题造成打开失败
		Return 0
	EndIf
EndFunc
Func VerifySaveFile()
	;MsgBox(0,"Verify","save Result")
	If WinWait($ATD_Rename,"",$i_MinTimeout)<>0 Then ;同一个目录下存在同名文件,覆盖原文件
		logInfo("The director has a same file:overrite the file;")
		ControlClick($ATD_Rename,"","Button1")
		Return 1
	ElseIf WinWait($ATD_Rename,"",$i_MinTimeout)<>0 Then ;同一个目录下存在同名文件,不覆盖原文件
		logInfo("The director has a same file:don't overrite the file;")
		ControlClick($ATD_Rename,"","Button2")
		Return 0
	ElseIf WinWait($ATD_Tip,"",$i_MinTimeout)<>0 Then ;弹出提示失败信息
		logError("Failed to save file;")
		ControlClick($ATD_Tip,"","Button1")
		Return 0
	ElseIf WinWait($ATD_Title,"",$i_MinTimeout)<>0 Then ;不存在同名文件下，关闭对话框
		MsgBox(0,"Verify","save Result 1")
		logInfo("Sucessfully Save File;")
		Return 1
	Else                                             ;其它情况下默认失败
		logError("Failed to save file;")
		ControlClick($ATD_Tip,"","Button1")
		Return 0
	EndIf
EndFunc





















