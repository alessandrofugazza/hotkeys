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