MyGui := Gui()

; checkbox := MyGui.Add("Checkbox", "vMyCheckbox", "Enable Feature")

button := MyGui.Add("Button", "Default", "Submit")
tp := 'hi'
button.OnEvent("Click", OnButtonClick.Bind('hi'))

OnButtonClick(tpp, *) {
    ; MyGui.Submit()
    ; isChecked := MyGui["MyCheckbox"].Value
    ; MsgBox(isChecked ? "Feature Enabled" : "Feature Disabled")
    MsgBox(tpp)
}

MyGui.Show()