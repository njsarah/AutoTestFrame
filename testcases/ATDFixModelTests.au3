#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include "..\tasks\ATDFixModelTask.au3"
Global $atd_TestCase
Func testSculpture($teethNum)
	$atd_TestCase="testSculpture"
	$i_Val = FixModel($teethNum,$SculptureX,$SculptureY,6)
	If $i_Val=0 Then
		logTestResult($atd_TestCase,$i_Val)
		Return 0
	EndIf
	Return VerifySculptureModel()
EndFunc
Func testSmooth($teethNum)
	$atd_TestCase="testSmooth"
	$i_Val = FixModel($teethNum,$SmoothX,$SmoothY,11)
	If $i_Val=0 Then
		logTestResult($atd_TestCase,$i_Val)
		Return 0
	EndIf
	Return VerifySmoothModel()
EndFunc
Func testAjustPlane()
	$atd_TestCase="testAdjustPlane"
	$i_Val = JawPlane()
	If $i_Val=0 Then
		logTestResult($atd_TestCase,$i_Val)
		Return 0
	EndIf
	Return VerifyAdjustPlane()
EndFunc