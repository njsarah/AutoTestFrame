#RequireAdmin
Global $hWnd

;安装
Func installATD($path)
	$pid = Run($path)
	$hWnd = WinWait("安装 - ATreat Designer 3.0","",1)
	If $hWnd>0 Then
		WinActivate($hWnd)
		sucessInstall()
	Else
		WinActivate("安装")
		ControlClick("安装","","Button1","left")
		delCurVer()
	EndIf
EndFunc
;存在低版本或相同版本的ATD时先删除已安装版本
Func delCurVer()
	Local $hWnd2 = WinWait("卸载 - ATreat Designer 3.0","",1)
	If $hWnd2>0 Then
		WinActivate($hWnd2)
		ControlClick($hWnd2,"","Button1","left")
		Sleep(5000)
		WinWaitActive("卸载 - ATreat Designer 3.0")
		ControlClick("卸载 - ATreat Designer 3.0","","Button1","left")
		sucessInstall()
	Else
		Exit
	EndIf
EndFunc
;安装ATD
Func sucessInstall()
	Local $hWnd3 = WinWait("安装 - ATreat Designer 3.0")
	WinActivate($hWnd3)
	ControlClick($hWnd3,"","TNewButton1","left")
	ControlClick($hWnd3,"","TNewRadioButton1","left")
	ControlClick($hWnd3,"","TNewButton2","left")
	ControlClick($hWnd3,"","TNewButton3","left")
	ControlClick($hWnd3,"","TNewButton4","left")
	ControlClick($hWnd3,"","TNewButton4","left")
	ControlClick($hWnd3,"","TNewButton4","left")
	Sleep(5000)
	ControlClick($hWnd3,"","TNewButton4","left")
	ControlClick($hWnd3,"","TNewButton4","left")
EndFunc


