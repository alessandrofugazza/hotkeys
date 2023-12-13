#Requires AutoHotkey v2.0

#Include "functions.ahk"

; CoordMode "Mouse", "Screen"
A_MenuMaskKey := "vkE8"

; active_vpn := IniRead("settings.ini", "states", "active_vpn")
fans_active := IniRead("settings.ini", "states", "fans_active")

default_interval := 50
medium_interval := 250
semilong_interval := 1000
long_interval := 4000
superlong_interval := 7000

siv := ".\SIV_task_shortcut.lnk"
; proton := "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Proton\Proton VPN.lnk"
multi_path := "C:\XboxGames\Halo Infinite\Content\HaloInfinite.exe"

numpadleft:: runProgram("C:\Users\aless\AppData\Local\GitHubDesktop\GitHubDesktop.exe", "GitHub Desktop")
#s:: openGoogle()

+XButton1:: Send "{Media_Play_Pause}"

NumpadIns:: {
    global fans_active
    if fans_active == 1 {
        fans(2)
        fans_active := 0
    }
    Else {
        fans(3)
        fans_active := 1
    }
    IniWrite fans_active, "settings.ini", "states", "fans_active"
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

#d:: Run("C:\Users\aless\Desktop")

; NumpadSub:: run("https://epicodeschool.webex.com/meet/fs0323bit")

; NumpadClear:: run ("C:\Users\aless\OneDrive\Desktop\Coding\Python\daily-topic\__pycache__\main.cpython-311.pyc")

#z:: Send("#g")
; #g:: Send("#z")

NumpadSub:: run("https://epicodeschool.webex.com/meet/fs0323bit")

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

; run("ToDo")

; NumpadRight:: {
;     sleep 1000
;     Send "^n"
; }


NumpadUp:: {
    global fans_active
    if fans_active == 1 {
        WinClose("Halo Infinite")
        send "!+{1}"
        fans_active := 0
    }
    Else {
        send "!+{2}"
        run(multi_path)
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


NumpadHome:: {
    ; run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Sound Blaster Command.lnk"
    ; WinWaitActive "Sound Blaster Command"
    ; sleep 50
    ; MouseGetPos(&savedX, &savedY)
    WinActivate "Sound Blaster Command"
    win := WinExist("A")
    ; WinGetPos(winX, winY, , , win)
    MouseClick "Left", 50, 618
    sleep 100
    WinMinimize
    ; MouseMove(savedX, savedY, 0)
    ; MouseClick("left", winX + 100, winY + 100)
    ; sleep 50
    ; WinClose "Sound Blaster Command"
}

; NumpadEnter:: run("sndvol")


; Numpadins:: SoundSetVolume(10)

; NumpadDown:: run(halo_mode)

Pause:: DllCall("PowrProf\SetSuspendState", "Int", 0, "Int", 0, "Int", 0)


^XButton1:: send "{enter}"

XButton2:: Send "{Media_Next}"
+XButton2:: Send "{Browser_Forward}"

+MButton:: Send "{Volume_Mute}"

; NumpadHome:: Send "{Media_Play_Pause}"

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

last_left_screen := ''
+space:: {
    global
    p_last_left_screen := last_left_screen
    last_left_screen := sideScreenSwitch("Left", "Webtest", p_last_left_screen)
}
last_right_screen := ''
^+space::
{
    global
    p_last_right_screen := last_right_screen
    last_right_screen := sideScreenSwitch("Right", "ahk_exe Spotify.exe", p_last_right_screen)
}

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
!WheelUp:: {
    loop 4 {
        Send "{WheelUp}"
    }
}
!WheelDown:: {
    loop 4 {
        Send "{WheelDown}"
    }
}

; #HotIf WinActive("To Do")
; ~enter:: WinClose

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