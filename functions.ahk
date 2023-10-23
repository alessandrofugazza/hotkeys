; VPN(needed := 0) {
;     global active_vpn
;     if (needed != active_vpn) {
;         run proton
;         sleep long_interval
;         if WinActive("ahk_exe ProtonVPN.exe") {
;             click 168, 177
;             active_vpn := needed
;             sleep semilong_interval
;             WinClose("ahk_exe ProtonVPN.exe")
;         } else
;             msgbox("Error.")
;     }
; }

fans(sivDown, sivUp?) {
    Run siv
    WinWait("ahk_exe ThermalConsole.exe")
    WinActivate()
    if WinActive() {
        click 962, 548
        sleep semilong_interval
        send "{tab 3}"
        sleep medium_interval
        send "{space}"
        sleep medium_interval
        send "{tab 4}"
        sleep medium_interval
        send "{space}"
        sleep medium_interval
        send "{tab 3}"
        sleep medium_interval
        send "{down " sivDown "}"
        sleep medium_interval
        if IsSet(sivUp) {
            send "{up " sivUp "}"
            sleep medium_interval
        }
        send "{tab 3}"
        sleep medium_interval
        send "{space}"
        sleep default_interval
        winclose "ahk_exe ThermalConsole.exe"
    }
    else
        msgbox("Error.")
}

runProgram(path, win_name) {
    Run(path)
    WinWait win_name
    WinMaximize "A"
}

openGoogle() {
    WinActivate("Main ahk_exe msedge.exe")
    run ("https://www.google.com/")
}

sideScreenSwitch(win1, win2, last_win) {
    if (last_win == win1) {
        last_win := win2
        WinActivate(win2)
    } else {
        last_win := win1
        WinActivate(win1)
    }
    return last_win
}