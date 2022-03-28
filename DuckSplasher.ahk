#NoTrayIcon
SetTitleMatchMode 2
;License:MIT
;Author:github.com/crinkies
Gui, +AlwaysOnTop
gui, Color, 9CD9EB

Gui, Add, Tab3, x0 y0 w435 h154, Main|Extra|About
Gui, Tab, Main
Gui, Add, GroupBox, x8 y18 w350 h50,
Gui, Add, Button, x1 y69 w430 h40 vbutton_1, OK
Gui, Font, cRed
Gui, Add, DropDownList, x12 y26 w50 h500 vtime_1, 1||2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19
Gui, Add, DropDownList, x62 y26 w50 h500 vtime_2, 2||3|4|5|6|7|8|9|10|11|12|12|14|15|16|17|18|19|20
Gui, Add, DropDownList, x12 y46 w50 h500 vtime_3, 2||3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20
Gui, Add, DropDownList, x62 y46 w50 h500 vtime_4, 3||4|5|6|7|8|9|10|11|12|12|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30
Gui, Show, x640 y400 h110 w434, DuckSplasher - Press F1 to begin.

UrlDownloadToFile, https://i.imgur.com/r2u9zgH.jpg, % Duck := A_Temp "\temp_pic"
UrlDownloadToFile, https://i.imgur.com/pcjZ6n4.png, % Background := A_Temp "\temp_pic2"
UrlDownloadToFile, https://i.imgur.com/4pgswom.png, % Background2 := A_Temp "\temp_pic3"
UrlDownloadToFile, https://i.imgur.com/f16IMeZ.png, % Background3 := A_Temp "\temp_pic4"
UrlDownloadToFile, https://i.imgur.com/We0ZnGR.png, % Background4 := A_Temp "\temp_pic5"
UrlDownloadToFile, https://i.imgur.com/RfpCsgy.png, % Background5 := A_Temp "\temp_pic6"
UrlDownloadToFile, https://i.imgur.com/175Ryah.png, % Background6 := A_Temp "\temp_pic7"
UrlDownloadToFile, https://i.imgur.com/sGKiYm4.png, % Background7 := A_Temp "\temp_pic8"

Gui, Add, Pic, x115 y27 w230 h38, % Background7
Gui, Add, Pic, x370 y10 h60 w70, % Duck
Gui, Tab, Extra
Gui, Add, GroupBox, x11 y30 w415 h75, Extra
Gui, Font, cBlue
Gui, Add, Text, x15 y45 w250 h25, Enter delay here. 500-1500ms recommended.
Gui, Font, cRed
Gui, Add, Edit, x14 y60 w60 h20 vdelay_1, 500
Gui, Add, Edit, x74 y60 w60 h20 vdelay_2, 1500
Gui, Font, cBlue
Gui, Add, CheckBox, x15 y83 w100 h20 vextra_delay, Use extra delay?
Gui, Add, CheckBox, x120 y83 w120 h20 vminimize_1, Minimize RuneLite?
Gui, Add, CheckBox, x240 y60 w150 h20 vlowercase_let, Use lowercase letters?
Gui, Add, Button, x400 y60 w20 h20 gbutton_2, ?
Gui, Add, CheckBox, x240 y40 w120 h20 vbeep_1, Beep on keypress?

Gui, Add, CheckBox, x240 y81 w160 h20 vvariables_1, Use second set of variables?
Gui, Add, Button, x400 y81 w20 h20 gbutton_1, ?

Gui, Tab, About
Gui, Add, GroupBox, x11 y30 w415 h75 , About
Gui, Add, Pic, x100 y40 w80 h30, % Background3
Gui, Add, Link, x180 y45 w40 h20 cRed, <a href="https://github.com/crinkies/">crinkies.</a>
Gui, Add, Pic, x230 y40 w25 h25, % Background4
Gui, Add, Link, x142 y75 w50 h20 cGreen, <a href="www.VirtualBox.org">Click here</a>
Gui, Add, Pic, x290 y75 w25 h25, % Background5
Gui, Add, Pic, x190 y65 w100 h30, % Background6

