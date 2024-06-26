DllCall("Winmm\timeBeginPeriod", "UInt", 1)
#NoEnv
#NoTrayIcon
#Persistent
#MaxHotkeysPerInterval 99000000
#MaxThreadsPerHotkey, 2
#HotkeyInterval -1
#KeyHistory 0
#SingleInstance Force
#InstallKeybdHook
#InstallMouseHook
#UseHook On
#ErrorStdOut
SetWorkingDir %A_ScriptDir%
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
DetectHiddenWindows, On
OnExit, Exit

/* this is hwid auth lol
Try
{
    ClipSaved := ClipboardAll
    Clipboard := ""
    RunWait, %comspec% /c wmic cpu get ProcessorId | clip,, Hide
    auth := clipboard
    RunWait, %comspec% /c wmic path win32_videocontroller get PNPDeviceID | clip,, Hide
    auth .= clipboard
    RunWait, %comspec% /c wmic diskdrive get serialnumber | clip,, Hide
    auth .= clipboard
    HWID := RegExReplace(auth, "(ProcessorId|PNPDeviceID|SerialNumber|`r`n|`r|`n| )", "")
    text := "" . HWID
    Clipboard := ClipSaved
    hexResult := ""
    Loop, Parse, text
    {
        char := Asc(A_LoopField)
        hexResult .= Format("{:02X}", char)
    }
    USERHWID := hexResult
    hwidData := URLDownloadToVar("https://pastebin.com/raw/cjk0Hkhc")
    hwidArray := []
    Loop, Parse, hwidData, `n, `r
    {
        hwidArray.Push(Trim(A_LoopField))
    }
    HWIDFound := false
    Loop, % hwidArray.Length()
    {
        if (hwidArray[A_Index] = USERHWID) {
            HWIDFound := true
            break
        }
    }
    If (!HWIDFound)
    {
        ExitApp
    }
    hwidArray :=[]
}
catch
{
    Msgbox,, Error, Please check your internet connection.
    ExitApp
}
*/

