#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#RequireAdmin
#include <GuiTreeView.au3>
#include <Array.au3>
#include <GuiButton.au3>

Opt("MouseCoordMode",0)
Global $mark ;mark为1代表没有上颌；为0代表没有下颌
Global $Uhandler,$Lhandler,$treeH
Global $LT[16]=[31,32,33,34,35,36,37,38,41,42,43,44,45,46,47,48]
Global $UT[16]=[11,12,13,14,15,16,17,18,21,22,23,24,25,26,27,28]
Local $teethNums[2]
Global Const $ddmFile = "DDM"
Global Const $stlFile = "STL"
#cs
Func getUhandler($treeH)
	_GUICtrlTreeView_Expand($treeH)
	Sleep(2000)
	$Uhandler=_GUICtrlTreeView_FindItem($treeH,"上牙颌")
	return $Uhandler
EndFunc
Func getLhandler($treeH)
	_GUICtrlTreeView_Expand($treeH)
	Sleep(2000)
	$Uhandler=_GUICtrlTreeView_FindItem($treeH,"下牙颌")
	return $Lhandler
EndFunc
#ce
Func getTeethNums($handler)
	$treeH=ControlGetHandle($handler,"","SysTreeView321")
	_GUICtrlTreeView_Expand($treeH)
	Sleep(2000)
	$Uhandler=_GUICtrlTreeView_FindItem($treeH,$ATD_UpperJaw)
	_GUICtrlTreeView_ClickItem($treeH,$Uhandler,"left",True,1)
	;rightClick($Uhandler)
	If $Uhandler>0 Then
		$teethNums[0] = _GUICtrlTreeView_GetChildCount($treeH,$Uhandler)
	EndIf
	If $Uhandler==0 Then
		$mark=1
		$teethNums[0]=-1
	EndIf
	$Lhandler=_GUICtrlTreeView_FindItem($treeH,$ATD_LowerJaw)
	;rightClick($Lhandler)
	If $Lhandler>0 Then
		$teethNums[1] = _GUICtrlTreeView_GetChildCount($treeH,$Lhandler)
	EndIf
	If $Lhandler==0 Then
		$mark=0
		$teethNums[1]=-1
	EndIf
	getTeethInfor($treeH,$LT)
	Return $teethNums
EndFunc

Func getTeethInfor($treeH,$tN)
	Local $arrays[1]=[0]
	Local $refarr=$arrays
	Local $i=0
	Local $j=0
	While $i<1
		Local $val =_GUICtrlTreeView_FindItem($treeH,$tN[$i])
		;_GUICtrlTreeView_ClickItem($treeH,$val,"left",True,2)
		Sleep(1000)
		If $val>0 Then
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
Func rightClick($ahandler)
	_GUICtrlTreeView_ClickItem($treeH,$ahandler,"right",True,1)
	Sleep(1000)
	Global $pos = MouseGetPos()			;0代表非简化模型，1代表简化模型
	exportModel($pos,$stlFile)
	_GUICtrlTreeView_ClickItem($treeH,$ahandler,"right",True,1)
	exportModel($pos,$stlFile)
	_GUICtrlTreeView_ClickItem($treeH,$ahandler,"right",True,1)
	exportModel($pos,$ddmFile)
	_GUICtrlTreeView_ClickItem($treeH,$ahandler,"right",True,1)
	exportModel($pos,$ddmFile)
EndFunc
Func exportModel($pos,$fileType)
	MouseClick("",$pos[0]+9,$pos[1]+40)
	Local $exhandle=WinGetHandle("Export")
	WinActivate($exhandle)
	Local $btnHandle = ControlGetHandle($exhandle,"","Button1")
	#cs
	MsgBox(0,"State",_ExplainCheckState(_GUICtrlButton_GetState($btnHandle)))
	_GUICtrlButton_SetCheck($btnHandle,$BST_CHECKED)
	_GUICtrlButton_SetFocus($btnHandle)
	MsgBox(0,"value",_ExplainCheckState(_GUICtrlButton_GetCheck($btnHandle)))
	#ce
	ControlClick($exhandle,"","Button1")
	ControlCommand($exhandle,"","ComboBox5","SelectString",$fileType)
	exportFile($exhandle)

EndFunc
Func exportFile($exhandle)
	ControlClick($exhandle,"","Button3")
	Sleep(500)
	Local $saveHandle = WinGetHandle($ATD_SaveAsDialog)
	WinActivate($saveHandle)
	ControlClick($saveHandle,"","Button1")
	Sleep(500)
	Local $alerHandel1 = WinGetHandle("确认另存为")
	If $alerHandel1>0 Then
		WinActivate($alerHandel1)
		ControlClick($alerHandel1,"","Button1")
	EndIf
	Sleep(1000)
	Local $alertHandel = WinGetHandle($ATD_Tip)
	WinActivate($alertHandel)
	ControlClick($alertHandel,"","Button1")
EndFunc
Func _ExplainCheckState($iState)
	;MsgBox(0,"test",$iState)
    Switch $iState
        Case $BST_CHECKED
            Return 1
        Case $BST_INDETERMINATE
            Return -1
        Case $BST_UNCHECKED
            Return 2
    EndSwitch
EndFunc   ;==>_ExplainCheckState