return

F2::
reload
return

button_1:
MsgBox, Click this checkbox to start with the variables from the bottom column on the "Main" tab.
return

button_2:
MsgBox, Uses random lowercase letters for keypresses instead of the default backspace.
return

ButtonOk:
GuiControl, disable, delay_1
GuiControl, disable, delay_2
GuiControl, disable, extra_delay
GuiControl, disable, minimize_1
GuiControl, disable, variables_1
GuiControl, disable, time_1
GuiControl, disable, time_2
GuiControl, disable, time_3
GuiControl, disable, time_4
GuiControl, disable, beep_1
GuiControl, disable, lowercase_let
GuiControl, hide, % Background7
GuiControl, hide, time_1
GuiControl, hide, time_2
GuiControl, hide, time_3
GuiControl, hide, time_4

IfWinNotExist, ahk_exe Runelite.exe ;Also known as SunAwtFrame. Edit if not working.
{
Gosub, check_runelite
}
Gui, submit
MsgBox, Press F1 to begin.
return
 
F1::
KeyWait, F1
is_running := !is_running
If (!is_running)
{  MsgBox, Already running!
reload
return
}
Random RanSleep, delay_1, delay_2
Gosub TimerF1
If variables_1 = 1
{
Gosub TimerF2
}
Gosub, gui_2
return

TimerF1:
If (time_1 > time_2)
{
MsgBox, You must enter a valid variable!
ExitApp
}
If (is_running)
{   
Random, x, %time_1%, %time_2%
x := (x * 60 * 1000)
WinActivate, RuneLite
If extra_delay=1
{
Sleep %RanSleep%
}
chr = 0
if lowercase_let = 1
{
Random, x, %time_3%, %time4%
x := (x * 60 * 1000)
Random, chr, 97, 122
Sendinput % Chr(chr)
}
else if lowercase_let = 0
{
Sendinput {BS}
}
SetTimer, TimerF1, -%x%
}
If minimize_1 = 1
WinMinimize, RuneLite
GoSub add_value
return
 
TimerF2:
If (time_3 > time_4)
{
MsgBox, You must enter a valid variable!
ExitApp
}
If (is_running)
{   
Random, x, %time_3%, %time_4%
x := (x * 60 * 1000)
WinActivate, RuneLite
If extra_delay = 1
{
Sleep %RanSleep%
}
chr = 0
if lowercase_let = 1
{
Random, x, %time_3%, %time_4%
x := (x * 60 * 1000)
Random, chr, 97, 122
Sendinput % Chr(chr)
}
else if lowercase_let = 0
{
Sendinput {BS}
}
SetTimer, TimerF2, -%x%
}
If minimize_1 = 1
WinMinimize, RuneLite
GoSub add_value
return
 
gui_2:
Gui, Show, x640 y400 h110 w434
Gui, Tab, Main
GuiControl, Hide, button_1
Gui, Add, Button, x175 y69 w255 h40 , STOP
Gui, Add, Pic, x15 y30 w320 h35, % Background
Gui, Add, Pic, x1 y75 w140 h33, % Background2
Gui, Font
return

check_runelite:
MsgBox, Please load RuneLite!
ExitApp
return

add_value:
L1++
If beep_1 = 1
{
SoundBeep, 750, 20
}
Gui, Tab, Main
Gui, Font, cWhite s12,
Gui, Add, Text, x145 y75 w20 h40, %L1%
Gui, Font
return

ButtonStop:
reload
return

GuiClose:
FileDelete % Duck
FileDelete % temp_pic2
FileDelete % temp_pic3
FileDelete % temp_pic4
FileDelete % temp_pic5
FileDelete % temp_pic6
FileDelete % temp_pic7
FileDelete % temp_pic8
ExitApp
return