Menu, Tray, Icon, imageres.dll, 12
Menu, Addons, Add, Modifications, ModificationsMenu
Menu, MenuBar, Add, Addons, :Addons
Menu, Version, Add, Version, VersionMenu
Menu, MenuBar, Add, About, :Version
    ; MainGui
    Gui, 1:Menu, MenuBar
    Gui 1:-MinimizeBox -MaximizeBox -SysMenu
    Gui, 1:Margin, 0, 0
    Gui, 1:Color, White
    Gui, 1:Font, s48, Segoe UI
    Gui 1:Add, Text, x210 y-10 w239 h90 +0x200 , HPlayer
    Gui, 1:Font, s10, Segoe UI
    Gui 1:Add, GroupBox, x216 y131 w199 h93, Window Only
    Gui 1:Add, GroupBox, x424 y131 w199 h149, Toggle Key
    Gui 1:Add, Edit, vWindowName x232 y187 w168 h21 +Center +Disabled, Minecraft
    Gui 1:Add, Dropdownlist, vToggleKey x440 y211 w168 h150 +Center, LButton|RButton|MButton|XButton1|XButton2||CapsLock|Space|Tab|Enter|Escape|Backspace|ScrollLock|Delete|Insert|Home|End|PgUp|PgDn|Up|Down|Left|Right|Numpad0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|NumpadDot|NumLock|NumpadDiv|NumpadMult|NumpadAdd|NumpadSub|NumpadEnter|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|LWin|RWin|Control|Alt|Shift|LControl|RControl|LShift|RShift|LAlt|RAlt|Q|W|E|R|T|Y|U|I|O|P|A|S|D|F|G|H|J|K|L|Z|X|C|V|B|N|M|None
    Gui 1:Add, Text, x440 y179 w71 h24 +0x200 , Key Name
    Gui 1:Add, CheckBox, vForceToggle x440 y155 w156 h23 +Checked, Force Toggle
    Gui 1:Add, CheckBox, vWindowOnly gWindowOnly x232 y155 w85 h23, Enable
    Gui 1:Add, GroupBox, x8 y131 w199 h149, Hide/Exit Key
    Gui 1:Add, Text, x24 y152 w71 h24 +0x200 , Hide/Show
    Gui 1:Add, Dropdownlist, vHideKey x24 y176 w168 h150 +Center, LButton|RButton|MButton|XButton1|XButton2|CapsLock|Space|Tab|Enter|Escape|Backspace|ScrollLock|Delete|Insert||Home|End|PgUp|PgDn|Up|Down|Left|Right|Numpad0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|NumpadDot|NumLock|NumpadDiv|NumpadMult|NumpadAdd|NumpadSub|NumpadEnter|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|LWin|RWin|Control|Alt|Shift|LControl|RControl|LShift|RShift|LAlt|RAlt|Q|W|E|R|T|Y|U|I|O|P|A|S|D|F|G|H|J|K|L|Z|X|C|V|B|N|M|None
    Gui 1:Add, Text, x24 y216 w71 h24 +0x200 , Exit
    Gui 1:Add, Dropdownlist, vExitKey x24 y240 w168 h150 +Center, LButton|RButton|MButton|XButton1|XButton2|CapsLock|Space|Tab|Enter|Escape|Backspace|ScrollLock|Delete|Insert|Home||End|PgUp|PgDn|Up|Down|Left|Right|Numpad0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|NumpadDot|NumLock|NumpadDiv|NumpadMult|NumpadAdd|NumpadSub|NumpadEnter|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|LWin|RWin|Control|Alt|Shift|LControl|RControl|LShift|RShift|LAlt|RAlt|Q|W|E|R|T|Y|U|I|O|P|A|S|D|F|G|H|J|K|L|Z|X|C|V|B|N|M|None
    Gui 1:Add, Button, gUpload x24 y88 w168 h23, Upload
    Gui 1:Add, Button, gSaveConfig x232 y88 w168 h23, Save Config
    Gui 1:Add, Button, gLoadConfig x440 y88 w168 h23, Load Config
    Gui 1:Add, Text, vParsedClicks x8 y0 w140 h23 +0x200, Clicks: Waiting...
    Gui 1:Add, Text, vAverageCPS x8 y21 w140 h17 +0x200, Average CPS: Waiting...
    Gui 1:Add, Button, vInitialize gInitialize x216 y232 w201 h46, Initialize
    Gui 1:Add, Button, gExit x7 y288 w617 h26, Close
    Gui 1:Add, StatusBar,, Last Updated 11/09/2023
    Gui 1:Show, w632 h341, HPlayer
    global GuiVisible := true
    global Error := 0
    global Warned := 0
    global Updated := False
    ; SecondGui
    Gui, 2:Margin, 0, 0
    Gui, 2:Color, White
    Gui 2:-MinimizeBox -MaximizeBox -SysMenu
    Gui 2:Add, Button, gModificationsMenu x8 y264 w572 h27, Close
    Gui 2:Add, GroupBox, x8 y0 w284 h158, Scaler
    Gui 2:Add, GroupBox, x296 y0 w284 h158, Filter
    Gui 2:Add, GroupBox, x8 y160 w284 h97, Modifiers
    Gui 2:Add, GroupBox, x296 y160 w284 h97, Misc
    Gui 2:Add, CheckBox, vMultiplierEnable gScaler x24 y24 w53 h23, Enable
    Gui 2:Add, Edit, vMultiplier hWndhEdtValue5 x24 y56 w53 h21 +Number +Center +Disabled, 100
    SendMessage 0x1501, 1, "100",, ahk_id %hEdtValue5%
    Gui 2:Add, Text, x80 y56 w16 h23 +0x200 , `%
    Gui 2:Add, CheckBox, vMultiplierEnableRandomized gScalerRand x24 y88 w120 h23 +Disabled, Randomize
    Gui 2:Add, Text, x24 y120 w46 h23 +0x200 , Between
    Gui 2:Add, Edit, vMultiplierR1 hWndhEdtValue6 x72 y120 w53 h21 +Number +Center +Disabled, 75
    SendMessage 0x1501, 1, "75",, ahk_id %hEdtValue6%
    Gui 2:Add, Text, x128 y120 w25 h23 +0x200 , and
    Gui 2:Add, Edit, vMultiplierR2 hWndhEdtValue7 x152 y120 w53 h21 +Number +Center +Disabled, 125
    SendMessage 0x1501, 1, "125",, ahk_id %hEdtValue7%
    Gui 2:Add, Text, x208 y120 w16 h23 +0x200 , `%
    Gui 2:Add, CheckBox, vLDEnable gLowestDelayCheck x312 y24 w100 h23, Lowest Delay
    Gui 2:Add, Edit, vLowestDelay hWndhEdtValue8 x312 y56 w53 h21 +Number +Center +Disabled, 30
    SendMessage 0x1501, 1, "20",, ahk_id %hEdtValue8%
    Gui 2:Add, CheckBox, vHDEnable gHighestDelayCheck x312 y88 w100 h23, Highest Delay
    Gui 2:Add, Edit, vHighestDelay hWndhEdtValue9 x312 y120 w53 h21 +Number +Center +Disabled, 200
    SendMessage 0x1501, 1, "100",, ahk_id %hEdtValue9%
    Gui 2:Add, CheckBox, vIgnoreClicks x420 y70 w120 h23 +Disabled +Checked, Ignore click
    Gui 2:Add, Text, x368 y56 w16 h23 +0x200  , ms
    Gui 2:Add, Text, x368 y120 w16 h23 +0x200  , ms
    Gui 2:Add, CheckBox, vRMBLock x24 y184 w120 h23, RMB Lock
    Gui 2:Add, CheckBox, vShiftLock x24 y216 w120 h23, Shift Lock
    Gui 2:Add, CheckBox, vRandomizedStartPoint x312 y184 w135 h23 +Checked, Randomized Start Point
    Gui 2:Show, w587 h298, Modifications
    Gui, 2:Hide
    global SecondGuiVisible := false
    ; Third Gui
    Gui, 3:Margin, 0, 0
    Gui, 3:Color, White
    Gui 3:-MinimizeBox -MaximizeBox -SysMenu
    Gui 3:Font, s48, Segoe UI
    Gui 3:Add, Text, x0 y-40 w361 h196 +0x200 +Center, 1.0.2_B5.1
    Gui 3:Font
    Gui 3:Font, s16, Segoe UI
    Gui 3:Add, Text, cGreen vUpdate x15 y96 w336 h33 +Center +0x200,
    Gui 3:Font
    Gui 3:Add, Button, vUpdateButton gUpdater x12 y130 w336 h26, Update
    Gui 3:Add, Button, vCheckUpdateButton gCheck x12 y130 w336 h26, Check for updates
    Gui 3:Add, Button, gVersionMenu x12 y160 w336 h26, Close
    Gui 3:Show, w361 h196, Version
    Gui, 3:Hide
	GuiControl, 3:Hide, UpdateButton
    global ThirdGuiVisible := false
