#Include RandomBezier.ahk
#NoTrayIcon
SetTitleMatchMode 2

;########## Author: github.com/crinkies ##########
;########## License: MIT ##########

Gui, +AlwaysOnTop
Gui, Color, 9CD9EB

quit_program := 0
button_click := 0
button_click2 := 0
toggle_1 := 1
toggle_2 := 1

w := a_screenwidth
h := a_screenheight

;########## install background images ##########

image_00 = %A_Temp%\IMAGE_00.gif
image_01 = %A_Temp%\IMAGE_01.png
image_02 = %A_Temp%\IMAGE_02.png
image_03 = %A_Temp%\IMAGE_03.png
image_04 = %A_Temp%\IMAGE_04.png
image_05 = %A_Temp%\IMAGE_05.png
image_06 = %A_Temp%\IMAGE_06.png

FileInstall, GUI\IMAGE_00.gif, %image_00%, 1
FileInstall, GUI\IMAGE_01.png, %image_01%, 1
FileInstall, GUI\IMAGE_02.png, %image_02%, 1
FileInstall, GUI\IMAGE_03.png, %image_03%, 1
FileInstall, GUI\IMAGE_04.png, %image_04%, 1
FileInstall, GUI\IMAGE_05.png, %image_05%, 1
FileInstall, GUI\IMAGE_06.png, %image_06%, 1

;########## set up GUI ##########

;########## main ##########

Gui, Add, Tab, x0 y0 w435 h154 vtab, Main|User/NPC Settings|Extra|About|How To Use
Gui, Tab, Main
Gui, Add, Button, x112 y69 w319 h40 vbutton_1, OK
Gui, Add, Button, x10 y87 w50 h20 gbutton_7 vbutton_7, Set
Gui, Font, cBlue
gui, add, checkbox, x10 y67 h20 w100 gcheck vcheck, Set splash time?
gui, add, text, x87 y87 h20 w20 vhr_label, HR
gui, add, Edit, x67 y87 h20 w19 vset_label, 1
guicontrol, disable, button_7
guicontrol, disable, set_label
guicontrol, hide, hr_label
guicontrol, hide, set_label
Gui, Font, cRed

dropdown_1 := "1||2|3|4|5|6|7|8|9|10|11|12|12|14|15|16|17|18|19|"
dropdown_2 := "2||3|4|5|6|7|8|9|10|11|12|12|14|15|16|17|18|19|20"
dropdown_3 := "2||3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20"
dropdown_4 := "3||4|5|6|7|8|9|10|11|12|12|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30"

Gui, Add, DropDownList, x12 y26 w50 h500 hwndDDLHwnd1 vtime_1, %dropdown_1%
Gui, Add, DropDownList, x62 y26 w50 h500 hwndDDLHwnd2 vtime_2, %dropdown_2%
Gui, Add, DropDownList, x12 y46 w50 h500 hwndDDLHwnd3 vtime_3, %dropdown_3%
Gui, Add, DropDownList, x62 y46 w50 h500 hwndDDLHwnd4 vtime_4, %dropdown_4%
Gui, Add, Button, x2 y26 w10 h40 vbutton_5 gbutton_5,
Gui, Show, x0 y0 h110 w434, OSRS Splasher - Press OK to begin.
guicontrol, disable, time_3
guicontrol, disable, time_4
Gui, Add, Pic, x115 y27 w230 h38,  %image_06%
Gui, Add, Pic, x370 y21 w50 h-1, %image_00%

;########## user/NPC Settings ##########

