       #cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#RequireAdmin
#include "..\ATDConstants.au3"
#include <GuiButton.au3>
Opt("MouseCoordMode", 0)
Opt("MouseClickDragDelay", 250)
;雕刻或光顺
Func FixModel($TeethNum,$fixX,$fixY,$btnNum)
	MouseClick($MOUSE_CLICK_LEFT,$fixModelX,$fixModelY)
	Send("{F4}")                                       ;45度角显示模型
	Sleep($i_MaxTimeout)
	Local $rc = getModelInfor($TeethNum)
	MouseClick($MOUSE_CLICK_LEFT,$fixX,$fixY)
	If WinWait($ATD_Tip,"",$i_MinTimeout) Then			;未选中模型时弹出提示信息
		ControlClick($ATD_Tip,"","Button1")
		logInfo("The teeth doesn't exisit："&$TeethNum)
		Return 0
	ElseIf WinWait($ATD_Title,"",$i_MinTimeout) Then	;选中模型后成功进入雕刻/光顺界面
		logInfo("Sucessfully enter into FixModel.")
		$btn_handle = ControlGetHandle($ATD_Title,"","Button"&$btnNum)
		_GUICtrlButton_SetCheck($btn_handle, $BST_CHECKED)
		Local $pos = WinGetPos($ATD_Title)    ;获得坐标、长度和宽度值
		Local $x = $pos[2]/2                  ;获得坐标X值
		Local $y = $pos[3]/2                  ;获得坐标Y值
		Local $maxX = $x+300				  ;设定鼠标移动的范围
		Local $maxY = $y+400
		Local $minX = $x-300
		Local $minY = $y-250
		MsgBox(0,"Value",$maxX&"-"&$maxY&"-"&$minX&"-"&$minY)
		logInfo("Start to fix model.")
		For $i=1 To 20 Step +1
			Local $tmpX1 = Random($minX,$maxX,0)
			Local $tmpY1 = Random($minY,$maxY,0)
			Local $tmpX2 = Random($minX,$maxX,0)
			Local $tmpY2 = Random($minY,$maxY,0)
			MouseClickDrag($MOUSE_CLICK_LEFT,$tmpX1,$tmpY1,$tmpX2,$tmpY2)
		Next
			logInfo("Stop to fix model.")
			ControlClick($ATD_Title,"","Button"&$btnNum+1)
			Return 1
	Else                                                ;打开雕刻界面失败
		logError("Failed to enter into FixModel.")
		Return 0
	EndIf
EndFunc
;颌平面功能测试
Func JawPlane()
	MouseClick($MOUSE_CLICK_LEFT,$fixModelX,$fixModelY)
	Sleep($i_MaxTimeout)
	MouseClick($MOUSE_CLICK_LEFT,$jawPlaneX,$jawPlaneY)
	If WinWait($ATD_Tip,"",$i_MinTimeout) Then             ;有方案设计时提示
		logInfo("Exist a program,so give a tip.")
		ControlClick($ATD_Tip,"","Button1")
	EndIf

	If WinWait($ATD_Title,"",$i_MinTimeout) Then
		logInfo("Start to adjust jawPlane.")
		MouseClickDrag($MOUSE_CLICK_LEFT,1530,586,1530,596)
		MouseClickDrag($MOUSE_CLICK_LEFT,914,964,925,964)
		MouseClickDrag($MOUSE_CLICK_LEFT,296,583,296,596)
		logInfo("Stop to adjust jawPlane.")
		ControlClick($ATD_Title,"","Button15")
		Return 1;
	Else
		logError("Failed to enter into jawPlane.")
		Return 0
	EndIf
EndFunc
;验证成功雕刻模型
Func VerifySculptureModel()
	If WinWait($ATD_Tip,"",$i_MinTimeout)<>0 Then
		logInfo("Sucessfully sculputure Model.")
		tip($ATD_Tip)
		Return 1
	Else
		logError("Failed to sculputure Model.")
		Return 0
	EndIf
EndFunc
;验证成功光顺模型
Func VerifySmoothModel()
	If WinWait($ATD_SmoothTip,"",$i_MinTimeout)<>0 Then
		logInfo("Sucessfully smooth Model.")
		tip($ATD_SmoothTip)
		Return 1
	Else
		logError("Failed to smooth Model.")
		Return 0
	EndIf
EndFunc
;验证是否成功颌平面调整
Func VerifyAdjustPlane()
	If WinWait($ATD_Tip,"",$i_MinTimeout)<>0 Then
		logInfo("Sucessfully adjust jaw plane")
		tip($ATD_Tip)
		ControlClick($ATD_Title,"","Button17")
		Return 1
	Else
		logError("Failed to adjust jaw plane.")
		Return 0
	EndIf
EndFunc
