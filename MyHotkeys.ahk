A_MenuMaskKey := "vkE8"
A_ScriptName := "Hotkeys"
A_IconTip := "Hotkeys"

CoordMode("Mouse", "Screen")


IconPath := "C:\Users\aless\Desktop\projects\personal\ahk\hotkeys\tray-icon.png"
TraySetIcon IconPath

; intervals

defaultInterval := 50
mediumInterval := 250
semilongInterval := 1000
longInterval := 4000
superlongInterval := 7000

KindlePointer := "pan"
AdobePointer := "pan"

; exes
ChromeExe := "ahk_exe chrome.exe"
KindleExe := "ahk_exe kindle.exe"
AdobeExe := "ahk_exe Acrobat.exe"
ChatGPT := "ahk_exe ChatGPT.exe"

#Include UtilityFunctions.ahk

; MyGui := Gui()

; checkbox := MyGui.Add("Checkbox", "vMyCheckbox", "Enable Feature")

; button := MyGui.Add("Button", "Default", "Submit")

; button.OnEvent("Click", OnButtonClick)

; OnButtonClick(*) {
;     MyGui.Submit()
;     isChecked := MyGui["MyCheckbox"].Value
;     MsgBox(isChecked ? "Feature Enabled" : "Feature Disabled")
; }

; MyGui.Show()

!F1:: {
    Send("{LWin Down}a{LWin Up}")
    sleep 100
    send("{Enter}")
}

#WheelDown:: {
    WinActivate(ChatGPT)
}
#WheelUp:: {
    WinActivate("Main " ChromeExe)
}

LButtonIsDown := false


#d:: Run("C:\Users\aless\Desktop")

; #z:: Send("#g")


Ins:: {
    choice := InputBox("1. Hotkeys", "Quick Code", "w100 h200")
    choice := choice.Value
    if choice == "1"
        Run(A_ScriptDir . "`\..`\hotkeys`\hotkeys.code-workspace")
    else
        MsgBox "idiot"

}

; NumpadClear:: {
;     spotifyExe := "ahk_exe Spotify.exe"
;     if WinActive(spotifyExe)
;         WinMinimize(spotifyExe)
;     else
;         WinActivate(spotifyExe)
; }

Pause:: DllCall("PowrProf\SetSuspendState", "Int", 0, "Int", 0, "Int", 0)

^XButton1:: send "{enter}"

+XButton1:: Send "{Media_Play_Pause}"


; * HOTIF

#HotIf MouseIsOver("ahk_class Shell_TrayWnd")

XButton2:: Send "{Media_Next}"
XButton1:: Send "{Media_Play_Pause}"


#HotIf WinActive(ChromeExe)

^d::
{
    ; A_Clipboard := ''
    send '^c'
    sleep 100
    ; ClipWait
    ; if (WinActive(ChromeExe)) {
    ;     search := "define " . A_Clipboard
    ; } else {
    ;     word := InputBox("Enter the word to define", "Dictionary").value
    ;     search := "define " . word
    ; }
    search := "define " . A_Clipboard
    Run("https://www.bing.com/")
    sleep 700
    send search
    send "{enter}"
}

^s:: {
    send("^d")
}


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

#Include Kindle.ahk