Gui, Tab, User/NPC Settings
Gui, Font, cBlue
Gui, Add, GroupBox, x11 y30 w250 h60, User
Gui, Font, cRed,
Gui, Add, Edit, x14 y45 w100 h20 password vusername_1, Username
Gui, Add, Edit, x14 y65 w100 h20 password vpassword_1, Password
Gui, Add, Button, x114 y45 w10 h40 gbutton_4,
Gui, Font, cBlue
Gui, Add, CheckBox, x14 y90 w130 h15 vlogin_1, Auto login and attack?
Gui, Add, CheckBox, Checked x150 y90 w130 h15 vlock, Lock cursor to NPC?
Gui, Add, Text, x310 y90 w100 h20, Npc clicks?
Gui, Add, Button, x280 y90 w20 h20 vclick_amount gbutton_8, 3 
Gui, Add, Button, x273 y65 w10 h20 gpix_grab1, >
Gui, Add, Button, x191 y65 w10 h20 gpix_grab2, >
Gui, Add, DropDownList, x140 y65 w50 h500 vinventory_1, F2||ESC|F1|F2|F3|F4|F5
Gui, Add, GroupBox, x270 y30 w156 h60, NPC
Gui, Font, cRed
Gui, Add, Text, x277 y45 w100 h20, HEX color
Gui, Add, Text, x342 y45 w50 h20, Range
Gui, Add, DropDownList, x342 y65 w50 h500 vrange_1, 5||15|30|
Gui, Add, Button, x400 y40 w20 h46 gbutton_3, ?
Gui, Add, Text, x140 y45 w115 h20, Inventory HotKey / HEX
Gui, Font, cBlue
Gui, Add, Edit, x283 y65 w57 h20 vcolor_1, 0xFFB700
Gui, Add, Edit, x201 y65 w57 h20 vcolor_2, 0x00FFFF

;########## extra ##########

Gui, Tab, Extra
Gui, Add, GroupBox, x11 y30 w415 h75, Extra
Gui, Font, cBlue
Gui, Add, Text, x15 y45 w250 h25, Enter delay here. 500-1500ms recommended.
Gui, Font, cRed
Gui, Add, Edit, x14 y60 w60 h20 vdelay_1, 500
Gui, Add, Edit, x74 y60 w60 h20 vdelay_2, 1500
Gui, Font, cBlue
Gui, Add, CheckBox, Checked x15 y83 w100 h20 vextra_delay, Use extra delay?
Gui, Add, CheckBox, x120 y83 w120 h20 gbutton_6 vminimize_1, Minimize RuneLite?
Gui, Add, CheckBox, Checked x240 y60 w150 h20 vlowercase_let, Use lowercase letters?
Gui, Add, Button, x400 y60 w20 h20 gbutton_2, ?
Gui, Add, CheckBox, x240 y40 w120 h20 vbeep_1, Beep on keypress?
Gui, Add, CheckBox, x240 y81 w160 h20 gcheck2 vcheck2, Use second set of variables?
Gui, Add, Button, x400 y81 w20 h20 gbutton_1, ?

;########## about ##########

Gui, Tab, About
Gui, Add, GroupBox, x11 y30 w415 h75 , About
Gui, Add, Pic, x100 y40 w80 h30, %image_02%
Gui, Add, Link, x180 y45 w40 h20 cRed, <a href="https://github.com/crinkies/">crinkies.</a>
Gui, Add, Pic, x230 y40 w25 h25, %image_03%
Gui, Add, Link, x142 y75 w50 h20 cGreen, <a href="www.VirtualBox.org">Click here</a>
Gui, Add, Pic, x290 y75 w25 h25, %image_04%
Gui, Add, Pic, x190 y65 w100 h30, %image_05%

;########## how to use ##########

Gui, Tab, How To Use
Gui, Add, GroupBox, x11 y30 w415 h75 , How To Use
Gui, Add, GroupBox, x120 y50 w170 h35
Gui, Add, Link, x152 y65 w130 h15 cGreen, <a href="https://htmlpreview.github.io/?https://github.com/crinkies/OSRS-Splasher/blob/main/Instructions.html">Click for instructions.</a>
return


;########## hotkey and button subroutines ##########
 
button_1:
   MsgBox, Click this checkbox to start with the variables from the bottom column on the "Main" tab.
return
 
button_2:
   MsgBox, Uses random lowercase letters for keypresses instead of the default backspace.
return
 
button_3:
   MsgBox, HEX color:`n`nSet the HEX color here after tagging an NPC in NPC indicator.`n`nRange:`n`nSet the pixel click range for NPC attack.
return

button_4:
   toggle_1 := !toggle_1
   If !toggle_1
   {
      GuiControl,-password, username_1 
      GuiControl,-password, password_1 
   }
   else if toggle_1
   {
      GuiControl,+password, username_1 
      GuiControl,+password, password_1 
   }
