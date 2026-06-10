A_MenuMaskKey := "vkE8"
A_ScriptName := "Hotkeys"
A_IconTip := "Hotkeys"

CoordMode("Mouse", "Screen")


IconPath := ".\tray-icon.png"
TraySetIcon IconPath

KindlePointer := "pan"
AdobePointer := "pan"

; exes
ChatGPTExe := "ahk_exe ChatGPT.exe"

#Include UtilityFunctions.ahk

; !F1:: {
;     WinActivate("Alessandro's Kindle for PC")

; }
; !F1:: {
;     Send("{LWin Down}a{LWin Up}")
;     sleep 100
;     send("{Enter}")
; }

#WheelDown:: {
    ; WinActivate("ITA " ChromeExe)
    WinActivate(ChatGPTExe)

}
#WheelUp:: {
    WinActivate("MAIN " ChromeExe)
}


LButtonIsDown := false


#d:: Run("C:/Users/aless/MyLibrary/projects/personal/")

; #z:: Send("#g")

; NumpadClear:: {
;     spotifyExe := "ahk_exe Spotify.exe"
;     if WinActive(spotifyExe)
;         WinMinimize(spotifyExe)
;     else
;         WinActivate(spotifyExe)
; }

; Pause:: DllCall("PowrProf\SetSuspendState", "Int", 0, "Int", 0, "Int", 0)

^XButton1:: send "{enter}"

+XButton1:: Send "{Media_Play_Pause}"

toggle := false

F1:: {
    global toggle
    toggle := !toggle
    if toggle {
        SendEvent("{LButton down}")
    } else {
        SendEvent("{LButton up}")
    }
}

#HotIf WinActive("ahk_exe parsecd.exe")

LAlt::LWin
LWin::LAlt
RAlt::RWin
RWin::RAlt

#HotIf


#Include Chrome.ahk
#Include Adobe.ahk
#Include Kindle.ahk
#Include Tray.ahk