GuiControlGet, isCheckedWO,, WindowOnly
GuiControlGet, isCheckedSC,, MultiplierEnable
GuiControlGet, isCheckedSCR,, MultiplierEnableRandomized
Gui, 1:Submit, nohide
Gui, 2:Submit, nohide
return
CloseGUIs:
	Gui, 1:Cancel
	Gui, 2:Cancel
	Gui, 3:Cancel
	ExitApp
return
Initialize:
Error := 0
Warned := 0
If (Beenused)
{
    Hotkey, *~%ToggleKey%, Off
    Hotkey, *~%ExitKey%, Off
    Hotkey, *~%HideKey%, Off
}
Gui, 1:Submit, nohide
Gui, 2:Submit, nohide
If (Multiplier < 10)
{
    Multiplier := 10
    GuiControl, 2:, Multiplier, 10
    Warned := 1
}
If (Multiplier > 1000)
{
    Multiplier := 1000
    GuiControl, 2:, Multiplier, 1000
    Warned := 1
}
If (MultiplierR1 < 10)
{
    MultiplierR1 := 10
    GuiControl, 2:, MultiplierR1, 10
    Warned := 1
}
If (MultiplierR1 > 1000)
{
    MultiplierR1 := 990
    MultiplierR2 := 1000
    GuiControl, 2:, MultiplierR1, 990
    GuiControl, 2:, MultiplierR2, 1000
    Warned := 1
}
If (MultiplierR2 < 10)
{
    MultiplierR1 := 10
    MultiplierR2 := 20
    GuiControl, 2:, MultiplierR1, 10
    GuiControl, 2:, MultiplierR2, 20
    Warned := 1
}
If (MultiplierR2 > 1000)
{
    MultiplierR2 := 1000
    GuiControl, 2:, MultiplierR2, 1000
    Warned := 1
}
If (MultiplierR1 < 10 and MultiplierR2 < 10)
{
    MultiplierR1 := 10
    MultiplierR2 := 20
    GuiControl, 2:, MultiplierR1, 10
    GuiControl, 2:, MultiplierR2, 20
    Warned := 1
}
If (MultiplierR1 > 1000 and MultiplierR2 > 1000)
{
    MultiplierR1 := 990
    MultiplierR2 := 1000
    GuiControl, 2:, MultiplierR1, 990
    GuiControl, 2:, MultiplierR2, 1000
    Warned := 1
}
If (MultiplierR1 >= MultiplierR2)
{
    Delay := MultiplierR1 + 10
    MultiplierR2 := Delay
    GuiControl, 2:, MultiplierR2, %Delay%
    Warned := 1
}
If (HDEnable) && (LowestDelay >= HighestDelay)
{
    Delay := LowestDelay + 10
    HighestDelay := Delay
    GuiControl, 2:, HighestDelay, %Delay%
    Warned := 1
}
if (!clickFile)
{
    clickFile := A_ScriptDir . "\clicks.txt"
}
if !FileExist(clickFile)
{
    MsgBox,, Error, Clicks not found.
    Return
}
global Value := Multiplier
FileRead, clicks, %clickFile%
down_delays := []
up_delays := []
counter := 1
Loop, Parse, clicks, `n, `r
{
    sleep_value := A_LoopField
    if (sleep_value <> ""  && !RegExMatch(sleep_value, "[^\d.]"))
    {
        if (Mod(counter, 2) = 1)
        {
            If (!IgnoreClicks)
            {
                If (LDEnable)
                {
                    If (sleep_value < LowestDelay)
                    {
                        sum := LowestDelay - sleep_value
                        sleep_value += sum
                    }
                }
                If (HDEnable)
                {
                    If (sleep_value > HighestDelay)
                    {
                        sum := sleep_value - HighestDelay
                        sleep_value -= sum
                    }
                }
            }
            If (IgnoreClicks && (LDEnable or HDEnable))
            {
                saved_value := sleep_value
            } else {
                down_delays.Push(sleep_value)
            }
        }
        else
        {
            If (!IgnoreClicks)
            {
                If (LDEnable)
                {
                    If (sleep_value < LowestDelay)
                    {
                        sum := LowestDelay - sleep_value
                        sleep_value += sum
                    }
                }
                If (HDEnable)
                {
                    If (sleep_value > HighestDelay)
                    {
                        sum := sleep_value - HighestDelay
                        sleep_value -= sum
                    }
                }
            }
            If (IgnoreClicks && (LDEnable or HDEnable))
            {
                If (LDEnable && !HDEnable)
                {
                    If ((saved_value + sleep_value) > LowestDelay)
                    {
                        down_delays.Push(saved_value)
                        up_delays.Push(sleep_value)
                    }
                }
                If (HDEnable && !LDEnable)
                {
                    If ((saved_value + sleep_value) < HighestDelay)
                    {
                        down_delays.Push(saved_value)
                        up_delays.Push(sleep_value)
                    }
                }
                If (LDEnable && HDEnable)
                {
                    If ((saved_value + sleep_value) > LowestDelay and ((saved_value + sleep_value) < HighestDelay))
                    {
                        down_delays.Push(saved_value)
                        up_delays.Push(sleep_value)
                    }
                }
            } else {
                up_delays.Push(sleep_value)
            }
        }
        counter++
    }
}
ParsedClicks := down_delays.Length()
if (ParsedClicks = 0) {
    MsgBox,, Error, Please record some clicks before proceeding.
    return
}
If (down_delays.Length() > up_delays.Length())
{
    MsgBox,, Error, Please make sure the clicks are properly recorded
    return
}
GuiControl, 1:Text, ParsedClicks, Clicks: %ParsedClicks%
totalDownDelay := 0
totalReleaseDelay := 0
totalClicks := down_delays.Length() + up_delays.Length()
Loop, % totalClicks
{
    totalDownDelay += down_delays[A_Index]
    totalReleaseDelay += up_delays[A_Index]
}
averageDownDelay := (totalDownDelay) / totalClicks
averageReleaseDelay := (totalReleaseDelay) / totalClicks
divide := averageDownDelay + averageReleaseDelay
cps := 500 / divide
If (MultiplierEnable)
{
    cpsmodified := (500 / divide) / (Value / 100)
    formattedCPS := Format("{:.4f}", cpsmodified)
    GuiControl, 1:Text, AverageCPS, Average CPS: %formattedCPS%
    If (MultiplierEnableRandomized)
    {
        abc := (MultiplierR1 + MultiplierR2) / 2
        cpsmodifiedrand := (500 / divide) / (abc / 100)
        formattedCPS := Format("{:.4f}", cpsmodifiedrand)
        GuiControl, 1:Text, AverageCPS, Average CPS: %formattedCPS%
    }
} else {
    formattedCPS := Format("{:.4f}", cps)
    GuiControl, 1:Text, AverageCPS, Average CPS: %formattedCPS%
}
global runtime := true
GuiControlGet, isCheckedFT,, ForceToggle
GuiControlGet, isCheckedRMBLock,, RMBLock
GuiControlGet, isCheckedShiftLock,, ShiftLock
try {
	Hotkey, *~%ToggleKey%, Button
	Hotkey, *~%ExitKey%, ExitButton
	Hotkey, *~%HideKey%, HideButton
    Hotkey, *~%ToggleKey%, On
    Hotkey, *~%ExitKey%, On
    Hotkey, *~%HideKey%, On
    Beenused := 1
}
catch {
}
If (Warned)
{
    MsgBox,, Attention, Some functions may not work as expected since certain values are out of acceptable boundaries.
}
If (Error = 0 and Warned = 0)
{
    MsgBox,, Success, Initialized
}
Gui, 1:Submit, nohide
Gui, 2:Submit, nohide
Return
SaveConfig:
try {
    initialDir := "C:\Your\Default\hplayer.ini"
    FileSelectFile, saveFile, S17, %initialDir%, Save as,Save as .ini file, INI Files (*.ini)
    If (FileExist(saveFile))
    {
        FileDelete, %saveFile%
    }
    FileAppend, [Settings]`n, %saveFile%
    If (!clickFile)
    {
        clickFile := A_ScriptDir . "\clicks.txt"
    }
    FileAppend, ClickLocation=%clickFile%`n, %saveFile%
    FileAppend, EnableWindowOnly=%WindowOnly%`n, %saveFile%
	FileAppend, SetWindowName=%WindowName%`n, %saveFile%
    FileAppend, [Additional]`n, %saveFile%
	FileAppend, EnableMultiplier=%MultiplierEnable%`n, %saveFile%
    FileAppend, Multiplier0=%Multiplier%`n, %saveFile%
	FileAppend, EnableMultiplierRandomized=%MultiplierEnableRandomized%`n, %saveFile%
    FileAppend, Multiplier1=%MultiplierR1%`n, %saveFile%
    FileAppend, Multiplier2=%MultiplierR2%`n, %saveFile%
    FileAppend, EnableLowestDelay=%LDEnable%`n, %saveFile%
    FileAppend, LowestDelayValue=%LowestDelay%`n, %saveFile%
    FileAppend, EnableHighestDelay=%HDEnable%`n, %saveFile%
    FileAppend, HighestDelayValue=%HighestDelay%`n, %saveFile%
    FileAppend, AllowIgnoreClick=%IgnoreClicks%`n, %saveFile%
    FileAppend, EnableRMBLock=%RMBLock%`n, %saveFile%
    FileAppend, EnableShiftLock=%ShiftLock%`n, %saveFile%
    FileAppend, EnableRandomizedStartPoint=%RandomizedStartPoint%`n, %saveFile%
	FileAppend, [Hotkeys]`n, %saveFile%
	FileAppend, ToggleKeyValue=%ToggleKey%`n, %saveFile%
	FileAppend, HideKeyValue=%HideKey%`n, %saveFile%
	FileAppend, ExitKeyValue=%ExitKey%`n, %saveFile%
    MsgBox,, Success, Configuration saved successfully.
    saveFile :=
}
catch {
    MsgBox,, Error, Error while saving config.
}
return
LoadConfig:
try {
    initialDir := "C:\Your\Default\hplayer.ini"
    FileSelectFile, configFile, %initialDir%, hplayer.ini, Select a .ini file, INI Files (*.ini)
    if (FileExist(configFile)) {
        IniRead, ClickLocation, %configFile%, Settings, ClickLocation
        IniRead, EnableWindowOnly, %configFile%, Settings, EnableWindowOnly
        IniRead, SetWindowName, %configFile%, Settings, SetWindowName
        IniRead, EnableMultiplier, %configFile%, Additional, EnableMultiplier
        IniRead, Multiplier0, %configFile%, Additional, Multiplier0
        IniRead, EnableMultiplierRandomized, %configFile%, Additional, EnableMultiplierRandomized
        IniRead, Multiplier1, %configFile%, Additional, Multiplier1
        IniRead, Multiplier2, %configFile%, Additional, Multiplier2
        IniRead, EnableLowestDelay, %configFile%, Additional, EnableLowestDelay
        IniRead, LowestDelayValue, %configFile%, Additional, LowestDelayValue
        IniRead, EnableHighestDelay, %configFile%, Additional, EnableHighestDelay
        IniRead, HighestDelayValue, %configFile%, Additional, HighestDelayValue
        IniRead, AllowIgnoreClick, %configFile%, Additional, AllowIgnoreClick
        IniRead, EnableRMBLock, %configFile%, Additional, EnableRMBLock
        IniRead, EnableShiftLock, %configFile%, Additional, EnableShiftLock
        IniRead, EnableRandomizedStartPoint, %configFile%, Additional, EnableRandomizedStartPoint
        IniRead, ToggleKeyValue, %configFile%, Hotkeys, ToggleKeyValue
        IniRead, HideKeyValue, %configFile%, Hotkeys, HideKeyValue
        IniRead, ExitKeyValue, %configFile%, Hotkeys, ExitKeyValue

        clickFile := ClickLocation
        GuiControl, 1:, WindowOnly, %EnableWindowOnly%
        GuiControl, 1:, WindowName, %SetWindowName%
        GuiControl, 2:, MultiplierEnable, %EnableMultiplier%
        GuiControl, 2:, Multiplier, %Multiplier0%
        GuiControl, 2:, MultiplierEnableRandomized, %EnableMultiplierRandomized%
        GuiControl, 2:, MultiplierR1, %Multiplier1%
        GuiControl, 2:, MultiplierR2, %Multiplier2%
        GuiControl, 2:, LDEnable, %EnableLowestDelay%
        GuiControl, 2:, LowestDelay, %LowestDelayValue%
        GuiControl, 2:, HDEnable, %EnableHighestDelay%
        GuiControl, 2:, HighestDelay, %HighestDelayValue%
        GuiControl, 2:, IgnoreClicks, %AllowIgnoreClick%
        GuiControl, 2:, RMBLock, %EnableRMBLock%
        GuiControl, 2:, ShiftLock, %EnableShiftLock%
        GuiControl, 2:, RandomizedStartPoint, %EnableRandomizedStartPoint%
        GuiControl, 1:Choose, ToggleKey, %ToggleKeyValue%
		GuiControl, 1:Choose, HideKey, %HideKeyValue%
		GuiControl, 1:Choose, ExitKey, %ExitKeyValue%

        GuiControlGet, isCheckedWO,, WindowOnly
        if (isCheckedWO)
        {
            GuiControl, 1:Enable, WindowName
        } else {
            GuiControl, 1:Disable, WindowName
        }
        if (EnableLowestDelay)
        {
            GuiControl, 2:Enable, LowestDelay
        } else {
            GuiControl, 2:Disable, LowestDelay
        }
        if (EnableHighestDelay)
        {
            GuiControl, 2:Enable, HighestDelay
        } else {
            GuiControl, 2:Disable, HighestDelay
        }
        if (EnableLowestDelay or EnableHighestDelay)
        {
            GuiControl, 2:Enable, IgnoreClicks
        } else {
            GuiControl, 2:Disable, IgnoreClicks
        }
        if (EnableMultiplier) {
            GuiControl, 2:Enable, Multiplier
            GuiControl, 2:Enable, MultiplierEnableRandomized
            if (EnableMultiplierRandomized) {
                GuiControl, 2:, Multiplier, 100
                GuiControl, 2:Enable, MultiplierEnableRandomized
                GuiControl, 2:Enable, MultiplierR1
                GuiControl, 2:Enable, MultiplierR2
                GuiControl, 2:Disable, Multiplier
            } else {
                GuiControl, 2:Disable, MultiplierR1
                GuiControl, 2:Disable, MultiplierR2
            }
        } else {
            GuiControl, 2:Disable, Multiplier
            GuiControl, 2:Disable, MultiplierR1
            GuiControl, 2:Disable, MultiplierR2
            GuiControl, 2:, Multiplier, 100
            GuiControl, 2:, MultiplierR1, 75
            GuiControl, 2:, MultiplierR2, 125
        }
        MsgBox,, Success, Config loaded successfully.
        configFile :=
    } else {
        MsgBox,, Error, Error while loading config.
    }
}
catch {
    MsgBox,, Error, Error while loading config.
}
return
ExitButton:
ExitApp
return
WindowOnly:
	GuiControlGet, isCheckedWO,, WindowOnly
    if (isCheckedWO)
	{
		GuiControl, 1:Enable, WindowName
	} else {
		GuiControl, 1:Disable, WindowName
    }
