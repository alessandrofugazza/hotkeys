#Include C:/Users/aless/Desktop/projects/personal/ahk/hotkeys/dependencies/ColorButton.ahk

ChromeExe := "ahk_exe chrome.exe"
AdobeExe := "ahk_exe Acrobat.exe"
KindleExe := "ahk_exe Kindle.exe"
FirefoxExe := "ahk_exe firefox.exe"

MaxHours := 4

LastKindleBook := ""


^!a::
{

    WinActivate("ahk_exe AutoHotkey64_UIA.exe")
    UpdateButtonColors()  ; Update button colors when any button is clicked
}

KindlePixelSearchColorsMap := Map()
; KindleImageSearchPathsMap := Map()

KindlePixelSearchColorsMap["CompTIA"] := "B12C1B"
KindlePixelSearchColorsMap["HOML"] := "EBA02D"
KindlePixelSearchColorsMap["LRP"] := "102B39"
; KindlePixelSearchColorsMap["Robotics Engineering"] := "6C7886"
KindlePixelSearchColorsMap["Patente"] := "114A9B"
KindlePixelSearchColorsMap["Python"] := "FAE57A"
KindlePixelSearchColorsMap["React"] := "EBCA70"
KindlePixelSearchColorsMap["Manners"] := "DB3D60"
; KindleImageSearchPathsMap["CompTIA"] := A_ScriptDir "\imagesearch\lrp.png"
; KindleImageSearchPathsMap["HOML"] := A_ScriptDir "\imagesearch\homl.png"
; KindleImageSearchPathsMap["LRP"] := A_ScriptDir "\imagesearch\lrp.png"
; KindleImageSearchPathsMap["Robotics Engineering"] := A_ScriptDir "\imagesearch\modern-robotics.png"
; KindleImageSearchPathsMap["Patente"] := A_ScriptDir "\imagesearch\patente.png"
; KindleImageSearchPathsMap["Python"] := A_ScriptDir "\imagesearch\pcc.png"
; KindleImageSearchPathsMap["React"] := A_ScriptDir "\imagesearch\react.png"


StudyWindowsMap := Map()


; IMPROVE really bad

; HOLD

; StudyWindowsMap["ROS"] := [ChromeExe, "ROS"]
; StudyWindowsMap["English"] := [ChromeExe, "English"]
; StudyWindowsMap["Robotics Engineering Book"] := [KindleExe, KindlePixelSearchColorsMap["Robotics Engineering"]]
; StudyWindowsMap["CoppeliaSim"] := [ChromeExe, "CoppeliaSim"]
; StudyWindowsMap["HOML"] := [KindleExe, KindlePixelSearchColorsMap["HOML"]]
; StudyWindowsMap["Anaconda"] := [ChromeExe, "Anaconda"]
; StudyWindowsMap["Adobe"] := [ChromeExe, "Adobe"]
; StudyWindowsMap["Canva"] := [ChromeExe, "Canva"]
; StudyWindowsMap["Jupyter"] := [ChromeExe, "Jupyter"]
; StudyWindowsMap["Gamma"] := [ChromeExe, "Gamma"]
; StudyWindowsMap["RoboSIM"] := [AdobeExe, "lb-rc-c5e-roboSIM_en.pdf "]
; StudyWindowsMap["e.DO"] := [AdobeExe, "E.DO Service Manual.pdf "]
; StudyWindowsMap["RoboShop Manual"] := [AdobeExe, "lb-rc-c5e-roboshop_it.pdf "]

; WEBDEV

; StudyWindowsMap["Chrome DevTools"] := [ChromeExe, "Chrome DevTools"]
; StudyWindowsMap["pgAdmin"] := [ChromeExe, "pgAdmin"]
; StudyWindowsMap["Spring Boot"] := [ChromeExe, "Spring Boot"]
; StudyWindowsMap["React"] := [KindleExe, KindlePixelSearchColorsMap["React"]]

; CODING

; StudyWindowsMap["GitHub Copilot"] := [ChromeExe, "GitHub Copilot"]
; StudyWindowsMap["Markdown"] := [ChromeExe, "Markdown"]
; StudyWindowsMap["VS Code"] := [ChromeExe, "VS Code"]
; StudyWindowsMap["AHK"] := [ChromeExe, "AHK"]
; StudyWindowsMap["IntelliJ"] := [ChromeExe, "IntelliJ"]

;PC Software

; StudyWindowsMap["Tweak III"] := [ChromeExe, "Tweak III"]
; StudyWindowsMap["cFos"] := [ChromeExe, "cFos"]

; ELECTRONICS

; StudyWindowsMap["Raspberry Pi"] := [ChromeExe, "Raspberry Pi"]


