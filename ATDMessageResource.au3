#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#RequireAdmin
#include "ATDConstants.au3"
Global $h_File
testEnv()
;记录测试环境
Func testEnv()
;打开日志文件
	$h_File = FileOpen($s_LogFileName,$FO_APPEND)
	;记录系统版本
	FileWriteLine($h_File, "System_Version = "& @OSVersion)
	;记录机器 CPU
	FileWriteLine($h_File, "Machine_CPU = "&@CPUArch)
	;记录系统语言
	FileWriteLine($h_File, "System_Language = "&@OSLang)
	;记录机器 IP
	FileWriteLine($h_File, "Machine_IP = "& @IPAddress1)
	;记录测试执行人员
	FileWriteLine($h_File, "Test_Executor = "& @UserName & @CRLF & @CRLF)
EndFunc
;将日志信息写入文件
Func logInfo($atd_Content)
	logToFile("INFO"&$atd_Content)
EndFunc
;将错误日志写入文件
Func logError($atd_Content)
	logToFile("ERROR"&$atd_Content)
EndFunc
;将日志写入文件
Func logToFile($atd_Content)
	FileWriteLine($h_File,"[" & @YEAR & "-" & @MON & "-" & @MDAY & _
             " " & @HOUR & ":" & @MIN & ":" &@SEC & "] " &$atd_Content)
	FileFlush($h_File)
EndFunc
; 将测试结果写入文件
Func logTestResult($s_TestCase,$i_Val)
	If $i_Val = 1 Then
		logInfo("Test Case [" & $s_TestCase &"] Execution Result: " & _
				$s_TestResult & @CRLF & @CRLF)
		$i_TestPassCounter = $i_TestPassCounter + 1
	Else
		$s_TestResult = "Failed"
		logError("Test Case [" & $s_TestCase &"] Execution Result: " & _
				$s_TestResult & @CRLF & @CRLF)
		$i_TestFailureCounter = $i_TestFailureCounter + 1
	EndIf
EndFunc