#Include %A_ScriptDir%/utility-functions/MouseIsOver.ahk

AdobeExe := "ahk_exe Acrobat.exe"

#HotIf MouseIsOver(AdobeExe)

MButton::
{
    global AdobePointer
    if AdobePointer == "select" {
        ChangeCursorKey := "h"
        AdobePointer := "pan"
    } else if AdobePointer == "pan" {
        ChangeCursorKey := "v"
        AdobePointer := "select"
    } else {
        MsgBox "the fuck did you do"
        return
    }
    Send(ChangeCursorKey)
}