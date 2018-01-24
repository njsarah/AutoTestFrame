#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
Func fixModel()
	MouseClickDrag($ATD_Title,x1,y1,x2,y2)
	ControlClick($ATD_Title,"","Button7")
EndFunc
Func Sculpture()
	MouseClick($MOUSE_CLICK_LEFT,30,100)
	If WinWait($ATD_Tip,"",$i_MinTimeout) Then			;未选中模型时弹出提示信息
	ElseIf WinWait($ATD_Title,"",$i_MinTimeout) Then	;选中模型后成功进入雕刻界面
			MouseClickDrag($ATD_Title,x1,y1,x2,y2)
			ControlClick($ATD_Title,"","Button7")
	Else                                                ;打开雕刻界面失败
		logError("Failed to open Sculpture interface;")
		Return 0
	EndIf
EndFunc
Func Smooth()
	MouseClick($MOUSE_CLICK_LEFT,92,88)
	If WinWait($ATD_Tip,"",$i_MinTimeout) Then
EndFunc