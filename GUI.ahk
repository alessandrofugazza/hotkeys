#Include C:/Users/aless/Desktop/projects/personal/ahk/hotkeys/dependencies/ColorButton.ahk

ChromeExe := "ahk_exe chrome.exe"
AdobeExe := "ahk_exe Acrobat.exe"
KindleExe := "ahk_exe Kindle.exe"

^!a::
{

    WinActivate("ahk_exe AutoHotkey64_UIA.exe")
    UpdateButtonColors()  ; Update button colors when any button is clicked
}

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
StudyWindowsMap["COU Robotics Engineering"] := [ChromeExe, "Robotics Engineering"]
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
StudyWindowsMap["Shortcuts"] := [ChromeExe, "Shortcuts"]
; StudyWindowsMap["COMAU"] := [AdobeExe, "Programmatore_di_sistemi_robotizzati_4.0-Presentazione.pdf "]
StudyWindowsMap["COMAU"] := [ChromeExe, "COMAU"]
StudyWindowsMap["Markdown"] := [ChromeExe, "Markdown"]

StudyWindowsMap["Barman"] := [AdobeExe, "Guida-su-Lavoro-Carriera-Formazione-del-Barman.pdf "]
StudyWindowsMap["e.DO"] := [AdobeExe, "E.DO Service Manual.pdf "]
StudyWindowsMap["SH125"] := [AdobeExe, "sh125.pdf "]
StudyWindowsMap["IFTS Del Vecchio"] := [AdobeExe, "AMMI_ConsapevolezzaDigitale_Shared "]
StudyWindowsMap["RoboShop Manual"] := [AdobeExe, "lb-rc-c5e-roboshop_it.pdf "]
StudyWindowsMap["Raspberry Pi"] := [AdobeExe, "BeginnersGuide-5thEd-Eng_v4.pdf "]

StudyWindowsMap["Patente"] := [KindleExe, KindleImageSearchPathsMap["Patente"]]
StudyWindowsMap["React"] := [KindleExe, KindleImageSearchPathsMap["React"]]

StudyWindowsMap["MOS"] := ["ahk_exe GMetrix SMSe.exe", ""]

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
MyGui.SetFont("s10 w500")

MyGui.BackColor := 0x1E1E1E
; checkbox := MyGui.Add("Checkbox", "vMyCheckbox", "Enable Feature")

; button := MyGui.Add("Button", "Default", StudyWindowsMap["CompTIA"][2])
; button.OnEvent("Click", OnButtonClick.Bind(StudyWindowsMap["CompTIA"][1], StudyWindowsMap["CompTIA"][2]))

ButtonTimers := Map()  ; Map to store timers for each button
ButtonClickTimes := Map()  ; Map to store the last click time for each button

ButtonWidth := 140
buttonHeight := 50
PaddingTop := 7
PaddingLeft := 2

HorizontalSpacing := 7
VerticalSpacing := 5  ; Define the vertical spacing between buttons

ButtonsPerColumn := 10

for StudySubjectName in SortedStudyWindowsMapKeys {
    colIndex := (A_Index - 1) // ButtonsPerColumn
    rowIndex := Mod((A_Index - 1), ButtonsPerColumn)
    xPos := PaddingLeft + HorizontalSpacing + colIndex * (ButtonWidth + HorizontalSpacing)
    yPos := PaddingTop + rowIndex * (buttonHeight + VerticalSpacing)  ; Apply vertical spacing

    NewButton := MyGui.Add("Button", "x" xPos " y" yPos " w" ButtonWidth " h" buttonHeight, StudySubjectName)
    NewButton.SetColor("00FF00")  ; Initial color green
    NewButton.OnEvent("Click", OnButtonClick.Bind(StudyWindowsMap[StudySubjectName][1], StudyWindowsMap[StudySubjectName][2], StudySubjectName))
    ButtonTimers[StudySubjectName] := NewButton
    ButtonClickTimes[StudySubjectName] := A_TickCount
}

OnButtonClick(app, name, StudySubjectName, *) {
    ; MyGui.Submit()
    ; isChecked := MyGui["MyCheckbox"].Value
    ; MsgBox(isChecked ? "Feature Enabled" : "Feature Disabled")

    ButtonClickTimes[StudySubjectName] := A_TickCount  ; Reset the click time for the button

    if (app = KindleExe) {
        WinActivate("Alessandro's Kindle for PC")
        ; sleep 1000
        Send "^!l"
        sleep 1000
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

MaxHours := 2

UpdateButtonColors() {
    global ButtonTimers, ButtonClickTimes
    for StudySubjectName, Button in ButtonTimers {
        ; BRILLIANT GOOD JOB CHATGPT GOTTA LEARN THIS
        elapsed := A_TickCount - ButtonClickTimes[StudySubjectName]
        maxTime := MaxHours * 60 * 60 * 1000  ; 8 hours in milliseconds
        numShades := 48
        shadeInterval := maxTime / numShades

        ; Calculate the color based on the elapsed time
        if (elapsed >= maxTime) {
            Button.SetColor("FF0000")  ; Red
        } else {
            shadeIndex := Floor(elapsed / shadeInterval)
            ; Calculate the color gradient from green to yellow to red
            if (shadeIndex < numShades / 2) {
                ; Green to yellow
                greenValue := 255
                redValue := Floor(255 * (shadeIndex / (numShades / 2)))
                color := Format("{:02X}{:02X}00", redValue, greenValue)
            } else {
                ; Yellow to red
                redValue := 255
                greenValue := Floor(255 * ((numShades - shadeIndex) / (numShades / 2)))
                color := Format("{:02X}{:02X}00", redValue, greenValue)
            }
            Button.SetColor(color)
        }
    }
}

MyGui.Show()