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
ChatGPTExe := "ahk_exe ChatGPT.exe"

#Include UtilityFunctions.ahk

#Include GUI.ahk

!F1:: {
    Send("{LWin Down}a{LWin Up}")
    sleep 100
    send("{Enter}")
}

#WheelDown:: {
    WinActivate(ChatGPTExe)
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


#Include Chrome.ahk
#Include Adobe.ahk
#Include Kindle.ahk