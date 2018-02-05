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
#cs
;调用函数执行测试导出文件
$i_Val = testExportFile()
logTestResult($atd_TestCase,$i_Val)
;调用函数执行测试另存文件
$i_Val = testSaveAsFile()
logTestResult($atd_TestCase,$i_Val)
#ce
$i_Val = testExportModel("DDM")
logTestResult($atd_TestCase,$i_Val)
endLogging()
