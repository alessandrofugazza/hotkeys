#Include C:/Users/aless/Desktop/projects/personal/ahk/hotkeys/dependencies/ColorButton.ahk

ChromeExe := "ahk_exe chrome.exe"
AdobeExe := "ahk_exe Acrobat.exe"
KindleExe := "ahk_exe Kindle.exe"
FirefoxExe := "ahk_exe firefox.exe"

MaxHours := 4

LastKindleBook := ""

P1StackFile := A_ScriptDir "\data\p1-order-data.csv"
P2StackFile := A_ScriptDir "\data\p2-order-data.csv"
P3StackFile := A_ScriptDir "\data\p3-order-data.csv"
P4StackFile := A_ScriptDir "\data\p4-order-data.csv"
P5StackFile := A_ScriptDir "\data\p5-order-data.csv"
P6StackFile := A_ScriptDir "\data\p6-order-data.csv"
P7StackFile := A_ScriptDir "\data\p7-order-data.csv"
P8StackFile := A_ScriptDir "\data\p8-order-data.csv"
P9StackFile := A_ScriptDir "\data\p9-order-data.csv"


SetTitleMatchMode(3)

P1Windows := []
P2Windows := []
P3Windows := []
P4Windows := []
P5Windows := []
P6Windows := []
P7Windows := []
P8Windows := []
P9Windows := []


P1Windows := LoadPriorityWindowsFromFile(P1StackFile, false)
P2Windows := LoadPriorityWindowsFromFile(P2StackFile, false)
P3Windows := LoadPriorityWindowsFromFile(P3StackFile, false)
P4Windows := LoadPriorityWindowsFromFile(P4StackFile, false)
P5Windows := LoadPriorityWindowsFromFile(P5StackFile, false)
P6Windows := LoadPriorityWindowsFromFile(P6StackFile, false)
P7Windows := LoadPriorityWindowsFromFile(P7StackFile, false)
P8Windows := LoadPriorityWindowsFromFile(P8StackFile, false)
P9Windows := LoadPriorityWindowsFromFile(P9StackFile, false)

^!a::
{
    global
    ExportStudyWindowsMapToCSV()
    SavePriorityWindowsToFile(P1StackFile, P1Windows)
    SavePriorityWindowsToFile(P2StackFile, P2Windows)
    SavePriorityWindowsToFile(P3StackFile, P3Windows)
    SavePriorityWindowsToFile(P4StackFile, P4Windows)
    SavePriorityWindowsToFile(P5StackFile, P5Windows)
    SavePriorityWindowsToFile(P6StackFile, P6Windows)
    SavePriorityWindowsToFile(P7StackFile, P7Windows)
    SavePriorityWindowsToFile(P8StackFile, P8Windows)
    SavePriorityWindowsToFile(P9StackFile, P9Windows)
    Reload
}
; WinActivate("ahk_exe AutoHotkey64_UIA.exe")
; UpdateButtonColors()  ; Update button colors when any button is clicked


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


ImportStudyWindowsMapFromCSV() {
    global StudyWindowsMap
    csvFile := A_ScriptDir "\data\StudyWindowsMap.csv"

    if FileExist(csvFile) {
        fileContent := FileRead(csvFile)
        for line in StrSplit(fileContent, "`n") {
            lineArray := StrSplit(line, ",")

            FormattedLineArray4 := Integer(lineArray[4])  ; Remove last character from the last string
            FormattedLineArray5 := Integer(lineArray[5])  ; Remove last character from the last string
            ; if (A_Index < StrSplit(fileContent, "`n").Length) {
            ;     PreFormat6 := SubStr(lineArray[6], 1, -1)
            ; } else {
            ;     PreFormat6 := lineArray[6]
            ; }
            ; PreFormat6 := lineArray[6]
            ; FormattedLineArray6 := Integer(PreFormat6)  ; Remove last character from the last string
            if A_Index = 1 {
                FormattedLineArray1 := lineArray[1]  ; Remove last character from the last string

            } else {
                FormattedLineArray1 := lineArray[1]
            }
            StudyWindowsMap[FormattedLineArray1] := [lineArray[2], lineArray[3], FormattedLineArray4, FormattedLineArray5]
            ; testnum := Integer(FormattedLineArray6)
        }
        f := ""
        for k, v in StudyWindowsMap {
            f .= k " " StrLen(k) " `n"
        }
    }
}