StudyWindowsMap["iOS Development"] := [ChromeExe, "iOS Development"]
StudyWindowsMap["CompTIA"] := [KindleExe, KindlePixelSearchColorsMap["CompTIA"]]
StudyWindowsMap["LRP"] := [KindleExe, KindlePixelSearchColorsMap["LRP"]]
; StudyWindowsMap["CompTIA"] := [ChromeExe, "CompTIA"]
StudyWindowsMap["RoboDK"] := [ChromeExe, "RoboDK"]
StudyWindowsMap["Robotics"] := [ChromeExe, "Robotics"]
; StudyWindowsMap["SOLIDWORKS"] := [FirefoxExe, ""]
StudyWindowsMap["SOLIDWORKS"] := [ChromeExe, "SOLIDWORKS"]
; StudyWindowsMap["Barman"] := [ChromeExe, "Barman"]
StudyWindowsMap["Flipper"] := [ChromeExe, "Flipper Zero"]
; StudyWindowsMap["HOML"] := [ChromeExe, "HOML"]
; StudyWindowsMap["LRP"] := [ChromeExe, "LRP"]
; StudyWindowsMap["Python WebAcademy"] := [ChromeExe, "IFTS Python"]
; StudyWindowsMap["Python"] := [KindleExe, KindlePixelSearchColorsMap["Python"]]
; StudyWindowsMap["PCC"] := [ChromeExe, "PCC"]
; StudyWindowsMap["Data Science"] := [ChromeExe, "Data Science"]
StudyWindowsMap["Character.AI"] := [ChromeExe, "Character.AI"]
StudyWindowsMap["Python"] := [ChromeExe, "Python"]
; StudyWindowsMap["Machine Learning"] := [ChromeExe, "Machine Learning"]
StudyWindowsMap["Shortcuts"] := [ChromeExe, "Shortcuts"]
StudyWindowsMap["Practical"] := [ChromeExe, "Practical"]
; StudyWindowsMap["COMAU"] := [AdobeExe, "Programmatore_di_sistemi_robotizzati_4.0-Presentazione.pdf "]
; StudyWindowsMap["COMAU"] := [ChromeExe, "COMAU"]
StudyWindowsMap["TP Manuals"] := [AdobeExe, "COMAU_c5e-uso-tp5_it_manual (1)[1].pdf "]
; StudyWindowsMap["PDL2"] := [ChromeExe, "PDL2"]
StudyWindowsMap["WebAcademy"] := [ChromeExe, "WebAcademy"]
StudyWindowsMap["Guitar"] := [ChromeExe, "Guitar"]
StudyWindowsMap["Blender"] := [ChromeExe, "Blender"]
; StudyWindowsMap["PLC"] := [ChromeExe, "PLC"]
StudyWindowsMap["Electronics"] := [ChromeExe, "Electronics"]
StudyWindowsMap["Web Development"] := [ChromeExe, "Web Development"]
StudyWindowsMap["PC Software"] := [ChromeExe, "Tweak III"]
StudyWindowsMap["CT"] := [ChromeExe, "CT"]
StudyWindowsMap["JavaScript"] := [ChromeExe, "JavaScript"]
StudyWindowsMap["WordPress Plugins"] := [ChromeExe, "WordPress Plugins"]
StudyWindowsMap["PHP"] := [ChromeExe, "PHP"]
StudyWindowsMap["Tkinter"] := [ChromeExe, "Tkinter"]
StudyWindowsMap["Tutor"] := [ChromeExe, "Tutor"]
StudyWindowsMap["Soft Skills"] := [ChromeExe, "Soft Skills"]

; StudyWindowsMap["Barman"] := [AdobeExe, "Guida-su-Lavoro-Carriera-Formazione-del-Barman.pdf "]
; StudyWindowsMap["SH125"] := [AdobeExe, "sh125.pdf "]
; StudyWindowsMap["Cybersecurity"] := [AdobeExe, "ROB2_Cybersecurity.pdf "]
; StudyWindowsMap["Raspberry Pi"] := [AdobeExe, "BeginnersGuide-5thEd-Eng_v4.pdf "]
StudyWindowsMap["ELEGOO"] := [AdobeExe, "NEPTUNE 4 MAX User Manual（Multilingual）-V1.8.pdf "]
StudyWindowsMap["3D Printing"] := [ChromeExe, "3D Printing"]

StudyWindowsMap["Patente"] := [KindleExe, KindlePixelSearchColorsMap["Patente"]]
; StudyWindowsMap["Manners"] := [KindleExe, KindlePixelSearchColorsMap["Manners"]]

StudyWindowsMap["MOS"] := ["ahk_exe GMetrix SMSe.exe", ""]
StudyWindowsMap["Adobe"] := ["ahk_exe Photoshop.exe", ""]

StudyWindowsMap["Automotive"] := ["", ""]

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
MyGui.SetFont("s10 w500")  ; Set font size to 10 and weight to 700 (bold)

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

ButtonTimersFile := A_ScriptDir "\data\button-timers-data.txt"

; Load ButtonTimers data from file
LoadButtonTimersData()


