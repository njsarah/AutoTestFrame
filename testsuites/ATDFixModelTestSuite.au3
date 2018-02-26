#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include "..\testcases\ATDFixModelTests.au3"
#include "..\testcases\ATDFileTests.au3"
;启动日志
startLogging()
testEnv()
;调用函数执行测试打开文件
$i_Val = testOpenFile()
logTestResult($atd_TestCase,$i_Val)
If $i_Val <> 0 Then
	;For $i=0 To 1 Step +1
	;调用函数执行测试雕刻
		$i_Val = testSculpture("12")
		logTestResult($atd_TestCase,$i_Val)
	;调用函数执行测试光顺
		$i_Val = testSmooth("12")
		logTestResult($atd_TestCase,$i_Val)
		$i_Val = testAjustPlane()
		logTestResult($atd_TestCase,$i_Val)
	;Next
		;Exit
Else
	Exit
EndIf

endLogging()