ImportStudyWindowsMapFromCSV()


; FinalString := ""
; for item in P1Windows {
;     FinalString .= item "`n"
; }


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
CreateButtons(P5Windows)
CreateButtons(P6Windows)
CreateButtons(P7Windows)
CreateButtons(P8Windows)
CreateButtons(P9Windows)

CreateButtons(Map) {
    global

    for StudySubjectName in Map {
        ; TrimmedStudySubjectName := SubStr(StudySubjectName, 1, -1)  ; Remove last character from the string
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
    f := ""
    for k, v in StudyButtons {
        f .= k " " StrLen(k) " `n"
    }
    PreviousGuiWidth := Max(PreviousGuiWidth, xPos + BUTTON_WIDTH + PADDING_LEFT + SECTIONS_MARGIN)
}

ResetButton := MyGui.Add("Button", "x" PADDING_LEFT " y" (PADDING_TOP + BUTTONS_PER_COLUMN * (BUTTON_HEIGHT + VERTICAL_SPACING)) " w" BUTTON_WIDTH " h" BUTTON_HEIGHT, "Reset Timers")
ResetButton.OnEvent("Click", ResetButtons)

SaveButton := MyGui.Add("Button", "x" PADDING_LEFT + 100 " y" (PADDING_TOP + BUTTONS_PER_COLUMN * (BUTTON_HEIGHT + VERTICAL_SPACING)) " w" BUTTON_WIDTH " h" BUTTON_HEIGHT, "Save All")
SaveButton.OnEvent("Click", SaveAll)

OnButtonClick(StudySubjectName, *) {
    Priority := StudyWindowsMap[StudySubjectName][3]
    switch Priority {
        case 1:
            for n in P1Windows {
                if StudySubjectName = n {
                    P1Windows.RemoveAt(A_Index)
                    P1Windows.Push(StudySubjectName)
                    break
                }
            }
        case 2:
            for n in P2Windows {
                if StudySubjectName = n {
                    P2Windows.RemoveAt(A_Index)
                    P2Windows.Push(StudySubjectName)
                    break
                }
            }
        case 3:
            for n in P3Windows {
                if StudySubjectName = n {
                    P3Windows.RemoveAt(A_Index)
                    P3Windows.Push(StudySubjectName)
                    break
                }
            }

        case 4:
            for n in P4Windows {
                if StudySubjectName = n {
                    P4Windows.RemoveAt(A_Index)
                    P4Windows.Push(StudySubjectName)
                    break
                }
            }
        case 5:
            for n in P5Windows {
                if StudySubjectName = n {
                    P5Windows.RemoveAt(A_Index)
                    P5Windows.Push(StudySubjectName)
                    break
                }
            }
        case 6:
            for n in P6Windows {
                if StudySubjectName = n {
                    P6Windows.RemoveAt(A_Index)
                    P6Windows.Push(StudySubjectName)
                    break
                }
            }
        case 7:
            for n in P7Windows {
                if StudySubjectName = n {
                    P7Windows.RemoveAt(A_Index)
                    P7Windows.Push(StudySubjectName)
                    break
                }
            }
        case 8:
            for n in P8Windows {
                if StudySubjectName = n {
                    P8Windows.RemoveAt(A_Index)
                    P8Windows.Push(StudySubjectName)
                    break
                }
            }
        case 9:
            for n in P9Windows {
                if StudySubjectName = n {
                    P8Windows.RemoveAt(A_Index)
                    P8Windows.Push(StudySubjectName)
                    break
                }
            }
    }


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
            if PixelSearch(&foundX, &foundY, 0, 0, A_ScreenWidth, A_ScreenHeight, "0x" StudyWindowsMap[StudySubjectName][2])
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
    } else if (StudyWindowsMap[StudySubjectName][1] = AdobeExe || StudyWindowsMap[StudySubjectName][1] = "ahk_exe GMetrix SMSe.exe" || StudyWindowsMap[StudySubjectName][1] = "ahk_exe Photoshop.exe" || StudyWindowsMap[StudySubjectName][1] = "ahk_exe DigitalEditions.exe" || StudyWindowsMap[StudySubjectName][1] = FirefoxExe) { ; fix this shit
        ; WinActivate(StudySubjectName)
        WinActivate(StudyWindowsMap[StudySubjectName][1])
    } else {
        MsgBox "Physical"
    }


}