return
Scaler:
	GuiControlGet, isCheckedSC,, MultiplierEnable
    if (isCheckedSC)
	{
		GuiControl, 2:Enable, Multiplier
        GuiControl, 2:Enable, MultiplierEnableRandomized
	} else {
		GuiControl, 2:Disable, Multiplier
        GuiControl, 2:, Multiplier, 100
        GuiControl, 2:Disable, MultiplierEnableRandomized
        GuiControl, 2:, MultiplierEnableRandomized, 0
        GuiControl, 2:Disable, MultiplierR1
        GuiControl, 2:, MultiplierR1, 75
        GuiControl, 2:Disable, MultiplierR2
        GuiControl, 2:, MultiplierR2, 125
    }
return
ScalerRand:
	GuiControlGet, isCheckedSCR,, MultiplierEnableRandomized
    if (isCheckedSCR)
	{
		GuiControl, 2:Disable, Multiplier
        GuiControl, 2:, Multiplier, 100
        GuiControl, 2:Enable, MultiplierR1
        GuiControl, 2:Enable, MultiplierR2
	} else {
		GuiControl, 2:Enable, Multiplier
        GuiControl, 2:, Multiplier, 100
        GuiControl, 2:Disable, MultiplierR1
        GuiControl, 2:, MultiplierR1, 75
        GuiControl, 2:Disable, MultiplierR2
        GuiControl, 2:, MultiplierR2, 125
    }
