#Requires AutoHotkey v2.0

#Include "functions.ahk"

CoordMode "Mouse", "Screen"

fans_active := IniRead("settings.ini", "states", "fans_active")
; active_vpn := IniRead("settings.ini", "states", "active_vpn")

default_interval := 50
medium_interval := 250
semilong_interval := 1000
long_interval := 4000
superlong_interval := 7000

proton := "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Proton\Proton VPN.lnk"
siv := ".\SIV_task_shortcut.lnk"
soloPath := "C:\Users\aless\Whatever\PS\rpcs3-v0.0.27-14935-711afeb6_win64\rpcs3.exe"
multiPath := "C:\XboxGames\Halo Infinite\Content\HaloInfinite.exe"

halo_mode := "C:\Users\aless\OneDrive\Desktop\Coding\Python\halo-mode\__pycache__\halo_mode.cpython-311.pyc"

numpadleft:: {
    Run("C:\Users\aless\AppData\Local\GitHubDesktop\GitHubDesktop.exe")
    WinWait "GitHub Desktop"
    WinMaximize "A"
}
; #e:: Run("C:\Users\aless\OneDrive\Desktop\projects")
; #HotIf WinActive("Visual Studio Code")
; :o:cl::console.log(
; :o:c::const`s
; :o:l::let`s
; :o:d::document.
; #HotIf

; #1:: WinActivate("Left")
; #2:: WinActivate("Webtest")
; #3:: {
;     if WinActive('Photos') {
;         WinMinimize('Photos')
;     } else {
;         WinMaximize("Photos")

;     }
; }
; #4:: WinActivate("Webtest Right")
#s::
{
    WinActivate("Main ahk_exe msedge.exe")
    run ("https://www.google.com/")
}
; #space::
; {
;     WinActivate("main ahk_exe msedge.exe")
;     send "^t"
; }
last_2nd_screen := ''
+space::
{
    global
    if (last_2nd_screen == 'Left')
    {
        last_2nd_screen := 'Webtest'
        WinActivate("Webtest")
    } else {
        last_2nd_screen := 'Left'
        WinActivate("Left")
    }
}
last_3rd_screen := ''
^+space::
{
    global
    if (last_3rd_screen == 'Right')
    {
        last_3rd_screen := 'Spotify'
        WinActivate("ahk_exe Spotify.exe")
    } else {
        last_3rd_screen := 'Right'
        WinActivate("Right")
    }
}

#WheelUp:: {
    if WinActive("Main ahk_exe msedge.exe")
        send ('!{home}')
    else
        WinActivate("Main ahk_exe msedge.exe")
}

; codeId := WinGetID("ahk_exe Code.exe")
; windowId := WinGetID("main ahk_exe msedge.exe")

; #WheelDown:: {
;     global codeId
;     global windowId

;     ; WinActivate("ahk_id" codeId)

;     activeWindowId := WinGetID("A")

;     if (activeWindowId == windowId) {
;         WinActivate("ahk_id" codeId)
;     } else if (activeWindowId == codeId) {
;         WinActivate("ahk_id" windowId)
;     } else {
;         if (WinGetProcessName("A") == "ahk_exe Code.exe") {
;             codeId := activeWindowId
;             WinActivate("ahk_id" windowId)
;         } else {
;             windowId := activeWindowId
;             WinActivate("ahk_id" codeId)
;         }
;     }
; }

#d:: Run("C:\Users\aless\OneDrive\Desktop")

; NumpadSub:: run("https://epicodeschool.webex.com/meet/fs0323bit")

; NumpadClear:: run ("C:\Users\aless\OneDrive\Desktop\Coding\Python\daily-topic\__pycache__\main.cpython-311.pyc")

#z:: Send("#g")
; #g:: Send("#z")

NumpadSub:: {
    global fans_active
    if fans_active == 1 {
        fans(2)
        fans_active := 0
    }
    Else {
        fans(1)
        ; run("https://learn.epicode.com/dashboard")
        run("https://epicodeschool.webex.com/meet/fs0323bit")
        fans_active := 1
    }
    IniWrite fans_active, "settings.ini", "states", "fans_active"
}


NumpadEnd:: {
    if (WinActive("ahk-workspace")) {
        send "^s"
        sleep 50
        ; WinClose("A")
        reload
    } else {
        run("C:\Users\aless\Desktop\projects\personal\ahk\ahk-workspace.code-workspace")
        WinWaitActive("Visual Studio Code")
        WinMaximize("A")
    }
}

