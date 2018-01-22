#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
Func runExe()
	Run($ATD_ApplicationName)
	WinWaitActive($ATD_Title)
	Local $atd_handle = WinGetHandle($ATD_Title)
	Return $atd_handle
EndFunc
;打开新文件
Func openFile($filepath)
	Local $open_handle = WinWait($ATD_SelectFile,"",$i_MaxTimeout);选择文件对话框handle
	If $open_handle <> 0 Then                         ;成功打开文件对话框
		LogError("Sucessfully Open the FileDialog")
		;ControlCommand($open_handle,"","ComboBox2","SelectString","ODS files")
		ControlSetText($open_handle,"","Edit1",$filepath)
		ControlClick($open_handle,"","Button1")
		Return $open_handle
	Else                                             ;打开对话框失败
		LogError("Failed to Open the FileDialog")
		Return 0
	EndIf
EndFunc
;存储文件
Func saveFile()
	Local $save_handle = WinWait($ATD_SaveAsDialog,"",100)
	;MsgBox(0,"Test111",$save_handle)
	Local $tmp = ControlGetText($save_handle,"","Edit1")
	Sleep($i_MaxTimeout)
	;MsgBox(0,"Test",$tmp)
	ControlSetText($save_handle,$tmp,"Edit1",$tmp&"_Export")
	ControlClick($save_handle,"","Button1")
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