ChromeExe := "ahk_exe chrome.exe"

#HotIf WinActive(ChromeExe)

^d::
{
    ; A_Clipboard := ''
    send '^c'
    sleep 100
    ; ClipWait
    ; if (WinActive(ChromeExe)) {
    ;     search := "define " . A_Clipboard
    ; } else {
    ;     word := InputBox("Enter the word to define", "Dictionary").value
    ;     search := "define " . word
    ; }
    search := "define " . A_Clipboard
    Run("https://www.bing.com/")
    sleep 700
    send search
    send "{enter}"
}

^s:: {
    send("^d")
}