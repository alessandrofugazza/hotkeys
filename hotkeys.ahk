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
chromeExe := "ahk_exe chrome.exe"

#WheelUp:: {
    WinActivate("Main " chromeExe)
}
#WheelDown:: {
    WinMinimize("Main " chromeExe)
}

LButtonIsDown := false

Ins:: {
    global
    if LButtonIsDown {
        Send "{LButton Up}"
        LButtonIsDown := false
    } else {
        Send "{LButton Down}"
        ToolTip "LButton is down"
        LButtonIsDown := true
    }
}

#d:: Run("C:\Users\aless\Desktop")

#z:: Send("#g")


NumpadMult:: {
    choice := InputBox("1. Study`n2. Hotkeys`n3. Almost Fullscreen", "Quick Code", "w100 h200")
    choice := choice.Value
    if choice == "1"
        Run(A_ScriptDir . "`\..`\study-win`\study-win.code-workspace")
    else if choice == "2"
        Run(A_ScriptDir . "`\..`\hotkeys`\hotkeys.code-workspace")
    else if choice == "3"
        Run(A_ScriptDir . "`\..`\..`\web development`\almost-fullscreen`\almost-fullscreen.code-workspace")
    else
        MsgBox "idiot"

}

; NumpadClear:: {
;     SendInput "{Media_Stop}"
;     WinActivate "Sound Blaster Command"
;     win := WinExist("A")
;     MouseClick "Left", 50, 618
;     sleep 100
;     WinMinimize
; }

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


; * HOTIF

#HotIf MouseIsOver("ahk_class Shell_TrayWnd")

XButton2:: Send "{Media_Next}"
XButton1:: Send "{Media_Play_Pause}"

MouseIsOver(WinTitle) {
    MouseGetPos , , &Win
    return WinExist(WinTitle . " ahk_id " . Win)
}

#HotIf WinActive(chromeExe)

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
    ; MsgBox search
    ; A_Clipboard := search
    ; ClipWait
    send "^t"
    send "https://www.bing.com/"
    send "{Enter}"
    sleep 1000
    send search
    send "{enter}"
}

KindleSourceStrings := [
    "Meyers, Mike; Everett, Travis A.; Hutz, Andrew. CompTIA A+ Certification All-in-One Exam Guide, Eleventh Edition (Exams 220-1101 & 220-1102)",
    "Sartre, Jean-Paul. L'être et le néant. Essai d'ontologie phénoménologique (French Edition)",
    "McFedries, Paul. MOS Study Guide for Microsoft Excel Expert Exam MO-201",
    "Rochester, Myrna Bell. Easy French Step-by-Step: Master High-Frequency Grammar for French Proficiency--Fast!",
    "Nietzsche, Friedrich Wilhelm. Menschliches, Allzumenschliches (German Edition)",
    "Wright, Robert. The Moral Animal: Why We Are, the Way We Are: The New Science of Evolutionary Psychology",
    "Rousseau, Jean-Jacques. Du Contrat Social (French Edition)",
]
EndingCharacters := [
    ".",
    ",",
    "—",
]
#HotIf WinActive("ahk_exe Kindle.exe")

Space:: {
    KindleHighlight()
}

^c:: {
    KindleCopy()
}

Shift:: {
    if WinGetTitle("A") == "Alessandro's Kindle for PC" {
        Click 2
    } else {
        Send "^!l"
    }
}

XButton2:: {
    Send "{Right}"
}

XButton1:: {
    Send "{RButton}"
    KindleHighlight()
}

; XButton1:: {
;     Send "{Left}"
; }
; ~XButton2 Up:: {
~LButton & RButton:: {
    BlockInput(true)
    Send "{LButton Up}"
    Send "{RButton Up}"
    KindleCopy()
    Send "{RButton}"
    KindleHighlight()
    BlockInput(false)
}

; ~RButton:: {
;     ; When right mouse button is pressed down, send left mouse button down
;     Send("{LButton down}")
; }

; ~RButton Up:: {
;     ; When right mouse button is released, send left mouse button up
;     Send("{LButton up}")
; }

; RButton:: {
;     Send "{LButton}"
; }

KindleCopy() {
    SourcePos := 0
    Send "^c"
    sleep 100
    for String in KindleSourceStrings {
        if (SourcePos := (InStr(A_Clipboard, String) - 5)) > 0 {
            A_Clipboard := SubStr(A_Clipboard, 1, SourcePos)
            LastCharacter := SubStr(A_Clipboard, -1)
            if !InStr(A_Clipboard, " ") || LastCharacter != "." {
                for EndingCharacter in EndingCharacters {
                    if LastCharacter == EndingCharacter {
                        A_Clipboard := SubStr(A_Clipboard, 1, -1)
                        break
                    }
                }
            }
            break
        }
    }
}

KindleHighlight() {
    Send "{Right 3}"
    sleep 10
    Send "{Space}"
}