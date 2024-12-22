ChromeExe := "ahk_exe chrome.exe"
AdobeExe := "ahk_exe Acrobat.exe"
KindleExe := "ahk_exe Kindle.exe"


KindleImageSearchPathsMap := Map()

KindleImageSearchPathsMap["CompTIA"] := A_ScriptDir "\imagesearch\lrp.png"
KindleImageSearchPathsMap["HOML"] := A_ScriptDir "\imagesearch\homl.png"
KindleImageSearchPathsMap["LRP"] := A_ScriptDir "\imagesearch\lrp.png"
KindleImageSearchPathsMap["Robotics Engineering"] := A_ScriptDir "\imagesearch\modern-robotics.png"
KindleImageSearchPathsMap["Patente"] := A_ScriptDir "\imagesearch\patente.png"
KindleImageSearchPathsMap["Python"] := A_ScriptDir "\imagesearch\pcc.png"
KindleImageSearchPathsMap["React"] := A_ScriptDir "\imagesearch\react.png"


StudyWindowsMap := Map()


; IMPROVE really bad

StudyWindowsMap["CompTIA"] := [KindleExe, KindleImageSearchPathsMap["CompTIA"]]
; StudyWindowsMap["CompTIA"] := [ChromeExe, "CompTIA"]
StudyWindowsMap["Chrome DevTools"] := [ChromeExe, "Chrome DevTools"]
StudyWindowsMap["GitHub Copilot"] := [ChromeExe, "GitHub Copilot"]
StudyWindowsMap["AHK"] := [ChromeExe, "AHK"]
StudyWindowsMap["ROS"] := [ChromeExe, "ROS"]
StudyWindowsMap["RoboDK"] := [ChromeExe, "RoboDK"]
StudyWindowsMap["English"] := [ChromeExe, "English"]
StudyWindowsMap["Coursera Robotics Engineering"] := [ChromeExe, "Robotics Engineering"]
StudyWindowsMap["Robotics Engineering Book"] := [KindleExe, KindleImageSearchPathsMap["Robotics Engineering"]]
StudyWindowsMap["CoppeliaSim"] := [ChromeExe, "CoppeliaSim"]
StudyWindowsMap["SOLIDWORKS"] := [ChromeExe, "SOLIDWORKS"]
StudyWindowsMap["Barman"] := [ChromeExe, "Barman"]
StudyWindowsMap["cFos"] := [ChromeExe, "cFos"]
StudyWindowsMap["Tweak III"] := [ChromeExe, "Tweak III"]
StudyWindowsMap["IntelliJ"] := [ChromeExe, "IntelliJ"]
StudyWindowsMap["pgAdmin"] := [ChromeExe, "pgAdmin"]
StudyWindowsMap["Spring"] := [ChromeExe, "Spring"]
StudyWindowsMap["Flipper Zero"] := [ChromeExe, "Flipper Zero"]
StudyWindowsMap["VS Code"] := [ChromeExe, "VS Code"]
StudyWindowsMap["HOML"] := [KindleExe, KindleImageSearchPathsMap["HOML"]]
; StudyWindowsMap["HOML"] := [ChromeExe, "HOML"]
StudyWindowsMap["LRP"] := [KindleExe, KindleImageSearchPathsMap["LRP"]]
; StudyWindowsMap["LRP"] := [ChromeExe, "LRP"]
StudyWindowsMap["Anaconda"] := [ChromeExe, "Anaconda"]
StudyWindowsMap["Raspberry Pi"] := [ChromeExe, "Raspberry Pi"]
StudyWindowsMap["Python"] := [KindleExe, KindleImageSearchPathsMap["Python"]]
; StudyWindowsMap["PCC"] := [ChromeExe, "PCC"]
StudyWindowsMap["Adobe"] := [ChromeExe, "Adobe"]
StudyWindowsMap["Data Science"] := [ChromeExe, "Data Science"]
StudyWindowsMap["Character.AI"] := [ChromeExe, "Character.AI"]
StudyWindowsMap["ML Algorithms"] := [ChromeExe, "ML Algorithms"]
StudyWindowsMap["Canva"] := [ChromeExe, "Canva"]
StudyWindowsMap["Jupyter"] := [ChromeExe, "Jupyter"]

StudyWindowsMap["Barman"] := [AdobeExe, "Guida-su-Lavoro-Carriera-Formazione-del-Barman.pdf "]
StudyWindowsMap["e.DO"] := [AdobeExe, "E.DO Service Manual.pdf "]
StudyWindowsMap["SH125"] := [AdobeExe, "sh125.pdf "]
StudyWindowsMap["IFTS Del Vecchio"] := [AdobeExe, "AMMI_ConsapevolezzaDigitale_Shared "]

StudyWindowsMap["Patente"] := [KindleExe, KindleImageSearchPathsMap["Patente"]]
StudyWindowsMap["React"] := [KindleExe, KindleImageSearchPathsMap["React"]]


StudyWindowsMapKeys := []

for key in StudyWindowsMap
    StudyWindowsMapKeys.Push(key)

; Convert the array to a newline-separated string
stringToSort := ""
for each, item in StudyWindowsMapKeys
    stringToSort .= item "`n"

; Remove the trailing newline character
stringToSort := RTrim(stringToSort, "`n")

; Sort the string in ascending alphabetical order
sortedString := Sort(stringToSort)

; Split the sorted string back into an array
SortedStudyWindowsMapKeys := StrSplit(sortedString, "`n")

MyGui := Gui()

; checkbox := MyGui.Add("Checkbox", "vMyCheckbox", "Enable Feature")

; button := MyGui.Add("Button", "Default", StudyWindowsMap["CompTIA"][2])
; button.OnEvent("Click", OnButtonClick.Bind(StudyWindowsMap["CompTIA"][1], StudyWindowsMap["CompTIA"][2]))

ButtonWidth := 120
buttonHeight := 30
PaddingTop := 7
PaddingLeft := 2

HorizontalSpacing := 7

ButtonsPerColumn := 10

for StudySubjectName in SortedStudyWindowsMapKeys {
    colIndex := (A_Index - 1) // ButtonsPerColumn
    rowIndex := Mod((A_Index - 1), ButtonsPerColumn)
    xPos := PaddingLeft + HorizontalSpacing + colIndex * (ButtonWidth + HorizontalSpacing)
    yPos := PaddingTop + rowIndex * (buttonHeight)
    ; yPos := rowIndex * (buttonHeight + verticalSpacing)

    button := MyGui.Add("Button", "x" xPos " y" ypos " w" ButtonWidth, StudySubjectName)
    button.OnEvent("Click", OnButtonClick.Bind(StudyWindowsMap[StudySubjectName][1], StudyWindowsMap[StudySubjectName][2]))
}

OnButtonClick(app, name, *) {
    ; MyGui.Submit()
    ; isChecked := MyGui["MyCheckbox"].Value
    ; MsgBox(isChecked ? "Feature Enabled" : "Feature Disabled")

    if (app = KindleExe) {
        WinActivate("Alessandro's Kindle for PC")
        ; sleep 1000
        Send "^!l"
        sleep 500
        foundX := 0
        foundY := 0
        if ImageSearch(&foundX, &foundY, 0, 0, A_ScreenWidth, A_ScreenHeight, name)
        {
            MouseMove foundX + 70, foundY
            Click 2
        }
        else
        {
            MsgBox "Image not found on the screen."
        }
    } else {
        WinActivate(name " " app)

    }
}

MyGui.Show()