return

button_5:
   toggle_2 := !toggle_2
   If !toggle_2
   {
      GuiControl,, % DDLHwnd1, |10||
      GuiControl,, % DDLHwnd2, |14||
      GuiControl,, % DDLHwnd3, |14||
      GuiControl,, % DDLHwnd4, |20||
   }
   else if toggle_2
   {
      GuiControl,, % DDLHwnd1, |
      GuiControl,, % DDLHwnd2, |
      GuiControl,, % DDLHwnd3, |
      GuiControl,, % DDLHwnd4, |
      GuiControl,,time_1, %dropdown_1%
      GuiControl,,time_2, %dropdown_2%
      GuiControl,,time_3, %dropdown_3%
      GuiControl,,time_4, %dropdown_4%
   }
return

button_6:
   guicontrolget, checkboxstate,, minimize_1
   if checkboxstate = 1
   {
   MsgBox, This option will only work without auto login enabled.
   }
return

button_7:
   button_click++
   guicontrol,, set_label, %button_click%
   if button_click >= 24
      {
         button_click := 0
      }
return

button_8:
   button_click2++
   click_amount := button_click2
   guicontrol,, click_amount, %button_click2%
   if button_click2 >= 5
      {
            button_click2 := 0
      }
return

;########## checkbox and pixel subroutines ##########

check:
   guicontrolget, checkboxstate,, check
   if checkboxstate = 1
   {
      guicontrol, enable, button_7
      guicontrol, show, set_label
      guicontrol, show, hr_label
   }
   else
   {
      guicontrol, disable, button_7
      guicontrol, hide, set_label
      guicontrol, hide, hr_label
   }
return

check2:
   guicontrolget, checkboxstate,, check2
   if checkboxstate = 1
   {
      guicontrol, enable, time_3
      guicontrol, enable, time_4
   }
   else
   {
      guicontrol, disable, time_3
      guicontrol, disable, time_4
   }
return

pix_grab1:
MsgBox, Hover over a pixel and press the middle mouse button.
keywait, mbutton, d
mousegetpos, x, y
pixelgetcolor, pix, x, y, RGB
guicontrol,, color_1, %pix%
return

pix_grab2:
MsgBox, Hover over a pixel and press the middle mouse button.
keywait, mbutton, d
mousegetpos, x, y
pixelgetcolor, pix, x, y, RGB
guicontrol,, color_2, %pix%
return

;########## gui submit ##########

ButtonOK:
   start_time := A_TickCount
   settimer, run_time, 1000
   login_attempts := 0
   npc_attempts := 0
   Gui, submit
   ;########## also known as SunAwtFrame ##########
   IfWinNotExist, ahk_exe Runelite.exe 
   {
      Gosub, check_runelite
   }
   if (login_1 = 1){
      if minimize_1 = 1
      {
         MsgBox, You cannot use the minimize option with auto login.
         reload
      }
      gosub set_active
      gosub check_login
      SetTimer, login, 10000
   }

   ;########## disable gui elements ##########

   GuiControl, disable, range_1
   GuiControl, disable, inventory_1
   GuiControl, disable, color_1
   GuiControl, disable, color_2
   GuiControl, disable, login_1
   GuiControl, disable, user_1
   GuiControl, disable, username_1
   GuiControl, disable, password_1
   GuiControl, disable, delay_1
   GuiControl, disable, delay_2
   GuiControl, disable, extra_delay
   GuiControl, disable, minimize_1
   GuiControl, disable, check2
   GuiControl, disable, time_1
   GuiControl, disable, time_2
   GuiControl, disable, time_3
   GuiControl, disable, time_4
   GuiControl, disable, beep_1
   GuiControl, disable, lowercase_let
   GuiControl, hide, % image_06
   GuiControl, hide, time_1
   GuiControl, hide, time_2
   GuiControl, hide, time_3
   GuiControl, hide, time_4
   GuiControl, hide, username_1
   GuiControl, hide, password_1
   GuiControl, disable, Tab
   GuiControl, hide, button_5
   GuiControl, hide, button_7
   GuiControl, hide, set_label
   GuiControl, hide, hr_label
   Gosub, gui_2
   If check = 1
   {
      duration := 3600000
      running_time := (set_label*duration)
      SetTimer, splash_time, %running_time%
   }
   is_running := !is_running
   If (!is_running)
   {
      MsgBox, Already running!
      reload
      return
   }

   Random RanSleep, delay_1, delay_2

   If login_1 = 1
   {
      settimer, timer_wait, 350000
   }
   if login_1 = 0
   {
      Gosub TimerF1
      If check2 = 1
   {
      Gosub TimerF2
   }
}

