#Include C:/Users/aless/Desktop/projects/personal/ahk/hotkeys/dependencies/ColorButton.ahk

ChromeExe := "ahk_exe chrome.exe"
AdobeExe := "ahk_exe Acrobat.exe"
KindleExe := "ahk_exe Kindle.exe"
FirefoxExe := "ahk_exe firefox.exe"

MaxHours := 4

LastKindleBook := ""

SetTitleMatchMode(3)

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
; StudyWindowsMap["Gamma"] := [ChromeExe, "Gamma"]
; StudyWindowsMap["RoboSIM"] := [AdobeExe, "lb-rc-c5e-roboSIM_en.pdf "]
; StudyWindowsMap["e.DO"] := [AdobeExe, "E.DO Service Manual.pdf "]
; StudyWindowsMap["RoboShop Manual"] := [AdobeExe, "lb-rc-c5e-roboshop_it.pdf "]

; WEBDEV

; StudyWindowsMap["Codecademy"] := [ChromeExe, "Codecademy", 1]

; CODING


;PC Software


; ELECTRONICS


; StudyWindowsMap["CompTIA"] := [KindleExe, KindlePixelSearchColorsMap["CompTIA"], 1]
; StudyWindowsMap["CompTIA"] := [ChromeExe, "CompTIA"]
; StudyWindowsMap["SOLIDWORKS"] := [FirefoxExe, ""]
; StudyWindowsMap["Barman"] := [ChromeExe, "Barman"]
; StudyWindowsMap["HOML"] := [ChromeExe, "HOML"]
; StudyWindowsMap["LRP"] := [ChromeExe, "LRP"]
; StudyWindowsMap["Python WebAcademy"] := [ChromeExe, "IFTS Python"]
; StudyWindowsMap["Python"] := [KindleExe, KindlePixelSearchColorsMap["Python"]]
; StudyWindowsMap["PCC"] := [ChromeExe, "PCC"]
; StudyWindowsMap["Data Science"] := [ChromeExe, "Data Science"]
; StudyWindowsMap["Machine Learning"] := [ChromeExe, "Machine Learning"]
; StudyWindowsMap["COMAU"] := [AdobeExe, "Programmatore_di_sistemi_robotizzati_4.0-Presentazione.pdf "]
; StudyWindowsMap["COMAU"] := [ChromeExe, "COMAU"]
; StudyWindowsMap["PDL2"] := [ChromeExe, "PDL2"]
; StudyWindowsMap["PLC"] := [ChromeExe, "PLC"]


; StudyWindowsMap["Barman"] := [AdobeExe, "Guida-su-Lavoro-Carriera-Formazione-del-Barman.pdf "]
; StudyWindowsMap["SH125"] := [AdobeExe, "sh125.pdf "]
; StudyWindowsMap["Cybersecurity"] := [AdobeExe, "ROB2_Cybersecurity.pdf "]
; StudyWindowsMap["Raspberry Pi"] := [AdobeExe, "BeginnersGuide-5thEd-Eng_v4.pdf "]

; StudyWindowsMap["Manners"] := [KindleExe, KindlePixelSearchColorsMap["Manners"]]

; StudyWindowsMap["MOS"] := ["ahk_exe GMetrix SMSe.exe", "", 1]

; StudyWindowsMap["Work"] := ["", "", 1]

P1Windows := []
P2Windows := []
P3Windows := []
P4Windows := []

