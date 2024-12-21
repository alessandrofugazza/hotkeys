IsCursorInMainMonitor() {
    MouseGetPos(&x, &y)
    return (x >= 0 && x <= 1920 && y >= 0 && y <= 1080)
}