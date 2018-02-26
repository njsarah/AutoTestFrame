#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#RequireAdmin
#include <GuiTreeView.au3>
Global $treeH
Global $LT[16]=[31,32,33,34,35,36,37,38,41,42,43,44,45,46,47,48]
Global $UT[16]=[11,12,13,14,15,16,17,18,21,22,23,24,25,26,27,28]
Func getModelInfor($teethInfor)
	$treeH=ControlGetHandle($ATD_Title,"","SysTreeView321")
	Sleep($i_MaxTimeout)
	;获得所要查找的Handler
	Local $teethHandler=_GUICtrlTreeView_FindItem($treeH,$teethInfor)
	If $teethHandler<>0 Then
		_GUICtrlTreeView_ClickItem ($treeH, $teethHandler,"left",False,1)
		logInfo("The Model has "&$teethInfor&".")
	Else
		logInfo("The Model doesn't have "&$teethInfor&".")
	EndIf
	return $teethHandler
EndFunc
#cs
Func getUhandler()
	$treeH=ControlGetHandle($ATD_Title,"","SysTreeView321")
	Sleep($i_MaxTimeout)
	;获得上颌的Handler
	Local $Uhandler=_GUICtrlTreeView_FindItem($treeH,$ATD_UpperJaw)
	;MsgBox(0,"Handler",$Uhandler)
	;写入日志文件
	If $Uhandler<>0 Then
		logInfo("The Model has UpperJaw;")
	Else
		logInfo("The Model doesn't have UpperLaw;")
	EndIf
	return $Uhandler
EndFunc
Func getLhandler()
	$treeH=ControlGetHandle($ATD_Title,"","SysTreeView321")
	Sleep($i_MaxTimeout)
	;获得下颌的Handler
	Local $Lhandler=_GUICtrlTreeView_FindItem($treeH,$ATD_LowerJaw)
	;写入日志文件
	If $Lhandler<>0 Then
		logInfo("The Model has LowerJaw;")
	Else
		logInfo("The Model doesn't have LowerJaw;")
		Return 0
	EndIf
	return $Lhandler
EndFunc
#ce
;导出模型
Func exModel($jaw_Handler,$fileType)
	_GUICtrlTreeView_Expand($treeH,'',True)
	If($jaw_Handler<>0) Then
		_GUICtrlTreeView_ClickItem($treeH,$jaw_Handler,"right",True,2)
		Local $pos = MouseGetPos()
		MouseClick("",$pos[0]+9,$pos[1]+40)
		Local $exhandle=WinGetHandle("Export")
		WinActivate($exhandle)
		ControlCommand($exhandle,"","ComboBox5","SelectString",$fileType)
		ControlClick($exhandle,"","Button1")
		ControlClick($exhandle,"","Button3")
		Return saveFile()
	Else
		logError("The parameter is wrong!")
		Return 0
	EndIf
EndFunc
;删除模型
Func delModel($jaw_Handler)
	If($jaw_Handler<>0) Then
		_GUICtrlTreeView_ClickItem($treeH,$jaw_Handler,"right",True,1)
		Local $pos = MouseGetPos()
		MouseClick("",$pos[0]+9,$pos[1]+90)
		Return tip($ATD_Tip)
	Else
		logError("The parameter is wrong!")
		Return 0
	EndIf
EndFunc
;替换模型
Func replaceModel($jaw_Handler)
	If($jaw_Handler<>0) Then
		_GUICtrlTreeView_ClickItem($treeH,$jaw_Handler,"right",True,1)
		Local $pos = MouseGetPos()
		MouseClick("",$pos[0]+9,$pos[1]+75)
		If WinWait($ATD_SelectFile,"",$i_MinTimeout)<>0 Then
			Return openFile("C:\Users\dongqianqian\Desktop\Special\模型1\r1.ddm")
		ElseIf WinWait($ATD_Tip,"",$i_MinTimeout)<>0 Then
			tip($ATD_Tip)
			If WinWait($ATD_SelectFile,"",$i_MinTimeout)<>0 Then
				Return openFile("C:\Users\dongqianqian\Desktop\Special\模型1\r1.ddm")
			Else
				logError("Failed to replace Model;")
				Return 0
			EndIf
		Else
			logError("Failed to replace Model;")
			Return 0
		EndIf
	Else
		logError("The parameter is wrong!")
		Return 0
	EndIf
EndFunc
