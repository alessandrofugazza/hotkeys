MouseIsOver(WinTitle) {
    MouseGetPos , , &Win
    return WinExist(WinTitle . " ahk_id " . Win)
}