return

;########## login loop ##########

login:
   settimer, login, OFF
   WinActivate, RuneLite

   ;########## delays ##########

   Random, bez_delay, 300, 800
   Random, ran_loop, 10000, 15000
   Random, rand_sleep_sm, 150, 300
   Random, rand_sleep_md, 300, 500
   Random, rand_sleep_lg, 750, 1000
   Random, rand_offset, 1, 5
   Random, rand_offset_long, 10, 20

   CoordMode, Pixel, Window
    
   ;########## check for errors ##########
    
   ;########## check for update ##########

   ImageSearch, FoundX, FoundY, 0, 0, w, h, SRC\img_error_3.png
   If ErrorLevel = 0
   {

      Sleep, rand_sleep_sm
      gosub set_inactive

      Error := "UPDATE"
      GuiControl,, Error, %Error%
      gosub timer_off
      
   }
   
   ;########## check for login splash screen ##########
   ;########## failsafe as login time varies ##########

   Sleep, rand_sleep_md

   ImageSearch, FoundX, FoundY, 0, 0, w, h, SRC\img_3.png
   If ErrorLevel = 0
   {
      MouseGetPos, MouseX, MouseY
      RandomBezier(MouseX, MouseY, FoundX, FoundY+rand_offset_long, "T" . bez_delay ahk_class SunAwtFrame)
      click
      Sleep, rand_sleep_sm
      gosub set_inactive

      ;########## if found then skip to check runes / attack npc ##########

      gosub logged_in
   }
    
    
   ;########## check for cancel button ##########
    
   ImageSearch, FoundX, FoundY, 0, 0, w, h, SRC\img_error.png
   If ErrorLevel = 0
   {
      MouseGetPos, MouseX, MouseY
      RandomBezier(MouseX, MouseY, FoundX-rand_offset, FoundY+rand_offset, "T" . bez_delay ahk_class SunAwtFrame)
      click
      Sleep, rand_sleep_sm
      gosub set_inactive
   }
    
   ;########## check for bad password ##########

   ImageSearch, FoundX, FoundY, 0, 0, w, h, SRC\img_error_2.png
   If ErrorLevel = 0
   {
      MouseGetPos, MouseX, MouseY
      RandomBezier(MouseX, MouseY, FoundX-rand_offset, FoundY+rand_offset, "T" . bez_delay ahk_class SunAwtFrame)
      click
      Sleep, rand_sleep_sm
      gosub set_inactive

      login_attempts++
      Error := "LOGIN ATTEMPT: " login_attempts
      GuiControl,, Error, %Error%

      if login_attempts = 4
   {
      Error := "LOGIN FAILED"
      GuiControl,, Error, %Error%
      gosub, timer_off
      gosub, bad_password
   }
      Sleep, rand_sleep_md
   }
    
    
    
   ;########## check for ok button ##########

   ImageSearch, FoundX, FoundY, 0, 0, w, h, SRC\img_0.png
   If ErrorLevel = 0
   {
      MouseGetPos, MouseX, MouseY
      RandomBezier(MouseX, MouseY, FoundX-rand_offset, FoundY+rand_offset, "T" . bez_delay ahk_class SunAwtFrame)
      click
      Sleep, rand_sleep_sm
      gosub set_inactive
   }
    
   ;########## check for existing user button ##########

   ;########## nested image searches ##########
    
   ImageSearch, FoundX, FoundY, 0, 0, w, h, SRC\img_1.png
   If ErrorLevel = 0
   {
      gosub set_inactive
      MouseGetPos, MouseX, MouseY
      RandomBezier(MouseX, MouseY, FoundX-rand_offset, FoundY+rand_offset, "T" . bez_delay ahk_class SunAwtFrame)
      click
      Sleep, rand_sleep_sm
       
      ;########## erase password in case of error ##########

      Sleep, rand_sleep_md
      StringLen, length, username_1
      length := length+10
      SendInput {BS %length%}

      Sleep, rand_sleep_sm
      SendInput {tab}

      Sleep, rand_sleep_md
      StringLen, length, password_1
      length := length+10
      SendInput {BS %length%}
      
      Sleep, rand_sleep_md
      
      SendInput {tab}
       
      ;########## send login ##########

      SendInput, %username_1%
      Sleep, rand_sleep_md

      SendInput, {tab}

      SendInput, %password_1%
      Sleep, rand_sleep_lg
       
      ;########## click login button ##########
       
      ImageSearch, FoundX, FoundY, 0, 0, w, h, SRC\img_2.png
      If ErrorLevel = 0
      {
         MouseGetPos, MouseX, MouseY
         RandomBezier(MouseX, MouseY, FoundX, FoundY+rand_offset_long, "T" . bez_delay ahk_class SunAwtFrame)
         click
         Sleep, rand_sleep_md
         gosub set_inactive
          
         ;########## search for logged in screen ##########

         ImageSearch, FoundX, FoundY, 0, 0, w, h, SRC\img_3.png

         If ErrorLevel = 0
         {
            MouseGetPos, MouseX, MouseY
            RandomBezier(MouseX, MouseY, FoundX, FoundY+rand_offset_long, "T" . bez_delay ahk_class SunAwtFrame)
            click
            Sleep, rand_sleep_sm
            gosub set_inactive
            gosub logged_in
         }
      }
       
     ;########## set random login search loop if timer not set to off ##########

     }
        If quit_program = 0
     {
        SetTimer, login, %ran_loop%
     }
