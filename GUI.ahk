ChromeExe := "ahk_exe chrome.exe"


StudyWindowsMap := Map()


; IMPROVE really bad

StudyWindowsMap["CompTIA"] := [ChromeExe, "CompTIA"]
StudyWindowsMap["Chrome DevTools"] := [ChromeExe, "Chrome DevTools"]
StudyWindowsMap["GitHub Copilot"] := [ChromeExe, "GitHub Copilot"]
StudyWindowsMap["AHK"] := [ChromeExe, "AHK"]
StudyWindowsMap["IFTS"] := [ChromeExe, "IFTS"]
StudyWindowsMap["ROS"] := [ChromeExe, "ROS"]
StudyWindowsMap["RoboDK"] := [ChromeExe, "RoboDK"]
StudyWindowsMap["English"] := [ChromeExe, "English"]
StudyWindowsMap["Modern Robotics"] := [ChromeExe, "Modern Robotics"]
StudyWindowsMap["CoppeliaSim"] := [ChromeExe, "CoppeliaSim"]
StudyWindowsMap["SOLIDWORKS"] := [ChromeExe, "SOLIDWORKS"]
StudyWindowsMap["CB125R"] := [ChromeExe, "CB125R"]
StudyWindowsMap["Barman"] := [ChromeExe, "Barman"]
StudyWindowsMap["cFos"] := [ChromeExe, "cFos"]
StudyWindowsMap["Tweak III"] := [ChromeExe, "Tweak III"]
StudyWindowsMap["IntelliJ"] := [ChromeExe, "IntelliJ"]
StudyWindowsMap["pgAdmin"] := [ChromeExe, "pgAdmin"]
StudyWindowsMap["Spring"] := [ChromeExe, "Spring"]
StudyWindowsMap["Flipper Zero"] := [ChromeExe, "Flipper Zero"]
StudyWindowsMap["VS Code"] := [ChromeExe, "VS Code"]
StudyWindowsMap["HOML"] := [ChromeExe, "HOML"]
StudyWindowsMap["LRP"] := [ChromeExe, "LRP"]
StudyWindowsMap["Anaconda"] := [ChromeExe, "Anaconda"]
StudyWindowsMap["Raspberry Pi"] := [ChromeExe, "Raspberry Pi"]
StudyWindowsMap["PCC"] := [ChromeExe, "PCC"]
StudyWindowsMap["Robotics"] := [ChromeExe, "Robotics"]
StudyWindowsMap["Adobe"] := [ChromeExe, "Adobe"]
StudyWindowsMap["Data Science"] := [ChromeExe, "Data Science"]
StudyWindowsMap["Character.AI"] := [ChromeExe, "Character.AI"]
StudyWindowsMap["ML Algorithms"] := [ChromeExe, "ML Algorithms"]
StudyWindowsMap["Canva"] := [ChromeExe, "Canva"]


MyGui := Gui()

; checkbox := MyGui.Add("Checkbox", "vMyCheckbox", "Enable Feature")

button := MyGui.Add("Button", "Default", StudyWindowsMap["CompTIA"][2])
button.OnEvent("Click", OnButtonClick.Bind(StudyWindowsMap["CompTIA"][1], StudyWindowsMap["CompTIA"][2]))

for key, value in StudyWindowsMap {
    button := MyGui.Add("Button", "Default", value[2])
    button.OnEvent("Click", OnButtonClick.Bind(value[1], value[2]))
}

OnButtonClick(app, name, *) {
    ; MyGui.Submit()
    ; isChecked := MyGui["MyCheckbox"].Value
    ; MsgBox(isChecked ? "Feature Enabled" : "Feature Disabled")
    WinActivate(name " " app)
}

MyGui.Show()