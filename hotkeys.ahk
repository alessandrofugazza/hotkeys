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

; Ins:: {
;     global
;     if LButtonIsDown {
;         Send "{LButton Up}"
;         LButtonIsDown := false
;     } else {
;         Send "{LButton Down}"
;         LButtonIsDown := true
;     }
; }

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

MouseIsOver(WinTitle) {
    MouseGetPos , , &Win
    return WinExist(WinTitle . " ahk_id " . Win)
}

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

IsCursorInMainMonitor() {
    MouseGetPos(&x, &y)
    return (x >= 0 && x <= 1920 && y >= 0 && y <= 1080)
}

#HotIf (WinActive(KindleExe) && IsCursorInMainMonitor()) || MouseIsOver(KindleExe)

EndingCharacters := [
    ".",
    ",",
    "—",
]

Space:: {
    KindleHighlight()
}

^c:: {
    KindleCopy()
}

Shift:: {
    CheckIfKindleIsActive()
    if WinGetTitle("A") == "Alessandro's Kindle for PC" {
        Click 2
    } else {
        Send "^!l"
    }
}

MButton::
{
    global KindlePointer
    MouseGetPos(&originalX, &originalY)
    if KindlePointer == "select" {
        targetX := 277
        KindlePointer := "pan"
    } else if KindlePointer == "pan" {
        targetX := 334
        KindlePointer := "select"
    } else {
        MsgBox "the fuck did you do"
        return
    }
    targetY := 70
    Click(targetX, targetY)
    MouseMove(originalX, originalY)
}

d::
XButton2:: {
    CheckIfKindleIsActive()
    Send "{Right}"
}

a::
XButton1:: {
    CheckIfKindleIsActive()
    Send "{Left}"
}

~LButton & RButton:: {
    CheckIfKindleIsActive()
    Send "{LButton Up}"
    Send "{RButton Up}"
    KindleCopy()
    Send "{RButton}"
    KindleHighlight()
}

KindleCopy() {
    Send "^c"
    sleep 100
    Lines := StrSplit(A_Clipboard, "`n")
    if (Lines.Length > 2) {
        Loop 2 {
            Lines.RemoveAt(Lines.Length)
        }
    } else {
        MsgBox "ERROR", , 1
        return
    }
    Result := ""
    for Line in Lines {
        Result .= Line "`n"
    }
    Result := SubStr(Result, 1, -2)
    LastCharacter := SubStr(Result, -1)
    if !InStr(Result, " ") || LastCharacter != "." {
        for EndingCharacter in EndingCharacters {
            if LastCharacter == EndingCharacter {
                Result := SubStr(Result, 1, -1)
                break
            }
        }
    }
    A_Clipboard := Result

}

KindleHighlight() {
    Send "{Right 3}"
    sleep 10
    Send "{Space}"
}

CheckIfKindleIsActive() {
    if !WinActive(KindleExe) {
        WinActivate(KindleExe)
    }
}