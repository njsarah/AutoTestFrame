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
Func runExe()
	Run($ATD_ApplicationName)
	WinWaitActive($ATD_Title)
	Local $atd_handle = WinGetHandle($ATD_Title)
	Return $atd_handle
EndFunc
;打开新文件
Func openFile($filepath)
	Local $open_handle = WinGetHandle($ATD_SelectFile);选择文件对话框handle
	If $open_handle <> 0 Then                         ;成功打开文件对话框
		LogError("Sucessfully Open the FileDialog")
		;ControlCommand($open_handle,"","ComboBox2","SelectString","ODS files")
		ControlSetText($open_handle,"","Edit1",$filepath)
		ControlClick($open_handle,"","Button1")
		If WinWait($ATD_Tip,"",$i_MaxTimeout)<>0 Then     ;文件本身有问题造成打开失败
			logInfo("The wrong with file"&$filepath)
			tip()
			Return 0
		ElseIf WinWait($ATD_Title,"",$i_MaxTimeout)<>0 Then  ;成功打开文件
			logInfo("Sucessfully open file"&$filepath)
			Return 1
		Else
			logError("Failed to open file"&$filepath)     ;应用程序有问题造成打开失败
			Return 0
		EndIf
	Else                                             ;打开对话框失败
		LogError("Failed to Open the FileDialog")
		Return 0
	EndIf
EndFunc
;存储文件
Func saveFile()
	Local $save_handle = WinGetHandle($ATD_SaveAsDialog)
	Local $tmp = ControlGetText($save_handle,"","Edit1")
	ControlSetText($save_handle,$tmp,"Edit1",$tmp&"_Export")
	ControlClick($save_handle,"","Button1")
	If WinWait($ATD_Rename,"",$i_MaxTimeout)<>0 Then ;同一个目录下存在同名文件
		logInfo("The director has a same file:overrite the file;")
		ControlClick($ATD_Rename,"","Button1")
		Return 1
	ElseIf WinWait($ATD_Tip,"",$i_MaxTimeout)<>0 Then ;弹出提示失败信息
		logError("Failed to save file;")
		ControlClick($ATD_Tip,"","Button1")
		Return 0
	ElseIf WinWait($ATD_Title,"",$i_MaxTimeout)<>0 Then ;不存在同名文件下，关闭对话框
		logInfo("Sucessfully Save File;")
		Return 1
	Else                                             ;其它情况下默认失败
		logError("Failed to save file;")
		ControlClick($ATD_Tip,"","Button1")
		Return 0
	EndIf
EndFunc
;提示信息处理
Func tip()
	Local $tip_handle = WinGetHandle($ATD_Tip)
	If $tip_handle<>0 Then
		logInfo("Sucessfully give a tip;")
		ControlClick($tip_handle,"","Button1")
		Return 1
	Else
		logInfo("Failed to give a tip;")
		Return 0
	EndIf
EndFunc