return
 
logged_in:
    

    random, rand_sleep_md, 300, 800
    random, rand_sleep_lg, 800, 1500

   ;########## wait for login to end ##########

   Sleep, 5000

   ;########## open inventory ##########

   SendInput {%inventory_1%}
   Sleep, 500

   ;########## check for inventory tag hex ##########

   L2 := "inventory"
   GuiControl,, L2, %L2%
   Sleep, rand_sleep_md

   SysGet, VirtualScreenWidth, 78
   SysGet, VirtualScreenHeight, 79
   PixelSearch, FoundX, FoundY, 0, 0, VirtualScreenWidth, VirtualScreenHeight, %color_2%, 0, Fast RGB
   
   ;########## set GUI ##########

   ;########## no runes error ##########

   If ErrorLevel = 1
   {
      Error := "NO RUNES"
      GuiControl,, Error, %Error%
      quit_program := 1
      settimer, login, OFF
      settimer, run_time, OFF
      settimer, TimerF1, OFF
   }
   Else If ErrorLevel = 0
   {
      Sleep, rand_sleep_md

      ;########## backspace in chat to prevent password leak ##########
       
      loop, length
      {
         Sendinput {BS}
      }

      SendInput {%inventory_1%}

      ;########## orient camera ##########

      gosub orient

      Sleep, rand_sleep_lg

      ;########## attack npc ##########

      gosub attack_npc
      gosub set_active
   }
return

;########## attack npc subroutine ##########