LButton::
{
    try {
        If (A_TimeSincePriorHotkey < 90)
            Return
        Click "Down"
        KeyWait "LButton"
        Click "Up"
    }
}
XButton1::
{
    If (A_TimeSincePriorHotkey < 150)
        Return
    send "{XButton1 Down}"
    KeyWait "XButton1"
    send "{XButton1 Up}"
}


NumpadPgdn:: {
    run("C:\Program Files\WindowsApps\Microsoft.Todos_2.102.62351.0_x64__8wekyb3d8bbwe\Todo.exe")
    sleep 1000
    Send "^n"
}


NumpadUp:: {
    global fans_active
    if fans_active == 1 {
        WinClose("Halo Infinite")
        send "!+{1}"
        fans(2)
        fans_active := 0
    }
    Else {
        fans(1)
        send "!+{2}"
        run(multiPath)
        fans_active := 1
    }
}

; Citra() {
;     send "{enter}"
;     sleep long_interval
;     send "!{tab}"
;     sleep default_interval
;     send "#+{left}"
;     sleep default_interval
;     send "{f11}"
; }


; NumpadEnter::
; {
;     VPN()
;     sleep medium_interval
;     Fans(3, 3)
;     sleep medium_interval
;     run soloPath
;     ; sleep semilong_interval
;     ; citra()
;     return

; }


; NumpadAdd:: {
;     run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Sound Blaster Command.lnk"
;     WinWaitActive "Sound Blaster Command"
;     sleep 50
;     WinActivate "Sound Blaster Command"
;     MouseClick "Left", 449, 820
;     sleep 50
;     WinClose "Sound Blaster Command"
; }

; NumpadEnter:: run("sndvol")


; Numpadins:: SoundSetVolume(10)

; NumpadDown:: run(halo_mode)

Pause:: DllCall("PowrProf\SetSuspendState", "Int", 0, "Int", 0, "Int", 0)


^XButton1:: send "{enter}"

+XButton2:: Send "{Media_Next}"

+MButton:: Send "{Volume_Mute}"

+XButton1:: Send "{Media_Play_Pause}"

; ^+Space:: WinSetAlwaysOnTop -1, "A"


WheelDown::
{
    MouseGetPos , &ypos, &WinUMID
    if ypos
        send "{WheelDown}"
    else
        WinMinimize(WinUMID)
}

; * HOTIF

#Hotif !GetKeyState("ScrollLock", "T") and !GetKeyState("CapsLock", "T")

Volume_Up::
+WheelUp::
{
    volume := SoundGetVolume()
    send "{Volume_Up}"
    SoundSetVolume(volume + 1)
}

Volume_Down::
+WheelDown::
{
    volume := SoundGetVolume()
    send "{Volume_Down}"
    SoundSetVolume(volume - 1)
}

^Wheeldown::
{
    MouseGetPos , , &WinUMID
    WinMinimize(WinUMID)
}

^WheelUp::
{
    MouseGetPos , , &WinUMID
    WinMaximize(WinUMID)
}

#HotIf WinActive("ahk_exe msedge.exe")

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
    ; sleep 10
    A_Clipboard := search
    ClipWait
    send "^t"
    ; sleep 10
    send "bing"
    ; sleep 10
    send "{tab}"
    ; sleep 10
    send "^v"
    ; sleep 10
    send "{enter}"
}

; ^s:: send "^d"

#HotIf WinActive("ahk_exe Kindle.exe")
^c:: {
    Send "^c"
    sleep 1
    sourceString := "Matthes, Eric. Python Crash Course, 3rd Edition: A Hands-On, Project-Based Introduction to Programming"
    sourcePos := InStr(A_Clipboard, sourceString) - 5
    A_Clipboard := SubStr(A_Clipboard, 1, sourcePos)
}

#hotif WinActive("ahk_exe msedge.exe")
~!WheelUp:: Send "{WheelUp 4}"
~!WheelDown:: send "{WheelDown 4}"

#HotIf WinActive("To Do")
~enter:: WinClose

#HotIf MouseIsOver("ahk_class Shell_TrayWnd")

XButton2:: Send "{Media_Next}"

MButton:: Send "{Volume_Mute}"

XButton1:: Send "{Media_Play_Pause}"

WheelUp::
{
    volume := SoundGetVolume()
    Send "{Volume_Up}"
    SoundSetVolume volume + 1
}

WheelDown::
{
    volume := SoundGetVolume()
    Send "{Volume_Down}"
    SoundSetVolume volume - 1
}

MouseIsOver(WinTitle) {
    MouseGetPos , , &Win
    return WinExist(WinTitle . " ahk_id " . Win)
}