#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include "..\tasks\ATDFileTask.au3"
#include "..\tasks\ATDTreeView.au3"
#include "..\utilities\Logger.au3"
Global $atd_TestCase
Func testOpenFile()
	$atd_TestCase="testOpenFile"
	$i_Val = ATDOpenFile()
	If $i_Val=0 Then
		logTestResult($atd_TestCase,$i_Val)
		Return 0
	EndIf
	Return VerifyOpenFile()
EndFunc
Func testExportFile()
	$atd_TestCase = "testExportFile"
	$i_Val = ATDExportFile()
	If $i_Val = 0 Then
		logTestResult($atd_TestCase,$i_Val)
	EndIf
	Return VerifySaveFile()
EndFunc
Func testSaveAsFile()
	$atd_TestCase = "testSaveAsFile"
	$i_Val = ATDSaveAsFile()
	If $i_Val = 0 Then
		logTestResult($atd_TestCase,$i_Val)
	EndIf
	Return VerifySaveFile()
EndFunc
Func testSaveFile()
	$atd_TestCase = "testSaveFile"
	$i_Val = ATDSaveFile()
	Return VerifySaveFile()
EndFunc
Func testCloseFile()
	$atd_TestCase = "testCloseFile"
	$i_Val = ATDCloseFile()
	If $i_Val = 0 Then
		logTestResult($atd_TestCase,$i_Val)
	EndIf
	Return VerifyCloseFile()
EndFunc

Func testExportModel($fileType)
	$atd_TestCase = "testExportModel"
	Local $Uhandler = getModelInfor("上牙颌")
	Local $Lhandler
	If $Uhandler <>0 Then
		$i_Val = exModel($Uhandler,$fileType)
	Else
		$Lhandler = getModelInfor("下牙颌")
		If $Lhandler <>0 Then
			$i_Val = exModel($Lhandler,$fileType)
		;Else
			;$i_Val = exModel(,"STL")
		EndIf
	EndIf
	If $i_Val = 0 Then
		logTestResult($atd_TestCase,$i_Val)
	EndIf
	Return VerifyExportFile()
EndFunc
Func testDelModel()
	$atd_TestCase = "testDelModel"
	Local $Uhandler = getModelInfor("上牙颌")
	Local $Lhandler
	If $Uhandler <>0 Then
		$i_Val = delModel($Uhandler)
	Else
		$Lhandler = getModelInfor("下牙颌")
		If $Lhandler <>0 Then
			$i_Val = delModel($Lhandler)
		;Else
			;$i_Val = exModel(,"STL")
		EndIf
	EndIf
	;$i_Val = delModel()
	If $i_Val = 0 Then
		logTestResult($atd_TestCase,$i_Val)
	EndIf
	Return VerifyOpenFile()
EndFunc
Func testReplaceModel()
	$atd_TestCase = "testReplaceModel"
	Local $Uhandler = getModelInfor("上牙颌")
	Local $Lhandler
	If $Uhandler <>0 Then
		$i_Val = replaceModel($Uhandler)
	Else
		$Lhandler = getModelInfor("下牙颌")
		If $Lhandler <>0 Then
			$i_Val = replaceModel($Lhandler)
		;Else
			;$i_Val = exModel(,"STL")
		EndIf
	EndIf
	If $i_Val = 0 Then
		logTestResult($atd_TestCase,$i_Val)
	EndIf
	Return VerifyOpenFile()
EndFunc