$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type cb_stop from commandbutton within w_main
end type
type uo_8 from u_progressbar within w_main
end type
type uo_7 from u_progressbar within w_main
end type
type uo_6 from u_progressbar within w_main
end type
type uo_5 from u_progressbar within w_main
end type
type st_4 from statictext within w_main
end type
type uo_4 from u_progressbar within w_main
end type
type st_3 from statictext within w_main
end type
type uo_3 from u_progressbar within w_main
end type
type st_2 from statictext within w_main
end type
type uo_2 from u_progressbar within w_main
end type
type st_1 from statictext within w_main
end type
type uo_1 from u_progressbar within w_main
end type
type cb_start from commandbutton within w_main
end type
type cb_close from commandbutton within w_main
end type
end forward

global type w_main from window
integer width = 1911
integer height = 1908
boolean titlebar = true
string title = "Progress Bar"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event type integer ue_startprocess ( )
event ue_postopen ( )
cb_stop cb_stop
uo_8 uo_8
uo_7 uo_7
uo_6 uo_6
uo_5 uo_5
st_4 st_4
uo_4 uo_4
st_3 st_3
uo_3 uo_3
st_2 st_2
uo_2 uo_2
st_1 st_1
uo_1 uo_1
cb_start cb_start
cb_close cb_close
end type
global w_main w_main

type variables
Protected:
Boolean                          ib_cancelled
Boolean                          ib_closed
Boolean                          ib_started


end variables

event type integer ue_startprocess();//====================================================================
// Event: w_main.ue_startprocess()
//--------------------------------------------------------------------
// Description: Start the progress meters by calling of_SetPosition and running a defined algorithm.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer :
// 		0 - User closed the window while the process was being run.
// 		1 - User cancelled the process midstream.
// 		2 - The process completed on its own.
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Integer	li_count
Long		ll_complete1
Long		ll_complete2
Long		ll_complete3
Long		ll_complete4
Long		ll_complete5
Long		ll_complete6
Long		ll_complete7
Long		ll_complete8

ib_started = True
// Initialize the Progress Bars.
uo_1.of_SetPosition(0)
uo_2.of_SetPosition(0)
uo_3.of_SetPosition(0)
uo_4.of_SetPosition(0)
uo_5.of_SetPosition(0)
uo_6.of_SetPosition(0)
uo_7.of_SetPosition(0)
uo_8.of_SetPosition(0)

ib_cancelled = False
ib_closed = False

// Start the algorithm.
For li_count = 1 To 10000
	Yield()
	If ib_closed = True Then
		ib_cancelled = True
		ib_started = False
		//event pfc_close()
		Return 0
	End If
	If ib_cancelled = True Then
		ib_started = False
		Return 1
	End If
	If Mod(li_count, 100) = 0 Then
		If ll_complete1 < 100 Then
			ll_complete1 = uo_1.of_Increment() //10
		End If
		st_1.Text = String(ll_complete1, "#") + " % Complete"
		
		If ll_complete2 < 100 Then
			ll_complete2 = uo_2.of_Increment() //5
		End If
		st_2.Text = String(ll_complete2, "#") + " % Complete"
		
		If ll_complete3 < 100 Then
			ll_complete3 = uo_3.of_Increment() //2
		End If
		st_3.Text = String(ll_complete3, "#") + " % Complete"
		
		If ll_complete4 < 100 Then
			ll_complete4 = uo_4.of_Increment() //1
		End If
		
		st_4.Text = String(ll_complete4, "#") + " % Complete"
		
		If ll_complete5 < 100 Then
			ll_complete5 = uo_5.of_Increment() //10
		End If
		
		If ll_complete6 < 100 Then
			ll_complete6 = uo_6.of_Increment() //4
		End If
		
		If ll_complete7 < 100 Then
			ll_complete7 = uo_7.of_Increment() //2
		End If
		
		If ll_complete8 < 100 Then
			ll_complete8 = uo_8.of_Increment() //1
		End If
	End If
Next
ib_started = False
Return 2

end event

event ue_postopen();cb_start.triggerevent(clicked!)
end event

on w_main.create
this.cb_stop=create cb_stop
this.uo_8=create uo_8
this.uo_7=create uo_7
this.uo_6=create uo_6
this.uo_5=create uo_5
this.st_4=create st_4
this.uo_4=create uo_4
this.st_3=create st_3
this.uo_3=create uo_3
this.st_2=create st_2
this.uo_2=create uo_2
this.st_1=create st_1
this.uo_1=create uo_1
this.cb_start=create cb_start
this.cb_close=create cb_close
this.Control[]={this.cb_stop,&
this.uo_8,&
this.uo_7,&
this.uo_6,&
this.uo_5,&
this.st_4,&
this.uo_4,&
this.st_3,&
this.uo_3,&
this.st_2,&
this.uo_2,&
this.st_1,&
this.uo_1,&
this.cb_start,&
this.cb_close}
end on

