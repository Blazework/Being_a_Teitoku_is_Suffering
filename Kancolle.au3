#include <GUIConstantsEx.au3>

#region Variables
dim $pos[2]
Global $x,$y,$x1,$y1,$x2,$y2,$x3,$y3
#endregion

#region Initialize
; Launch Gui

WinActivate("KanColleViewer!")
;WinMove("KanColleViewer!","",0,0)
#endregion

#region Functions

Func _Click1()
   ControlClick("KanColleViewer!","", "[CLASS:MacromediaFlashPlayerActiveX; INSTANCE:1]","left",1,$x1,$y1)
   Sleep(300)
EndFunc

Func _Click2()
   ControlClick("KanColleViewer!","", "[CLASS:MacromediaFlashPlayerActiveX; INSTANCE:1]","left",1,$x2,$y2)
   Sleep(300)
EndFunc

Func _Click3()
   ControlClick("KanColleViewer!","", "[CLASS:MacromediaFlashPlayerActiveX; INSTANCE:1]","left",1,$x3,$y3)
   Sleep(300)
EndFunc

Func _Click($x,$y)
   ControlClick("KanColleViewer!","", "[CLASS:MacromediaFlashPlayerActiveX; INSTANCE:1]","left",1,$x,$y)
   Sleep(200)
EndFunc

Func _ResupplyFleetHotKey()
       Switch @HotKeyPressed
		 Case "+!a"
            _ResupplyFleet(1);
		 Case "+!s"
            _ResupplyFleet(2);
		 Case "+!d"
            _ResupplyFleet(3);
		 Case "+!f"
            _ResupplyFleet(4);
    EndSwitch
EndFunc

Func _ResupplyFleet($Fleet) ;From the main menu, resupply a fleet then return to the main menu
   Switch $Fleet ;Get coordinate for fleet switch
	  Case 1
		 $x=147
		 $y=119
	  Case 2
		 $x=178
		 $y=119
	  Case 3
		 $x=207
		 $y=119
	  Case 4
		 $x=238
		 $y=119
   EndSwitch
   _Click(76,224) ;Click resupply icon from the main menu
   Sleep(1000)
   _Click($x,$y) ;Fleet select
   _Click(117,119);'Resupply all' combo box
   _Click(703,443);Resupply button
   Sleep(3000)
   _Click(46,46) ;Return to menu
   Sleep(3000)
EndFunc

Func _ExpeditionSortie($Fleet) ;From the main menu, send a fleet to expedition then return to the main menu
   Switch $Fleet ;Get coordinate for fleet switch
	  Case 2
		 $x=393
		 $y=118
	  Case 3
		 $x=423
		 $y=118
	  Case 4
		 $x=453
		 $y=118
   EndSwitch
   _Click(200,260) ;Click sortie icon from the main menu
   Sleep(1000)
   _Click(675,228) ;Click expedition icon
   Sleep(3000)
   _ExpeditionSelect($Fleet)
   _Click($x,$y);Fleet select
   _Click(631, 445) ;Click sortie button
   Sleep(2000)
   _Click(490, 288) ;Click cancel in case of sortied
   Sleep(3000)
   _Click(46,46) ;Return to menu
   Sleep(3000)
EndFunc


Func _ExpeditionSelect($Fleet) ;Select the corresponding expedition on the expedition page ;Eg. Expedition 21 = Page 3 Row 5 = (142, 293)
   Switch $Fleet
	  Case 2
		 _Click(142, 293) ;Expedition 5
	  Case 3
		 _Click(259, 440)
		 _Click(142, 293) ;Expedition 21
	  Case 4
		 _Click(367, 440)
		 _Click(142, 322) ;Expedition 38
   EndSwitch
   _Click(680, 440)
   Sleep(500)
EndFunc

Func _BotFleet($Fleet) ;The function that resupply a fleet then sends it to Expedition ;Call this function for Expedition botting
_ResupplyFleet($Fleet)  ;Resupply
_ExpeditionSortie($Fleet) ;Select Expedition
EndFunc

Func _Refresh()
   _Click(200,260) ;Click sortie icon from the main menu
   Sleep(1000)
   _Click(46,46)
   Sleep(3000)
EndFunc
#endregion

#region HotKeySet
   HotKeySet("+!a", "_ResupplyFleetHotKey")
#endregion


;For test run purpose
while(1)
;~    _Refresh()
;~    _Click(194,432)
;~    Sleep(10000)
;~    _Click(194,432)
;~    _Click(194,432)
;~    Sleep(3000)
;~    _Click(194,432)
;~    Sleep(10000)
;~    _Click(194,432)
;~    _Click(194,432)
;~    Sleep(3000)
;~    _BotFleet(2)
;~    Sleep(600000)

;~    _Refresh()
;~    _Click(194,432)
;~    Sleep(10000)
;~    _Click(194,432)
;~    _Click(194,432)
;~    Sleep(3000)
;~    _Click(194,432)
;~    Sleep(10000)
;~    _Click(194,432)
;~    _Click(194,432)
;~    Sleep(3000)
;~    _BotFleet(3)
;~    Sleep(600000)

;~    _Refresh()
;~    _Click(194,432)
;~    Sleep(10000)
;~    _Click(194,432)
;~    _Click(194,432)
;~    Sleep(3000)
;~    _Click(194,432)
;~    Sleep(10000)
;~    _Click(194,432)
;~    _Click(194,432)
;~    Sleep(3000)
;~    _BotFleet(4)
;~    Sleep(600000)

   sleep(100)
wend
