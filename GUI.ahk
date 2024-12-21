ChromeExe := "ahk_exe chrome.exe"


StudyWindowsMap := Map()

StudyWindowsMap["CompTIA"] := [ChromeExe, "CompTIA"]
StudyWindowsMap["Chrome DevTools"] := [ChromeExe, "Chrome DevTools"]
StudyWindowsMap["GitHub Copilot"] := [ChromeExe, "GitHub Copilot"]
StudyWindowsMap["AHK"] := [ChromeExe, "AHK"]
StudyWindowsMap["IFTS"] := [ChromeExe, "IFTS"]


; Tabs := [
;     "CompTIA",
;     "Chrome DevTools",
;     "GitHub Copilot",
;     "AHK",
;     "IFTS",
;     "ROS",
;     "RoboDK",
;     "English",
;     "Modern Robotics",
;     "CoppeliaSim",
;     "SOLIDWORKS",
;     "CB125R",
;     "Barman",
;     "cFos",
;     "Tweak III",
;     "IntelliJ",
;     "pgAdmin",
;     "Spring",
;     "Flipper Zero",
;     "",

; ]

MyGui := Gui()

; checkbox := MyGui.Add("Checkbox", "vMyCheckbox", "Enable Feature")

button := MyGui.Add("Button", "Default", StudyWindowsMap["CompTIA"][2])
button.OnEvent("Click", OnButtonClick.Bind(StudyWindowsMap["CompTIA"][1], StudyWindowsMap["CompTIA"][2]))

OnButtonClick(app, name, *) {
    ; MyGui.Submit()
    ; isChecked := MyGui["MyCheckbox"].Value
    ; MsgBox(isChecked ? "Feature Enabled" : "Feature Disabled")
    WinActivate(name " " app)
}

MyGui.Show()