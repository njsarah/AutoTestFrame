#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include "..\tasks\ATDFileTask.au3"
Global $atd_TestCase
Func testOpenFile()
	$atd_TestCase="testOpenFile"
	$i_Val = ATDOpenFile()
	If $i_Val<>1 Then
		 logTestResult($s_TestCase,$i_Val)
	EndIf
	Return VerifyOpenFile()
EndFunc