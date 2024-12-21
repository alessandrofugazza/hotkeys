#Include %A_ScriptDir%\utility-functions\MouseIsOver.ahk

#HotIf MouseIsOver("ahk_class Shell_TrayWnd")

XButton2:: Send "{Media_Next}"
XButton1:: Send "{Media_Play_Pause}"