ImportStudyWindowsMapFromCSV() {
    global StudyWindowsMap
    csvFile := A_ScriptDir "\data\StudyWindowsMap.csv"

    if FileExist(csvFile) {
        fileContent := FileRead(csvFile)
        for line in StrSplit(fileContent, "`n") {
            lineArray := StrSplit(line, ",")
            ; MsgBox lineArray[6]
            ; MsgBox lineArray.Length

            FormattedLineArray4 := Integer(lineArray[4])  ; Remove last character from the last string
            FormattedLineArray5 := Integer(lineArray[5])  ; Remove last character from the last string
            ; if (A_Index < StrSplit(fileContent, "`n").Length) {
            ;     PreFormat6 := SubStr(lineArray[6], 1, -1)
            ; } else {
            ;     PreFormat6 := lineArray[6]
            ; }
            PreFormat6 := lineArray[6]
            FormattedLineArray6 := Integer(PreFormat6)  ; Remove last character from the last string
            ; MsgBox Type(PreFormat6)
            ; MsgBox Type(FormattedLineArray6)
            StudyWindowsMap[lineArray[1]] := [lineArray[2], lineArray[3], FormattedLineArray4, FormattedLineArray5, FormattedLineArray6]
            ; testnum := Integer(FormattedLineArray6)
            ; MsgBox Type(FormattedLineArray6)
            ; MsgBox Type(testnum)
            ; MsgBox FormattedLineArray6
            ; MsgBox Type(Integer(lineArray[6]))
            switch FormattedLineArray4 {
                ; what in the fuck
                case 1:
                    if P1Windows.Length > 0 {
                        insertIndex := 1
                        for item in P1Windows {
                            ; MsgBox Type(StudyWindowsMap[item][5])
                            ; MsgBox Type(lineArray[6])
                            if StudyWindowsMap[item][5] > FormattedLineArray6 {
                                P1Windows.InsertAt(insertIndex, lineArray[1])
                                break
                            }
                            insertIndex++
                        }
                        if insertIndex > P1Windows.Length {
                            P1Windows.Push(lineArray[1])
                        }
                    } else {
                        P1Windows.Push(lineArray[1])
                    }
                case 2:
                    if P2Windows.Length > 0 {
                        insertIndex := 1
                        for item in P2Windows {
                            ; MsgBox Type(StudyWindowsMap[item][5])
                            ; MsgBox Type(lineArray[6])
                            if StudyWindowsMap[item][5] > FormattedLineArray6 {
                                P2Windows.InsertAt(insertIndex, lineArray[1])
                                break
                            }
                            insertIndex++
                        }
                        if insertIndex > P2Windows.Length {
                            P2Windows.Push(lineArray[1])
                        }
                    } else {
                        P2Windows.Push(lineArray[1])
                    }
                case 3:
                    if P3Windows.Length > 0 {
                        insertIndex := 1
                        for item in P3Windows {
                            ; MsgBox Type(StudyWindowsMap[item][5])
                            ; MsgBox Type(lineArray[6])
                            if StudyWindowsMap[item][5] > FormattedLineArray6 {
                                P3Windows.InsertAt(insertIndex, lineArray[1])
                                break
                            }
                            insertIndex++
                        }
                        if insertIndex > P3Windows.Length {
                            P3Windows.Push(lineArray[1])
                        }
                    } else {
                        P3Windows.Push(lineArray[1])
                    }
                case 4:
                    if P4Windows.Length > 0 {
                        insertIndex := 1
                        for item in P4Windows {
                            ; MsgBox Type(StudyWindowsMap[item][5])
                            ; MsgBox Type(lineArray[6])
                            if StudyWindowsMap[item][5] > FormattedLineArray6 {
                                P4Windows.InsertAt(insertIndex, lineArray[1])
                                break
                            }
                            insertIndex++
                        }
                        if insertIndex > P4Windows.Length {
                            P4Windows.Push(lineArray[1])
                        }
                    } else {
                        P4Windows.Push(lineArray[1])
                    }
                default:
                    MsgBox "Invalid priority level"
            }

        }
    }
}

ImportStudyWindowsMapFromCSV()


; MsgBox "P1Windows: " P1Windows.Length
; MsgBox "P2Windows: " P2Windows.Length
; MsgBox "P3Windows: " P3Windows.Length
; MsgBox "P4Windows: " P4Windows.Length


; FinalString := ""
; for item in P1Windows {
;     FinalString .= item "`n"
; }
; MsgBox FinalString


MyGui := Gui()
MyGui.SetFont("s10 w500")  ; Set font size to 10 and weight to 700 (bold)

MyGui.BackColor := 0x1E1E1E
; checkbox := MyGui.Add("Checkbox", "vMyCheckbox", "Enable Feature")

; button := MyGui.Add("Button", "Default", StudyWindowsMap["CompTIA"][2])
; button.OnEvent("Click", OnButtonClick.Bind(StudyWindowsMap["CompTIA"][1], StudyWindowsMap["CompTIA"][2]))

StudyButtons := Map()  ; Map to store timers for each button
ButtonClickTimes := Map()  ; Map to store the last click time for each button

BUTTON_WIDTH := 140
BUTTON_HEIGHT := 50
PADDING_TOP := 7
PADDING_LEFT := 2

HORIZONTAL_SPACING := 7
VERTICAL_SPACING := 5  ; Define the vertical spacing between buttons

BUTTONS_PER_COLUMN := 10
SECTIONS_MARGIN := 30

PreviousGuiWidth := 0

CreateButtons(P1Windows)
CreateButtons(P2Windows)
CreateButtons(P3Windows)
CreateButtons(P4Windows)

CreateButtons(Map) {
    global

    for StudySubjectName in Map {
        colIndex := (A_Index - 1) // BUTTONS_PER_COLUMN
        rowIndex := Mod((A_Index - 1), BUTTONS_PER_COLUMN)
        xPos := PreviousGuiWidth + PADDING_LEFT + HORIZONTAL_SPACING + colIndex * (BUTTON_WIDTH + HORIZONTAL_SPACING)
        yPos := PADDING_TOP + rowIndex * (BUTTON_HEIGHT + VERTICAL_SPACING)  ; Apply vertical spacing

        NewButton := MyGui.Add("Button", "x" xPos " y" yPos " w" BUTTON_WIDTH " h" BUTTON_HEIGHT, StudySubjectName)
        NewButton.SetColor("5ed75e")  ; Initial color green
        NewButton.OnEvent("Click", OnButtonClick.Bind(StudySubjectName))
        StudyButtons[StudySubjectName] := NewButton
        UpdateButtonFontColor(NewButton, "00FF00")  ; Set initial font color
    }
    PreviousGuiWidth := Max(PreviousGuiWidth, xPos + BUTTON_WIDTH + PADDING_LEFT + SECTIONS_MARGIN)
}

