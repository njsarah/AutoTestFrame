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
Func testExportModel($fileType)
	$atd_TestCase = "testExportModel"
	Local $Uhandler = getUhandler()
	Local $Lhandler = getLhandler()
	If $Uhandler<>0 Then
		$i_Val = exModel($Uhandler,$fileType)
	ElseIf $Lhandler<>0 Then
		$i_Val = exModel($Lhandler,$fileType)
	;Else
		;$i_Val = exModel(,"STL")
	EndIf
	If $i_Val = 0 Then
		logTestResult($atd_TestCase,$i_Val)
	EndIf
	Return VerifySaveFile()
EndFunc