#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <GuiButton.au3>
Func fixModel()
	MouseClickDrag($ATD_Title,x1,y1,x2,y2)
	ControlClick($ATD_Title,"","Button7")
EndFunc
Func Sculpture($TeethNum)
	Local $rc = getModelInfor($TeethNum)
	If $rc<>0 Then
		MouseClick($MOUSE_CLICK_LEFT,30,100)
	;If WinWait($ATD_Tip,"",$i_MinTimeout) Then			;未选中模型时弹出提示信息
		;ControlClick($ATD_Tip,"","Button1")
		$btn_handle = ControlGetHandle($ATD_Title,"","Button6")
		_GUICtrlButton_SetCheck($btn_handle,$BST_CHECKED)
		If WinWait($ATD_Title,"",$i_MinTimeout) Then	;选中模型后成功进入雕刻界面
			MouseClickDrag($ATD_Title,x1,y1,x2,y2)
			ControlClick($ATD_Title,"","Button7")
		Else                                                ;打开雕刻界面失败
			logError("Failed to open Sculpture interface;")
			Return 0
		EndIf
	Else
		logInfor("The teeth doesn't exisit："&$TeethNum)
	EndIf
EndFunc
Func Smooth()
	MouseClick($MOUSE_CLICK_LEFT,92,88)
	If WinWait($ATD_Tip,"",$i_MinTimeout) Then
		ControlClick($ATD_Tip,"","Button1")
	ElseIf WinWait($ATD_Title,"",$i_MinTimeout) Then	;选中模型后成功进入光顺界面
		MouseClickDrag($ATD_Title,x1,y1,x2,y2)
		ControlClick($ATD_Title,"","Button7")
	Else                                                ;打开光顺界面失败
		logError("Failed to open Smooth interface;")
		Return 0
	EndIf
EndFunc