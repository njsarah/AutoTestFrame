#RequireAdmin
#include <MsgBoxConstants.au3>
autoUnInstall()
Func autoUnInstall()
	Local $filepath = "C:\Program Files (x86)\ATreat Designer 3.0\unins000.exe"
	Local $isExists = FileExists($filepath)
	If $isExists=1 Then
		Run($filepath)
		Local $hwnd1 = WinWait("卸载 - ATreat Designer 3.0","",1)
		If $hwnd1>0 Then
			sucessUninstall()
		Else
			WinActivate("卸载")
			ControlClick("卸载","","Button1")
			WinActivate("ATreat Designer")
			WinClose("ATreat Designer")
			Run($filepath)
			sucessUninstall()
		EndIf
	Else
		MsgBox(0,"未发现","该路径下不存在ATD卸载程序")
	EndIf
EndFunc
Func sucessUninstall()
	Local $hwnd2 = WinWait("卸载 - ATreat Designer 3.0")
	WinActivate($hwnd2)
	ControlClick($hwnd2,"","Button1")
	Sleep(5000)
	ControlClick($hwnd2,"","Button1")
EndFunc
