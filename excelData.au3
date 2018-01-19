#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <Excel.au3>
Local $oExcel
Local $oWorkbook

; 打开 Excel 文档
Func openExcel($s_FilePath)
	$oExcel = _Excel_Open()
	If @error Then Exit logError("Failed to connect existing Excel instance @error = "&@error&",@extended = "&@extended)
	$oWorkbook = _Excel_BookOpen($oExcel,$s_FilePath)
	If @error Then Exit logError("Failed to open Excel @error = "&@error&",@extended = "&@extended)
EndFunc
; 读入值
Func readExcelData($location)
 Local $s_CellValue = _Excel_RangeRead($oWorkbook,Default,$location)
 If @error Then Exit logError("Failed to get Cell @error = "&@error&",@extended = "&@extended)
 Return $s_CellValue
EndFunc
; 关闭 Excel 文档
Func closeExcel()
 _Excel_Close($oExcel,Default,True)
EndFunc