attack_npc:
   
   ;########## wait for orient to end ##########

   Sleep, 4000
   
   ;########## set GUI ##########
  
   L2 := "npc search"
   GuiControl,, L2, %L2%

   ;########## if default button value is zero then default to 3 clicks  ##########

   If button_click2 = 0
   {
      click_amount := 3
   }

   Loop % click_amount
   {

   range_2 := (range_1 * 2)
   move := 0

   ;########## lock mouse to pixel ##########

   If lock = 1
   {
   loop, 20

      {
         PixelSearch, FoundX, FoundY, 0, 0, w, h, %color_1%, 0, Fast RGB
         if ErrorLevel=0
         {
         
         ;########## bezier to initial point once ##########

         if move = 0
         {
  	    MouseGetPos, MouseX, MouseY
            RandomBezier(MouseX, MouseY, FoundX, FoundY, "T" . bez_delay ahk_class SunAwtFrame)
            move++
         }
            mousemove FoundX, FoundY+range_2
         }
      }
      }

      ;########## random delay ##########

      random, bez_delay_2, 300, 500
      random, ransleep, 500, 800

      ;########## check for npc pixel ##########

      CoordMode, Pixel, window
      PixelSearch, FoundX, FoundY, 0, 0, w, h, %color_1%, 0, Fast RGB
      If ErrorLevel = 0
      {
         ;########## click ranges, adjust as needed ##########

         If range_1 = 30
         {
            random, rand, 30, 40
         }
         Else if range_1 = 15
         {
            random, rand, 15, 25
         }
         Else if range_1 = 5
         {
            random, rand, 5, 10
         }
         rand2 := (rand * 3)
         MouseGetPos, MouseX, MouseY
         RandomBezier(MouseX, MouseY, FoundX+rand, FoundY+rand2, "T" . bez_delay_2 ahk_class SunAwtFrame)
         click
          
         Sleep, ransleep
          
         ;##########  Move randomly then click again ##########

         random, random_offset1, -300, 300
         random, random_offset2, -150, 150

         MouseGetPos, MouseX, MouseY
         RandomBezier(MouseX, MouseY, MouseX+random_offset1, MouseY+random_offset2, "T" . bez_delay_2 ahk_class SunAwtFrame)
          
         Sleep, ransleep
      }}

   ;########## if npc check fails add attempt ##########

   if ErrorLevel = 1
   {
      npc_attempts++
      Error := "NPC N/A: " npc_attempts
      GuiControl,, Error, %Error%
   }
    
   ;########## Exit after 4 attempts ##########
    
   if npc_attempts = 4
   {
      Error := "NO NPC"
      GuiControl,, Error, %Error%
      gosub, timer_off
   }

   ;########## Move mouse off screen ##########
    
   MouseGetPos, MouseX, MouseY
   RandomBezier(MouseX, MouseY, 0, 0, "T" . bez_delay ahk_class SunAwtFrame)
return

;########## subroutines ##########

;########## orient subroutine ##########

orient:

   L2 := "orient"
   GuiControl,, L2, %L2%

   random, rand, 20, 50
   loop, 50
   {
      send {Wheelup}
      sleep, rand
   }
      sleep, 500
   loop, 15
   {
     send {Wheeldown}
      sleep, rand
   }
   random, rand, 75, 100
   loop, %rand%
   {
      send {Down down}
   }
      send {Down up}
   sleep, 500
   loop, %rand%
   {
      send {Up down %rand%}
   }
      send {Up up}
   random, rand, 50, 75
   random, choice, 1, 2
   if choice = 1
   {
      loop, %rand%
      {
         send {right down}
      }
         send {right up}
   }
   else if choice = 2
   {
      loop, %rand%
      {
         sendinput {left down}
      }
         send {left up}
   }
return

;########## Splashing timers ##########