UpdateButtonColors() {
    global StudyWindowsMap, StudyButtons

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

SavePriorityWindowsToFile(File, Stack) {
    FileDelete(File)
    for line in Stack {
        csvLine := line
        if (A_Index < Stack.Length) {
            csvLine .= "`n"
        }
        FileAppend(csvLine, File)
    }
}

LoadPriorityWindowsFromFile(File, RemoveLastChar := true) {
    PWindows := []
    if FileExist(File) {
        fileContent := FileRead(File)
        LineArr := StrSplit(fileContent, "`n")
        for line in LineArr {
            FormattedLine := line
            if RemoveLastChar && A_Index < LineArr.Length {
                if RemoveLastChar {
                    FormattedLine := SubStr(line, 1, -1)  ; Remove last character from the string
                }
            }
            PWindows.Push(FormattedLine)
        }
        f := ""
        for v in PWindows {
            f .= v " " StrLen(v) " `n"
        }
        return PWindows
    }
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
    ; for item in P1Windows {
    ;     StudyWindowsMap[item][5] := A_Index
    ; }
    ShuffleArray(P2Windows)
    ; for item in P2Windows {
    ;     StudyWindowsMap[item][5] := A_Index
    ; }
    ShuffleArray(P3Windows)
    ; for item in P3Windows {
    ;     StudyWindowsMap[item][5] := A_Index
    ; }
    ShuffleArray(P4Windows)
    ShuffleArray(P5Windows)
    ShuffleArray(P6Windows)
    ShuffleArray(P7Windows)
    ShuffleArray(P8Windows)
    ShuffleArray(P9Windows)
    ; for item in P4Windows {
    ;     StudyWindowsMap[item][5] := A_Index
    ; }
    ExportStudyWindowsMapToCSV()
    SavePriorityWindowsToFile(P1StackFile, P1Windows)
    SavePriorityWindowsToFile(P2StackFile, P2Windows)
    SavePriorityWindowsToFile(P3StackFile, P3Windows)
    SavePriorityWindowsToFile(P4StackFile, P4Windows)
    SavePriorityWindowsToFile(P5StackFile, P5Windows)
    SavePriorityWindowsToFile(P6StackFile, P6Windows)
    SavePriorityWindowsToFile(P7StackFile, P7Windows)
    SavePriorityWindowsToFile(P8StackFile, P8Windows)
    SavePriorityWindowsToFile(P9StackFile, P9Windows)
    Reload
}

; SaveTrueReloadToCsv(tf) {
;     csvFile := A_ScriptDir "\data\TrueReload.csv"
;     FileDelete(csvFile)
;     csvLine := tf
;     FileAppend(csvLine, csvFile)
; }
; LoadTrueReloadFromCsv() {
;     csvFile := A_ScriptDir "\data\TrueReload.csv"
;     FileContent := FileRead(csvFile)
;     return FileContent
; }


ExportStudyWindowsMapToCSV() {
    global StudyWindowsMap
    csvFile := A_ScriptDir "\data\StudyWindowsMap.csv"
    FileDelete(csvFile)
    for key, value in StudyWindowsMap {
        csvLine := key "," value[1] "," value[2] "," value[3] "," value[4]
        if (A_Index < StudyWindowsMap.Count) {
            csvLine .= "`n"
        }
        FileAppend(csvLine, csvFile)
    }
}


MyGui.Show()
UpdateButtonColors()