ResetButton := MyGui.Add("Button", "x" PADDING_LEFT " y" (PADDING_TOP + BUTTONS_PER_COLUMN * (BUTTON_HEIGHT + VERTICAL_SPACING)) " w" BUTTON_WIDTH " h" BUTTON_HEIGHT, "Reset Timers")
ResetButton.OnEvent("Click", ResetButtons)

SaveButton := MyGui.Add("Button", "x" PADDING_LEFT + 100 " y" (PADDING_TOP + BUTTONS_PER_COLUMN * (BUTTON_HEIGHT + VERTICAL_SPACING)) " w" BUTTON_WIDTH " h" BUTTON_HEIGHT, "Save All")
SaveButton.OnEvent("Click", SaveAll)

OnButtonClick(StudySubjectName, *) {

    StudyWindowsMap[StudySubjectName][4] := A_TickCount

    if (StudyWindowsMap[StudySubjectName][1] = KindleExe) {
        global LastKindleBook
        WinActivate("Alessandro's Kindle for PC")
        ; sleep 1000
        SlowWarning := false
        if (StudySubjectName != LastKindleBook) {

            Send "^!l"
            sleep 400
SlowWaringLabel:
            foundX := 0
            foundY := 0

            ; if ImageSearch(&foundX, &foundY, 0, 0, A_ScreenWidth, A_ScreenHeight, name)
            if PixelSearch(&foundX, &foundY, 0, 0, A_ScreenWidth, A_ScreenHeight, "0x" StudySubjectName)
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
            LastKindleBook := StudySubjectName
        }
    } else if (StudyWindowsMap[StudySubjectName][1] = ChromeExe) {
        WinActivate(StudySubjectName)
    } else if (StudyWindowsMap[StudySubjectName][1] = AdobeExe || StudyWindowsMap[StudySubjectName][1] = "ahk_exe GMetrix SMSe.exe" || StudyWindowsMap[StudySubjectName][1] = "ahk_exe Photoshop.exe" || StudyWindowsMap[StudySubjectName][1] = FirefoxExe) { ; fix this shit
        ; WinActivate(StudySubjectName)
        ; msgbox StudyWindowsMap[StudySubjectName][1]
        WinActivate(StudyWindowsMap[StudySubjectName][1])
    } else {
        MsgBox "Physical"
    }

}


UpdateButtonColors() {
    global StudyWindowsMap
    for StudySubjectName, Info in StudyWindowsMap {
        ; BRILLIANT GOOD JOB CHATGPT GOTTA LEARN THIS
        elapsed := A_TickCount - StudyWindowsMap[StudySubjectName][4]
        maxTime := MaxHours * 60 * 60 * 1000  ; 8 hours in milliseconds
        numShades := 48
        shadeInterval := maxTime / numShades

        ; Calculate the color based on the elapsed time
        if (elapsed >= maxTime) {
            StudyButtons[StudySubjectName].SetColor("FF0000")  ; Red
            UpdateButtonFontColor(StudyButtons[StudySubjectName], "FF0000")
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
            StudyButtons[StudySubjectName].SetColor(color)
            UpdateButtonFontColor(StudyButtons[StudySubjectName], color)
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


ResetButtons(*) {

    global
    for StudySubject, Info in StudyWindowsMap {
        StudyWindowsMap[StudySubject][4] := -999999999999
    }
    UpdateButtonColors()

}

SaveAll(*) {
    ShuffleArray(arr) {
        loop arr.Length - 1 {
            RandIndex := Random(A_Index, arr.Length)
            Temp := arr[A_Index]
            arr[A_Index] := arr[RandIndex]
            arr[RandIndex] := Temp
        }
    }

    ShuffleArray(P1Windows)
    for item in P1Windows {
        StudyWindowsMap[item][5] := A_Index
    }
    ShuffleArray(P2Windows)
    for item in P2Windows {
        StudyWindowsMap[item][5] := A_Index
    }
    ShuffleArray(P3Windows)
    for item in P3Windows {
        StudyWindowsMap[item][5] := A_Index
    }
    ShuffleArray(P4Windows)
    for item in P4Windows {
        StudyWindowsMap[item][5] := A_Index
    }
    ExportStudyWindowsMapToCSV()
    Reload
}


ExportStudyWindowsMapToCSV() {
    global StudyWindowsMap
    csvFile := A_ScriptDir "\data\StudyWindowsMap.csv"
    FileDelete(csvFile)
    for key, value in StudyWindowsMap {
        csvLine := key "," value[1] "," value[2] "," value[3] "," value[4] "," value[5]
        if (A_Index < StudyWindowsMap.Count) {
            csvLine .= "`n"
        }
        FileAppend(csvLine, csvFile)
    }
}


MyGui.Show()