for StudySubjectName in SortedStudyWindowsMapKeys {
    colIndex := (A_Index - 1) // ButtonsPerColumn
    rowIndex := Mod((A_Index - 1), ButtonsPerColumn)
    xPos := PaddingLeft + HorizontalSpacing + colIndex * (ButtonWidth + HorizontalSpacing)
    yPos := PaddingTop + rowIndex * (buttonHeight + VerticalSpacing)  ; Apply vertical spacing

    NewButton := MyGui.Add("Button", "x" xPos " y" yPos " w" ButtonWidth " h" buttonHeight, StudySubjectName)
    NewButton.SetColor("00FF00")  ; Initial color green
    NewButton.OnEvent("Click", OnButtonClick.Bind(StudyWindowsMap[StudySubjectName][1], StudyWindowsMap[StudySubjectName][2], StudySubjectName))
    ButtonTimers[StudySubjectName] := NewButton
    if !ButtonClickTimes.Has(StudySubjectName) {
        ButtonClickTimes[StudySubjectName] := A_TickCount
    }
    UpdateButtonFontColor(NewButton, "00FF00")  ; Set initial font color
    UpdateButtonColors()
}

ResetButton := MyGui.Add("Button", "x" PaddingLeft " y" (PaddingTop + ButtonsPerColumn * (buttonHeight + VerticalSpacing)) " w" ButtonWidth " h" buttonHeight, "Reset Timers")
ResetButton.OnEvent("Click", ResetButtonTimers)

OnButtonClick(app, name, StudySubjectName, *) {
    ; MyGui.Submit()
    ; isChecked := MyGui["MyCheckbox"].Value
    ; MsgBox(isChecked ? "Feature Enabled" : "Feature Disabled")

    ButtonClickTimes[StudySubjectName] := A_TickCount  ; Reset the click time for the button
    SaveButtonTimersData()  ; Save ButtonTimers data after each click

    if (app = KindleExe) {
        global LastKindleBook
        WinActivate("Alessandro's Kindle for PC")
        ; sleep 1000
        SlowWarning := false
        if (name != LastKindleBook) {

            Send "^!l"
            sleep 400
SlowWaringLabel:
            foundX := 0
            foundY := 0

            ; if ImageSearch(&foundX, &foundY, 0, 0, A_ScreenWidth, A_ScreenHeight, name)
            if PixelSearch(&foundX, &foundY, 0, 0, A_ScreenWidth, A_ScreenHeight, "0x" name)
            {
                MouseMove foundX, foundY
                ; MouseMove foundX + 70, foundY
                Click 2
            }
            else
            {
                if SlowWarning {
                    MsgBox "Image not found on the screen."
                    return
                } else {
                    SlowWarning := true
                    sleep 100
                    goto SlowWaringLabel
                }
            }
            LastKindleBook := name
        }
    } else if (app = ChromeExe || app = AdobeExe || app = "ahk_exe GMetrix SMSe.exe" || app = "ahk_exe Photoshop.exe" || app = FirefoxExe) { ; fix this shit
        WinActivate(name " " app)
    } else {
        MsgBox "Physical"
    }

    UpdateButtonColors()
}


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
            UpdateButtonFontColor(Button, "FF0000")
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
            UpdateButtonFontColor(Button, color)
        }
    }
}

; Function to update button font color based on background color
UpdateButtonFontColor(Button, bgColor) {
    ; Convert hex color to RGB
    red := "0x" SubStr(bgColor, 1, 2)
    green := "0x" SubStr(bgColor, 3, 2)
    blue := "0x" SubStr(bgColor, 5, 2)

    ; Calculate brightness (perceived luminance)
    brightness := (0.299 * red + 0.587 * green + 0.114 * blue)

    ; Set font color to white if background is dark, otherwise set to black
    if (brightness < 128) {
        Button.SetFont("cFFFFFF")  ; White
    } else {
        Button.SetFont("c000000")  ; Black
    }
}

; Save ButtonTimers data to file
SaveButtonTimersData() {
    global ButtonClickTimes, ButtonTimersFile
    FileDelete(ButtonTimersFile)  ; Delete the file if it exists
    for StudySubjectName, ClickTime in ButtonClickTimes {
        FileAppend(StudySubjectName "=" ClickTime "`n", ButtonTimersFile)
    }
}

; Load ButtonTimers data from file
LoadButtonTimersData() {
    global ButtonClickTimes, ButtonTimersFile
    if FileExist(ButtonTimersFile) {
        if FileExist(ButtonTimersFile) {
            fileContent := FileRead(ButtonTimersFile)
            for line in StrSplit(fileContent, "`n") {
                lineArray := StrSplit(line, "=")
                if (lineArray.Length = 2) {
                    ButtonClickTimes[lineArray[1]] := lineArray[2]
                }
            }
        }
    }
}

ResetButtonTimers(*) {
    global ButtonClickTimes, ButtonTimersFile
    for StudySubjectName in ButtonClickTimes {
        ButtonClickTimes[StudySubjectName] := -999999999999
    }
    SaveButtonTimersData()
    UpdateButtonColors()
}

MyGui.Show()