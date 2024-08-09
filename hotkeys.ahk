A_MenuMaskKey := "vkE8"
A_ScriptName := "Hotkeys"
A_IconTip := "Hotkeys"


IconPath := "C:\Users\aless\Desktop\projects\personal\ahk\hotkeys\tray-icon.png"
TraySetIcon IconPath

; intervals

defaultInterval := 50
mediumInterval := 250
semilongInterval := 1000
longInterval := 4000
superlongInterval := 7000

; exes
ChromeExe := "ahk_exe chrome.exe"
KindleExe := "ahk_exe kindle.exe"

#WheelUp:: {
    WinActivate("Main " ChromeExe)
}
#WheelDown:: {
    WinMinimize("Main " ChromeExe)
}

LButtonIsDown := false

Ins:: {
    global
    if LButtonIsDown {
        Send "{LButton Up}"
        LButtonIsDown := false
    } else {
        Send "{LButton Down}"
        LButtonIsDown := true
    }
}

#d:: Run("C:\Users\aless\Desktop")

#z:: Send("#g")


NumpadMult:: {
    choice := InputBox("1. Hotkeys`n2. Study`n3. Almost Fullscreen", "Quick Code", "w100 h200")
    choice := choice.Value
    if choice == "1"
        Run(A_ScriptDir . "`\..`\hotkeys`\hotkeys.code-workspace")
    else if choice == "2"
        Run(A_ScriptDir . "`\..`\study-win`\study-win.code-workspace")
    else if choice == "3"
        Run(A_ScriptDir . "`\..`\..`\web-development`\almost-fullscreen`\almost-fullscreen.code-workspace")
    else
        MsgBox "idiot"

}

NumpadClear:: {
    spotifyExe := "ahk_exe Spotify.exe"
    if WinActive(spotifyExe)
        WinMinimize(spotifyExe)
    else
        WinActivate(spotifyExe)
}

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
    A_Clipboard := ''
    send '^c'
    ClipWait
    if (A_Clipboard) {
        search := "define " . A_Clipboard
    } else {
        word := InputBox("Enter the word to define", "Dictionary").value
        search := "define " . word
    }
    send "^t"
    send "https://www.bing.com/"
    send "{Enter}"
    sleep 1000
    send search
    send "{enter}"
}

EndingCharacters := [
    ".",
    ",",
    "—",
]

#HotIf WinActive("ahk_exe Kindle.exe") || MouseIsOver("ahk_exe Kindle.exe")

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

XButton2:: {
    CheckIfKindleIsActive()
    Send "{Right}"
}

XButton1:: {
    CheckIfKindleIsActive()
    Send "{Left}"
}

~LButton & RButton:: {
    CheckIfKindleIsActive()
    BlockInput(true)
    Send "{LButton Up}"
    Send "{RButton Up}"
    KindleCopy()
    Send "{RButton}"
    KindleHighlight()
    BlockInput(false)
}

KindleCopy() {
    Send "^c"
    sleep 100
    Lines := StrSplit(A_Clipboard, "`n")
    Loop 2 {
        Lines.RemoveAt(Lines.Length)
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