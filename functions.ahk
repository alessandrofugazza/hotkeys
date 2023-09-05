VPN(needed := 0) {
    global active_vpn
    if (needed != active_vpn) {
        run proton
        sleep long_interval
        if WinActive("ahk_exe ProtonVPN.exe") {
            click 168, 177
            active_vpn := needed
            sleep semilong_interval
            WinClose("ahk_exe ProtonVPN.exe")
        } else
            msgbox("Error.")
    }
}

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