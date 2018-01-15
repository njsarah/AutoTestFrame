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
Global $treeH=ControlGetHandle($ATD_Title,"","SysTreeView321")
Global $LT[16]=[31,32,33,34,35,36,37,38,41,42,43,44,45,46,47,48]
Global $UT[16]=[11,12,13,14,15,16,17,18,21,22,23,24,25,26,27,28]
Func getUhandler()
	;展开模型树
	_GUICtrlTreeView_Expand($treeH)
	Sleep($i_MaxTimeout)
	;获得上颌的Handler
	Local $Uhandler=_GUICtrlTreeView_FindItem($treeH,$ATD_UpperJaw)
	;写入日志文件
	If $Uhandler<>0 Then
		logInfo("The Model has UpperJaw;")
	Else
		logInfo("The Model doesn't have UpperLaw;")
	EndIf
	return $Uhandler
EndFunc
Func getLhandler()
	;展开模型树
	_GUICtrlTreeView_Expand($treeH)
	Sleep($i_MaxTimeout)
	;获得下颌的Handler
	$Uhandler=_GUICtrlTreeView_FindItem($treeH,$ATD_LowerJaw)
	;写入日志文件
	If $Lhandler<>0 Then
		logInfo("The Model has LowerJaw;")
	Else
		logInfo("The Model doesn't have LowerJaw;")
	EndIf
	return $Lhandler
EndFunc

;导出模型
Func exModel($jaw_Handler,$fileType)
	If($jaw_Handler<>0) Then
		_GUICtrlTreeView_ClickItem($treeH,$jaw_Handler,"right",True,1)
		Local $pos = MouseGetPos()
		MouseClick("",$pos[0]+9,$pos[1]+40)
		Local $exhandle=WinGetHandle("Export")
		WinActivate($exhandle)
		ControlCommand($exhandle,"","ComboBox5","SelectString",$fileType)
		ControlClick($exhandle,"","Button1")
		ControlClick($exhandle,"","Button3")
		saveFile()
	Else
		logError("The parameter is wrong!")
	EndIf
EndFunc

;删除模型
Func delModel($jaw_Handler)
	If($jaw_Handler<>0) Then
		_GUICtrlTreeView_ClickItem($treeH,$jaw_Handler,"right",True,1)
		Local $pos = MouseGetPos()
		MouseClick("",$pos[0]+9,$pos[1]+90)
		Return tip()
	Else
		logError("The parameter is wrong!")
		Return 0
	EndIf
EndFunc

Func getTeethInfor($jawHandler,$tN)
	;存在的牙齿列表
	Local $arrays[1]=[0]
	Local $refarr=$arrays
	;获得上牙颌和下牙颌的Handler
	Local $uh = getUhandler()
	Local $lh = getLhandler()
	;判断上牙颌和下牙颌是否存在
	If $uh<>0 Then

	Local $i=0
	Local $j=0
	While $i<1
		Local $val =_GUICtrlTreeView_FindItem($treeH,$tN[$i])
		Sleep(1000)
		If $val<>0 Then
			_GUICtrlTreeView_ClickItem($treeH,$val,"left",True,1)
			rightClick($val)
			_ArrayInsert($refarr,$j,$tN[$i])
			$j=$j+1
		EndIf
		$i=$i+1
	WEnd
	_ArrayDelete($refarr,12)
	Return $refarr
EndFunc