TimerF1:
   x = 0
   var1 := (time_1 * 60 * 1000)
   var2 := (time_2 * 60 * 1000)
   If (time_1 > time_2)
   {
      MsgBox, You must enter a valid variable!
      reload
   }
   If (is_running)
   {
      Random, x, %var1%, %var2%
      WinActivate, RuneLite
      If extra_delay = 1
      {
         Sleep %RanSleep%
      }
      chr = 0
      if lowercase_let = 1
      {
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
   gosub add_value
return
 
TimerF2:
   x = 0
   var3 := (time_3 * 60 * 1000)
   var4 := (time_4 * 60 * 1000)
   If (time_3 > time_4)
   {
      MsgBox, You must enter a valid variable!
      reload
   }
   If (is_running)
   {
      Random, x, %var3%, %var4%
      WinActivate, RuneLite
      If extra_delay = 1
      {
         Sleep %RanSleep%
      }
      chr = 0
      if lowercase_let = 1
      {
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
   gosub add_value
return

;########## timer off subroutine and gui ##########

gui_2:
   Gui, Show, x0 y0 h110 w434,  Splashing between: %time_1%-%time_2% and %time_3%-%time_4% minutes.
   Gui, Tab, Main
   GuiControl, Hide, button_1
   Gui, Add, Button,  x3 y69 w428 h40 vquit_button, STOP
   Gui, Font, cBlue s11,
   Gui, Add, GroupBox, x8 y20 w350 h50, Info
   Gui, Add, Text, x15 y34 w75 h15 vlabel_1, Keystrokes:
   Gui, Add, Text, x120 y34 w75 h15 vlabel_2, Run time:
   Gui, Font, cRed s11,
   Gui, Add, Text, x90 y34 w20 h15 vL1, %L1%
   Gui, Add, Text, x180 y34 w50 h15 vTime_label,
   If check = 1
   {
      Gui, Font, cBlue s11,
      Gui, Add, Text, x250 y34 w70 h20 vtime_label2, % "Set time:"
      Gui, Font, cRed s11, 
      Gui, Add, Text, xp+55 yp vtime_label3, %set_label%
      Gui, Font, cBlue s11,
      Gui, Add, Text, xp+15 yp vtime_label4, % " HR"
   }
   If (login_1 = 1)
   {
      Gui, Font, cBlue s11,
      Gui, Add, Text, x15 y53 w40 h14 vstatus_1, Status:
      Gui, Font, cRed s12,
      Gui, Add, Text, x65 y50 w120 h18 vL2, %L2%
      Gui, Add, Text, x200 y50 w150 h18 vError, %Error%
   }
   Gui, Font
return

timer_off:
   quit_program := 1
   settimer, login, OFF
   settimer, run_time, OFF
   settimer, TimerF1, OFF
   If check2 = 1
   {
      settimer, TimerF2, OFF
   }
   if check = 1
   {
   Gui, Font, cRed s14,
   Gui, Add, Text, x30 y34 w300 h30 vfinished,
   fin_time :=  "FIN TIME: " set_label "HR/TOTAL: " elapsed_time
   GuiControl,, finished, %fin_time%
   button_text := "CONTINUE"
   GuiControl,, quit_button, %button_text%
   GuiControl, Hide, label_1
   GuiControl, Hide, label_2
   GuiControl, Hide, status_1
   GuiControl, Hide, L1
   GuiControl, Hide, L2
   GuiControl, Hide, Error
   GuiControl, Hide, time_label2
   GuiControl, Hide, time_label3
   GuiControl, Hide, time_label4
   }
return
 
set_inactive:
   L2 := "inactive"
   GuiControl,, L2, %L2%
return
 
set_active:
   L2 := "active"
   GuiControl,, L2, %L2%
return

;########## subroutine checks, exit ##########

bad_password:
   MsgBox, Please enter the correct login.
   reload
return

splash_time:
   settimer, splash_time, OFF
   gosub timer_off
return
 
run_time:
   seconds_time := Floor((A_TickCount - start_time)/1000)
   elapsed_time := FormatSeconds(seconds_time)
   GuiControl,, Time_label, %elapsed_time%
return

FormatSeconds(NumberOfSeconds)
{
    time = 19990101
    time += %NumberOfSeconds%, seconds
    FormatTime, mmss, %time%, mm:ss
    return NumberOfSeconds//3600 ":" mmss
}

timer_wait:
   Gosub TimerF1
   If check2 = 1
   {
      Gosub TimerF2
   } 
   settimer, timer_wait, OFF
return 

check_login:

   if (username_1 = ""){
      MsgBox, Please enter your login.
      reload
   }

   if (password_1 = ""){
      MsgBox, Please enter your login.
      reload
   }
return
 
check_runelite:
   MsgBox, Please load RuneLite!
   ExitApp
return
 
add_value:
   L1++
   GuiControl,, L1, %L1%
   If beep_1 = 1
   {
      SoundBeep, 750, 20
   }
return

buttonCONTINUE:
   reload
return
 
buttonStop:
   reload
return
 
GuiClose:
   FileDelete % image_00
   FileDelete % image_01
   FileDelete % image_02
   FileDelete % image_03
   FileDelete % image_04
   FileDelete % image_05
   FileDelete % image_06
   ExitApp
return
