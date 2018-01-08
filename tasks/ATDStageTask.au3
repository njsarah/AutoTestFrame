#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#RequireAdmin
#include "..\ATDConstants.au3"
#include "..\ATDMessageResource.au3"
Func openStage()
	Send("{F10}")
EndFunc
Func openArch()
	Send("{6}")
	Sleep($i_MaxTimeout)
	Send("{6}")
	Sleep($i_MaxTimeout)
	Send("{7}")
	Sleep($i_MaxTimeout)
	Send("{7}")
	Sleep($i_MaxTimeout)
EndFunc
Func setFrame()
	Send("{1}")
	Send("{SPACE}")
	Sleep($i_MaxTimeout)
	Send("{T}")
	Sleep($i_MaxTimeout)
	Send("{R}")
	Sleep($i_MaxTimeout)
	Send("!SPACE")
	Sleep($i_MaxTimeout)
	Send("!T")
	Sleep($i_MaxTimeout)
	Send("!R")
	Sleep($i_MaxTimeout)
EndFunc
Func setIPR()
	Send("{M}")
	Sleep($i_MaxTimeout)
	Send("{J}")
	Sleep($i_MaxTimeout)
	Send("{,}")
	Sleep($i_MaxTimeout)
	Send("{K}")
	Sleep($i_MaxTimeout)
EndFunc

