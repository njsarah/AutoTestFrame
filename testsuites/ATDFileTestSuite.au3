#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include "..\testcases\ATDFileTests.au3"
;启动日志
startLogging()
testEnv()
;调用函数执行测试打开文件
$i_Val = testOpenFile()
logTestResult($atd_TestCase,$i_Val)
If $i_Val <> 0 Then
	;调用函数执行测试导出文件
	$i_Val = testExportFile()
	logTestResult($atd_TestCase,$i_Val)
	;调用函数执行测试另存文件
	$i_Val = testSaveAsFile()
	logTestResult($atd_TestCase,$i_Val)
	;调用函数执行保存文件
	$i_Val = testSaveFile()
	logTestResult($atd_TestCase,$i_Val)
	;调用函数执行关闭文件
	$i_Val = testCloseFile()
	logTestResult($atd_TestCase,$i_Val)
Else
	Exit
EndIf
#cs
$i_Val = testExportModel("DDM")
logTestResult($atd_TestCase,$i_Val)
#ce
endLogging()