on w_main.destroy
destroy(this.cb_stop)
destroy(this.uo_8)
destroy(this.uo_7)
destroy(this.uo_6)
destroy(this.uo_5)
destroy(this.st_4)
destroy(this.uo_4)
destroy(this.st_3)
destroy(this.uo_3)
destroy(this.st_2)
destroy(this.uo_2)
destroy(this.st_1)
destroy(this.uo_1)
destroy(this.cb_start)
destroy(this.cb_close)
end on

event closequery;If ib_started = True Then
	cb_close.TriggerEvent(Clicked!)
	Return 1
End If

end event

event open;This.Post Event ue_postopen ()


end event

type cb_stop from commandbutton within w_main
integer x = 1426
integer y = 1508
integer width = 361
integer height = 88
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "S&top"
end type

event clicked;//====================================================================
// Event: cb_stop.clicked()
//--------------------------------------------------------------------
// Description: Stop the progress meters in process.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

If ib_cancelled = False Then
	ib_cancelled = True
End If

end event

type uo_8 from u_progressbar within w_main
event destroy ( )
integer x = 1106
integer y = 664
integer width = 219
integer height = 1048
integer taborder = 80
boolean border = true
long backcolor = 77571519
borderstyle borderstyle = styleshadowbox!
end type

on uo_8.destroy
call u_progressbar::destroy
end on

event constructor;call super::constructor;//====================================================================
// Event: uo_8.constructor()
//--------------------------------------------------------------------
// Description:	Initializes the Progress Bar.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


of_SetFillStyle(RIGHTLEFT)
of_SetDisplayStyle(Position)
of_SetStep(1)
of_SetFillColor(RGB(255,255,0))
of_SetTextColor(RGB(0,0,128))
of_SetAutoReset(False)

end event

type uo_7 from u_progressbar within w_main
event destroy ( )
integer x = 763
integer y = 664
integer width = 219
integer height = 1048
integer taborder = 70
boolean border = true
long backcolor = 77571519
borderstyle borderstyle = styleraised!
end type

on uo_7.destroy
call u_progressbar::destroy
end on

event constructor;call super::constructor;//====================================================================
// Event: uo_7.constructor()
//--------------------------------------------------------------------
// Description:	Initializes the Progress Bar.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================



of_SetFillStyle(LEFTRIGHT)
of_SetDisplayStyle(Position)
of_SetStep(2)
of_SetFillColor(RGB(255,0,0))
of_SetFontSize(12)
of_SetFontFace("Arial")
of_SetAutoReset(False)

end event

type uo_6 from u_progressbar within w_main
event destroy ( )
integer x = 416
integer y = 664
integer width = 219
integer height = 1048
integer taborder = 60
boolean border = true
long backcolor = 77571519
borderstyle borderstyle = stylelowered!
end type

on uo_6.destroy
call u_progressbar::destroy
end on

event constructor;call super::constructor;//====================================================================
// Event: uo_6.constructor()
//--------------------------------------------------------------------
// Description:	Initializes the Progress Bar.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


of_SetFillStyle(BOTTOMUP)
of_SetDisplayStyle(PCTCOMPLETE)
of_SetStep(4)
of_SetMaximum(100)
of_SetMinimum(0)
of_SetTextColor(RGB(255,255,255))
of_SetFillColor(RGB(0,0,128))
of_SetFontBold(True)
of_SetFontItalic(True)
of_SetFontUnderline(True)
of_SetFontSize(12)
of_SetAutoReset(False)

end event

type uo_5 from u_progressbar within w_main
event destroy ( )
integer x = 69
integer y = 664
integer width = 219
integer height = 1048
integer taborder = 50
boolean border = true
long backcolor = 77571519
end type

on uo_5.destroy
call u_progressbar::destroy
end on

event constructor;call super::constructor;//====================================================================
// Event: uo_5.constructor()
//--------------------------------------------------------------------
// Description: Initializes the Progress Bar.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

of_SetFillStyle(TOPDOWN)
of_SetDisplayStyle(BAR)
of_SetTextColor(RGB(255,255,0))
of_SetFillColor(RGB(0,128,0))
of_SetFontBold(True)
of_SetFontSize(12)
of_SetAutoReset(False)


end event