return
HideButton:
if GuiVisible
{
    Gui, 1:Hide
    Gui, 2:Hide
    GuiVisible := false
    SecondGuiVisible := false
}
else
{
    Gui, 1:Show
    GuiVisible := true
}
return
ModificationsMenu:
if SecondGuiVisible
{
    Gui, 2:Hide
    SecondGuiVisible := false
}
else
{
    Gui, 2:Show
    SecondGuiVisible := true
}
return
VersionMenu:
if ThirdGuiVisible
{
    Gui, 3:Hide
    ThirdGuiVisible := false
}
else
{
    Gui, 3:Show
    ThirdGuiVisible := true
}
return
Check:
try
{
	Msgbox,, Error, Updating has been disabled in source mode, Check line 655 to enable it.
	/*
    OutputVar := URLDownloadToVar("https://pastebin.com/raw/HuUQSUFi")

    OutputVar := Trim(OutputVar)

    if (OutputVar = "1.0.2_B5.1") {
        GuiControl, 3:+cGreen +Redraw, Update,
        GuiControl, 3:, Update, Up To Date
    } else {
        GuiControl, 3:+cRed +Redraw, Update,
        GuiControl, 3:, Update, Update available
        GuiControl, 3:Hide, CheckUpdateButton
		GuiControl, 3:Show, UpdateButton
    }
	*/
}
catch
{
    Msgbox,, Error, Please check your internet connection.
}
return
Updater:
try
{
    UpdateURL := URLDownloadToVar("https://pastebin.com/raw/wsr4WXc5")
    UpdateFileName := "HPlayer-" . OutputVar ".exe"
    DownloadToFile(UpdateURL, UpdateFileName)
    Updated := True
    ExitApp
}
catch
{
    Msgbox,, Error, Please check your internet connection.
}
return
LowestDelayCheck:
	GuiControlGet, isCheckedLDE,, LDEnable
	GuiControlGet, isCheckedHDE,, HDEnable
    if (isCheckedLDE)
	{
		GuiControl, 2:Enable, LowestDelay
        GuiControl, 2:Enable, IgnoreClicks
	} else {
		GuiControl, 2:Disable, LowestDelay
        GuiControl, 2:Disable, IgnoreClicks
    }
    if (isCheckedLDE or isCheckedHDE)
    {
        GuiControl, 2:Enable, IgnoreClicks
    } else {
        GuiControl, 2:Disable, IgnoreClicks
    }
return
HighestDelayCheck:
	GuiControlGet, isCheckedLDE,, LDEnable
	GuiControlGet, isCheckedHDE,, HDEnable
    if (isCheckedHDE)
	{
		GuiControl, 2:Enable, HighestDelay
        GuiControl, 2:Enable, IgnoreClicks
	} else {
		GuiControl, 2:Disable, HighestDelay
        GuiControl, 2:Disable, IgnoreClicks
    }
    if (isCheckedLDE or isCheckedHDE)
    {
        GuiControl, 2:Enable, IgnoreClicks
    } else {
        GuiControl, 2:Disable, IgnoreClicks
    }
return
Upload:
{
    initialDir := "C:\Your\Default\clicks.txt"
    FileSelectFile, clickFile, %initialDir%, clicks, Select a .txt file, Text Files (*.txt)
}
return
Button:
Toggle := !Toggle
SetTimer, AutoClick, 0, Off
return
Random(Min, Max)
{
    Random, Number, Min, Max
    return Number
}
URLDownloadToVar(url){
	hObject:=ComObjCreate("WinHttp.WinHttpRequest.5.1")
	hObject.Open("GET",url)
	hObject.Send()
	return hObject.ResponseText
}
DownloadToFile(url, filename)
{
    static a := "AutoHotkey/" A_AhkVersion
    if (!(o := FileOpen(filename, "w")) || !DllCall("LoadLibrary", "str", "wininet") || !(h := DllCall("wininet\InternetOpen", "str", a, "uint", 1, "ptr", 0, "ptr", 0, "uint", 0, "ptr")))
        return 0
    c := s := 0
    if (f := DllCall("wininet\InternetOpenUrl", "ptr", h, "str", url, "ptr", 0, "uint", 0, "uint", 0x80003000, "ptr", 0, "ptr"))
    {
        while (DllCall("wininet\InternetQueryDataAvailable", "ptr", f, "uint*", s, "uint", 0, "ptr", 0) && s > 0)
        {
            VarSetCapacity(b, s, 0)
            DllCall("wininet\InternetReadFile", "ptr", f, "ptr", &b, "uint", s, "uint*", r)
            c += r
            o.rawWrite(b, r)
        }
        DllCall("wininet\InternetCloseHandle", "ptr", f)
    }
    DllCall("wininet\InternetCloseHandle", "ptr", h)
    o.close()
    return c
}
AutoClick:
If (isCheckedWO)
{
    If (Toggle and WinActive(WindowName))
    {
        firstclick := true
        While GetKeyState("LButton", "P")
        {
            If (isCheckedFT) and (GetKeyState(ToggleKey, "P"))
            {
                gosub, break1
                break1:
                break
            }
            If (RMBLock) and (GetKeyState("RButton", "P"))
            {
                gosub, break2
                break2:
                break
            }
            If (ShiftLock) and (GetKeyState("LShift", "P"))
            {
                gosub, break3
                break3:
                break
            }
            if (firstclick)
            {
                If (RandomizedStartPoint)
                {
                    start_index := Random(1, down_delays.Length())
                    down_index := start_index
                    up_index := start_index
                } else {
                    start_index := 1
                    down_index := start_index
                    up_index := start_index
                }
                firstclick := false
                down_delay := down_delays[Mod(down_index - 1, down_delays.Length()) + 1]
                up_delay := up_delays[Mod(up_index - 1, up_delays.Length()) + 1]
                If (MultiplierEnableRandomized)
                {
                    Value := Random(MultiplierR1, MultiplierR2)
                }
                DllCall("Sleep", "UInt", down_delay * (0.01 * Value))
                DllCall("mouse_event", "uint", 0x04, "int", 0, "int", 0, "uint", 0, "ptr", 0)
                DllCall("Sleep", "UInt", up_delay * (0.01 * Value))
                down_index++
                up_index++
                GetKeyState, State, LButton, P
                If State = U
                break
            }
            If (MultiplierEnableRandomized)
            {
                Value := Random(MultiplierR1, MultiplierR2)
            }
            down_delay := down_delays[Mod(down_index - 1, down_delays.Length()) + 1]
            up_delay := up_delays[Mod(up_index - 1, up_delays.Length()) + 1]
            DllCall("mouse_event", "uint", 0x02, "int", 0, "int", 0, "uint", 0, "ptr", 0)
            DllCall("Sleep", "UInt", down_delay * (0.01 * Value))
            DllCall("mouse_event", "uint", 0x04, "int", 0, "int", 0, "uint", 0, "ptr", 0)
            DllCall("Sleep", "UInt", up_delay * (0.01 * Value))
            down_index++
            up_index++
        }
    }
}
else If (Toggle) and not (isCheckedWO)
{
    firstclick := true
    While GetKeyState("LButton", "P")
    {
        If (isCheckedFT) and (GetKeyState(ToggleKey, "P"))
        {
            gosub, break4
            break4:
            break
        }
        If (RMBLock) and (GetKeyState("RButton", "P"))
        {
            gosub, break5
            break5:
            break
        }
        If (ShiftLock) and (GetKeyState("LShift", "P"))
        {
            gosub, break6
            break6:
            break
        }
        if (firstclick)
        {
            If (RandomizedStartPoint)
            {
                start_index := Random(1, down_delays.Length())
                down_index := start_index
                up_index := start_index
            } else {
                start_index := 1
                down_index := start_index
                up_index := start_index
            }
            firstclick := false
            down_delay := down_delays[Mod(down_index - 1, down_delays.Length()) + 1]
            up_delay := up_delays[Mod(up_index - 1, up_delays.Length()) + 1]
            If (MultiplierEnableRandomized)
            {
                Value := Random(MultiplierR1, MultiplierR2)
            }
            DllCall("Sleep", "UInt", down_delay * (0.01 * Value))
            DllCall("mouse_event", "uint", 0x04, "int", 0, "int", 0, "uint", 0, "ptr", 0)
            DllCall("Sleep", "UInt", up_delay * (0.01 * Value))
            down_index++
            up_index++
            GetKeyState, State, LButton, P
            If State = U
            break
        }
        If (MultiplierEnableRandomized)
        {
            Value := Random(MultiplierR1, MultiplierR2)
        }
        down_delay := down_delays[Mod(down_index - 1, down_delays.Length()) + 1]
        up_delay := up_delays[Mod(up_index - 1, up_delays.Length()) + 1]
        DllCall("mouse_event", "uint", 0x02, "int", 0, "int", 0, "uint", 0, "ptr", 0)
        DllCall("Sleep", "UInt", down_delay * (0.01 * Value))
        DllCall("mouse_event", "uint", 0x04, "int", 0, "int", 0, "uint", 0, "ptr", 0)
        DllCall("Sleep", "UInt", up_delay * (0.01 * Value))
        down_index++
        up_index++
    }
}
return
Exit:
DllCall("Winmm\timeEndPeriod", "UInt", 1)
If (Updated)
{
    FileAppend, DEL "%A_ScriptFullPath%"`nDEL "%A_ScriptDir%\del.bat", del.bat
    Loop
    {
        if (FileExist("del.bat"))
        {
            break
        }
    }
    Run, %UpdateFileName%,, Hide
    Run, del.bat,, Hide
}
ExitApp
return