type st_4 from statictext within w_main
integer x = 1362
integer y = 468
integer width = 375
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
boolean focusrectangle = false
end type

type uo_4 from u_progressbar within w_main
event destroy ( )
string tag = "uo_4"
integer x = 37
integer y = 452
integer width = 1289
integer height = 84
integer taborder = 40
boolean border = true
long backcolor = 77571519
borderstyle borderstyle = styleshadowbox!
end type

on uo_4.destroy
call u_progressbar::destroy
end on

event constructor;call super::constructor;//====================================================================
// Event: uo_4.constructor()
//--------------------------------------------------------------------
// Description:	Initializes the Progress Bar.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String	ls_messages[]

of_SetFillStyle(LEFTRIGHT)
of_SetDisplayStyle(MSGTEXT)

ls_messages[1] = "Inspecting Application Dependencies..."
ls_messages[2] = "Opening File..."
ls_messages[3] = "Parsing Data..."
ls_messages[4] = "Deleting..."
ls_messages[5] = "Inserting..."
of_SetMessageText(ls_messages)
of_SetStep(1)
of_SetMaximum(100)
of_SetMinimum(0)
of_SetTextColor(RGB(255,255,255))
of_SetFontBold(True)
of_SetAutoReset(False)
of_SetFontSize(10)

end event

type st_3 from statictext within w_main
integer x = 1362
integer y = 348
integer width = 375
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
boolean focusrectangle = false
end type

type uo_3 from u_progressbar within w_main
event destroy ( )
integer x = 37
integer y = 332
integer width = 1289
integer height = 84
integer taborder = 30
boolean border = true
long backcolor = 77571519
end type

on uo_3.destroy
call u_progressbar::destroy
end on

event constructor;call super::constructor;//====================================================================
// Event: uo_3.constructor()
//--------------------------------------------------------------------
// Description:	Initializes the Progress Bar.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


of_SetFillStyle(TOPDOWN)
of_SetDisplayStyle(Position)
of_SetStep(2)
of_SetFillColor(RGB(255,255,0))
of_SetTextColor(RGB(128,0,0))
of_SetFontBold(True)
of_SetFontItalic(True)
of_SetFontSize(12)
of_SetAutoReset(False)

end event

type st_2 from statictext within w_main
integer x = 1362
integer y = 228
integer width = 375
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
boolean focusrectangle = false
end type

type uo_2 from u_progressbar within w_main
event destroy ( )
integer x = 37
integer y = 212
integer width = 1289
integer height = 84
integer taborder = 20
boolean border = true
long backcolor = 77571519
borderstyle borderstyle = styleraised!
end type

on uo_2.destroy
call u_progressbar::destroy
end on

event constructor;call super::constructor;//====================================================================
// Event: uo_2.constructor()
//--------------------------------------------------------------------
// Description:	Initializes the Progress Bar.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


of_SetFillStyle(BOTTOMUP)
of_SetDisplayStyle(PCTCOMPLETE)
of_SetFillColor(RGB(0,128,0))
of_SetStep(5)
of_SetMaximum(100)
of_SetMinimum(0)
of_SetFontBold(True)
of_SetFontSize(10)
of_SetAutoReset(False)


end event

type st_1 from statictext within w_main
integer x = 1362
integer y = 108
integer width = 375
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
boolean focusrectangle = false
end type

type uo_1 from u_progressbar within w_main
event destroy ( )
integer x = 37
integer y = 92
integer width = 1289
integer height = 84
integer taborder = 10
boolean border = true
long backcolor = 77571519
borderstyle borderstyle = stylelowered!
end type

on uo_1.destroy
call u_progressbar::destroy
end on

event constructor;call super::constructor;//====================================================================
// Event: uo_1.constructor()
//--------------------------------------------------------------------
// Description:	Initializes the Progress Bar.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

of_SetFillStyle(RIGHTLEFT)
of_SetDisplayStyle(MSGTEXT)
of_SetMessageText({"Right mouse on any PBar to change properties..."})
of_SetFontSize(8)
of_SetFillColor(RGB(255,0,0))
of_SetFontBold(true)
of_SetAutoReset(false)


end event

type cb_start from commandbutton within w_main
integer x = 1426
integer y = 1396
integer width = 352
integer height = 92
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Start"
boolean default = true
end type

event clicked;Parent.Event ue_startprocess()

end event

type cb_close from commandbutton within w_main
integer x = 1426
integer y = 1620
integer width = 361
integer height = 88
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
boolean cancel = true
end type

event clicked;
If ib_started = True Then
	ib_closed = True
Else
	Close(Parent)
End If

end event

