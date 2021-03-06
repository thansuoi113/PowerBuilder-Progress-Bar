$PBExportHeader$uo_progressbar.sru
forward
global type uo_progressbar from userobject
end type
type dw_progress from datawindow within uo_progressbar
end type
end forward

global type uo_progressbar from userobject
integer width = 1170
integer height = 72
long backcolor = 74481808
long tabbackcolor = 74481808
dw_progress dw_progress
end type
global uo_progressbar uo_progressbar

type variables
Public:
// display style
Constant Integer BAR = 0
Constant Integer PCTCOMPLETE = 1
Constant Integer Position = 2
Constant Integer MSGTEXT = 3

// fill style
Constant Integer LEFTRIGHT = 0
Constant Integer RIGHTLEFT = 1
Constant Integer TOPDOWN = 2
Constant Integer BOTTOMUP = 3

Protected:
Boolean	ib_autoreset = True
Integer	ii_displaystyle = BAR //0=just the bar/1=% complete/2=#complete/3=text from settext
Integer	ii_fillstyle = LEFTRIGHT //topdown = 2/bottomup=3/leftright=0/rightleft=1
Integer	ii_maximum = 100
Integer	ii_minimum = 0
Integer	ii_step = 10
Integer	ii_percentcomplete
Integer	ii_position
Integer	ii_msgtextcount
Long	il_fillcolor = 16668075 // blue
Long	il_textcolor = 0 // black
Long	il_backcolor = 78682240 // buttonface

String	is_msgtext[]





end variables

forward prototypes
public function integer of_getdisplaystyle ()
public function integer of_getmaximum ()
public function integer of_getminimum ()
public function integer of_getposition ()
public function integer of_getstep ()
public function long of_getfillcolor ()
public function integer of_setposition (integer ai_position)
public function string of_setfontbold (boolean ab_bold)
public function string of_setfontitalic (boolean ab_italic)
public function string of_setfontunderline (boolean ab_underline)
public function string of_setfontface (string as_fontface)
public function string of_setfontfamily (fontfamily aff_fontfamily)
public function string of_setfontpitch (fontpitch afp_fontpitch)
public function integer of_setmaximum (integer ai_maximum)
public function integer of_setminimum (integer ai_minimum)
public function integer of_setstep (integer ai_step)
public function integer of_setfillcolor (long al_fillcolor)
public function integer of_setfillstyle (integer ai_fillstyle)
public function integer of_getfillstyle ()
public function integer of_reset ()
public function integer of_setdisplaystyle (integer ai_displaystyle)
public function string of_getcurrenttext ()
public function integer of_increment (integer ai_inc)
public function integer of_increment ()
protected function integer of_updatevisuals (decimal adc_completion)
public function string of_setfontsize (integer ai_fontsize)
protected function string of_setfont (string as_fontface, integer ai_fontsize, integer ai_fontcharset, fontfamily aff_fontfamily, fontpitch afp_fontpitch, boolean ab_bold, boolean ab_italic, boolean ab_underline)
public function string of_setfontcharset (integer ai_fontcharset)
public function integer of_setautoreset (boolean ab_switch)
public function boolean of_isautoreset ()
public function integer of_setmessagetext (string as_msgtext[])
public function integer of_settextcolor (long al_textcolor)
public function long of_gettextcolor ()
public function long of_getbackcolor ()
public function integer of_setbackcolor (long al_backcolor)
public function integer of_getmessagetext (ref string as_messagetext[])
public function integer of_getpctcomplete ()
public function integer of_getinfo (ref nvo_infoattrib anv_infoattrib)
end prototypes

public function integer of_getdisplaystyle ();//====================================================================
// Function: uo_progressbar.of_getdisplaystyle()
//--------------------------------------------------------------------
// Description: Returns the display style of the progress bar
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//	 	the display style of the progress bar
//		0=just the bar
//		1=% complete
//		2=position
//		3=text from settext
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Return ii_displaystyle

end function

public function integer of_getmaximum ();//====================================================================
// Function: uo_progressbar.of_getmaximum()
//--------------------------------------------------------------------
// Description: Returns the maximum value the progress bar will increment to
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer  the maximum value the progress bar will increment to
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Return ii_maximum

end function

public function integer of_getminimum ();//====================================================================
// Function: uo_progressbar.of_getminimum()
//--------------------------------------------------------------------
// Description:	Return the minumum value progress bar will start from
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer	 the minimum value the progress bar starts from
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Return ii_minimum

end function

public function integer of_getposition ();//====================================================================
// Function: uo_progressbar.of_getposition()
//--------------------------------------------------------------------
// Description:	Returns the currently incremented position of the progress bar
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer	the incremented position of the progress bar (between minimum and maximum)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Return ii_position

end function

public function integer of_getstep ();//====================================================================
// Function: uo_progressbar.of_getstep()
//--------------------------------------------------------------------
// Description:	Returns the step value to use during a default increment process
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer	the step value of the increment if default value is to be used
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Return ii_step

end function

public function long of_getfillcolor ();//====================================================================
// Function: uo_progressbar.of_getfillcolor()
//--------------------------------------------------------------------
// Description: Returns the color the progress bar fills up with.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long the color the progressbar will fill with
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Return il_fillcolor

end function

public function integer of_setposition (integer ai_position);//====================================================================
// Function: uo_progressbar.of_setposition()
//--------------------------------------------------------------------
// Description:	Sets the current position of the progress bar
//--------------------------------------------------------------------
// Arguments:
// 	integer	ai_position		the position the progress bar 
//--------------------------------------------------------------------
// Returns:  integer	SUCCESS = the current position of the progress bar 	ERROR = -1
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Decimal	ldc_completion
Integer	li_rc

If IsNull(ai_position) Then
	Return -1
End If

// If this is less than the minimum, the current position is set to the minimum
If ai_position < ii_minimum Then
	ai_position = ii_minimum
End If

// If this is greater than the maximum, the current position is set to the maximum
If ai_position > ii_maximum Then
	ai_position = ii_maximum
End If

ii_position = ai_position

dw_progress.SetRedraw(False)

// if maximum value is zero we are completed (prevents divide by zero)
// or if completion result will be greater than 1 then make it 1
// otherwise find our completion percentage
If (ii_maximum = 0) Or (ii_position > ii_maximum) Then
	ldc_completion = 1
Else
	// turn on the progress rectangle and percentage text if style uses it
	dw_progress.Object.pct.Visible = 1
	dw_progress.Object.progress_rect.Visible = 1
	ldc_completion = ii_position / ii_maximum
	ii_percentcomplete = ldc_completion * 100
End If

li_rc = of_updatevisuals(ldc_completion)

dw_progress.SetRedraw(True)

// turn off progressbar after it reaches 100%
If ldc_completion >= 1 And ib_autoreset Then
	This.Post Function of_reset()
End If

If li_rc < 0 Then
	Return li_rc
Else
	Return ii_position
End If

end function

public function string of_setfontbold (boolean ab_bold);//====================================================================
// Function: uo_progressbar.of_setfontbold()
//--------------------------------------------------------------------
// Description:	Sets the progress bar text attribute to bold/not bold
//--------------------------------------------------------------------
// Arguments:
// 	boolean	ab_bold		true if progress bar text should be bold
//--------------------------------------------------------------------
// Returns:  string	The output of the Modify command (the error text or "") 
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================



String		ls_fontface
Integer		li_fontsize, li_fontcharset
FontFamily	lff_fontfamily
FontPitch	lfp_fontpitch
Boolean		lb_bold, lb_italic, lb_underline

SetNull(ls_fontface)
SetNull(li_fontsize)
SetNull(li_fontcharset)
SetNull(lff_fontfamily)
SetNull(lfp_fontpitch)
SetNull(lb_bold)
SetNull(lb_italic)
SetNull(lb_underline)

Return of_setfont(ls_fontface, li_fontsize, li_fontcharset, lff_fontfamily, lfp_fontpitch, ab_bold, lb_italic, lb_underline)


end function

public function string of_setfontitalic (boolean ab_italic);//====================================================================
// Function: uo_progressbar.of_setfontitalic()
//--------------------------------------------------------------------
// Description:	Sets the progress bar text attribute to italic/not italic
//--------------------------------------------------------------------
// Arguments:
// 	boolean	ab_italic		true if progress bar text should be italic
//--------------------------------------------------------------------
// Returns:  string	The output of the Modify command (the error text or "") 
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String		ls_fontface
Integer		li_fontsize, li_fontcharset
FontFamily	lff_fontfamily
FontPitch	lfp_fontpitch
Boolean		lb_bold, lb_italic, lb_underline

SetNull(ls_fontface)
SetNull(li_fontsize)
SetNull(li_fontcharset)
SetNull(lff_fontfamily)
SetNull(lfp_fontpitch)
SetNull(lb_bold)
SetNull(lb_italic)
SetNull(lb_underline)

Return of_setfont(ls_fontface, li_fontsize, li_fontcharset, lff_fontfamily, lfp_fontpitch, lb_bold, &
	ab_italic, lb_underline)


end function

public function string of_setfontunderline (boolean ab_underline);//====================================================================
// Function: uo_progressbar.of_setfontunderline()
//--------------------------------------------------------------------
// Description:	Sets the progress bar text attribute to underline/not underline
//--------------------------------------------------------------------
// Arguments:
// 	boolean	ab_underline	true if progress bar text should be underlined
//--------------------------------------------------------------------
// Returns:  string	The output of the Modify command (the error text or "") 
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String		ls_fontface
Integer		li_fontsize, li_fontcharset
FontFamily	lff_fontfamily
FontPitch	lfp_fontpitch
Boolean		lb_bold, lb_italic, lb_underline

SetNull(ls_fontface)
SetNull(li_fontsize)
SetNull(li_fontcharset)
SetNull(lff_fontfamily)
SetNull(lfp_fontpitch)
SetNull(lb_bold)
SetNull(lb_italic)
SetNull(lb_underline)

Return of_setfont(ls_fontface, li_fontsize, li_fontcharset, lff_fontfamily, lfp_fontpitch, lb_bold, lb_italic, ab_underline)


end function

public function string of_setfontface (string as_fontface);//====================================================================
// Function: uo_progressbar.of_setfontface()
//--------------------------------------------------------------------
// Description:	Sets the progress bar font face
//--------------------------------------------------------------------
// Arguments:
// 	string	as_fontface	Sets the font face of the progress bar text (eg "Arial")
//--------------------------------------------------------------------
// Returns:  string	The output of the Modify command (the error text or "") 
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String		ls_fontface
Integer		li_fontsize, li_fontcharset
FontFamily	lff_fontfamily
FontPitch	lfp_fontpitch
Boolean		lb_bold, lb_italic, lb_underline

SetNull(ls_fontface)
SetNull(li_fontsize)
SetNull(li_fontcharset)
SetNull(lff_fontfamily)
SetNull(lfp_fontpitch)
SetNull(lb_bold)
SetNull(lb_italic)
SetNull(lb_underline)

Return of_setfont(as_fontface, li_fontsize, li_fontcharset, lff_fontfamily, lfp_fontpitch, lb_bold, lb_italic, lb_underline)


end function

public function string of_setfontfamily (fontfamily aff_fontfamily);//====================================================================
// Function: uo_progressbar.of_setfontfamily()
//--------------------------------------------------------------------
// Description:	Sets the font family progress bar text attribute
//--------------------------------------------------------------------
// Arguments:
// 	fontfamily	aff_fontfamily		enumerated fontfamily datatype representation Family font belongs to (eg roman!)
//--------------------------------------------------------------------
// Returns:  string	The output of the Modify command (the error text or "") 
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String		ls_fontface
Integer		li_fontsize, li_fontcharset
FontFamily	lff_fontfamily
FontPitch	lfp_fontpitch
Boolean		lb_bold, lb_italic, lb_underline

SetNull(ls_fontface)
SetNull(li_fontsize)
SetNull(li_fontcharset)
SetNull(lff_fontfamily)
SetNull(lfp_fontpitch)
SetNull(lb_bold)
SetNull(lb_italic)
SetNull(lb_underline)

Return of_setfont(ls_fontface, li_fontsize, li_fontcharset, aff_fontfamily, lfp_fontpitch, lb_bold, lb_italic, lb_underline)


end function

public function string of_setfontpitch (fontpitch afp_fontpitch);//====================================================================
// Function: uo_progressbar.of_setfontpitch()
//--------------------------------------------------------------------
// Description:	Sets the progress bar font pitch text attribute
//--------------------------------------------------------------------
// Arguments:
// 	fontpitch	afp_fontpitch		enumerated datatype font should be (fixed!)
//--------------------------------------------------------------------
// Returns:  string	The output of the Modify command (the error text or "") 
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String		ls_fontface
Integer		li_fontsize, li_fontcharset
FontFamily	lff_fontfamily
FontPitch	lfp_fontpitch
Boolean		lb_bold, lb_italic, lb_underline

SetNull(ls_fontface)
SetNull(li_fontsize)
SetNull(li_fontcharset)
SetNull(lff_fontfamily)
SetNull(lfp_fontpitch)
SetNull(lb_bold)
SetNull(lb_italic)
SetNull(lb_underline)

Return of_setfont(ls_fontface, li_fontsize, li_fontcharset, lff_fontfamily, afp_fontpitch, lb_bold, lb_italic, lb_underline)


end function

public function integer of_setmaximum (integer ai_maximum);//====================================================================
// Function: uo_progressbar.of_setmaximum()
//--------------------------------------------------------------------
// Description:	Sets the maximum value the progress bar will increment to
//--------------------------------------------------------------------
// Arguments:
// 	integer	ai_maximum	the maximum value the progress bar will increment to
//--------------------------------------------------------------------
// Returns:  integer	SUCCESS = 1		ERROR = -1
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


If IsNull(ai_maximum) Or (ai_maximum <= 0) Then
	Return -1
End If

ii_maximum = ai_maximum

Return 1

end function

public function integer of_setminimum (integer ai_minimum);//====================================================================
// Function: uo_progressbar.of_setminimum()
//--------------------------------------------------------------------
// Description:	Sets the minimum value the progress bar will start from
//--------------------------------------------------------------------
// Arguments:
// 	integer	ai_minimum	the minimum value the progress bar will start from
//--------------------------------------------------------------------
// Returns:  integer	SUCCESS = 1			ERROR = -1
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


If IsNull(ai_minimum) Or (ai_minimum < 0) Then
	Return -1
End If

ii_minimum = ai_minimum

Return 1

end function

public function integer of_setstep (integer ai_step);//====================================================================
// Function: uo_progressbar.of_setstep()
//--------------------------------------------------------------------
// Description:	Sets the step value the progress bar will increment by
//--------------------------------------------------------------------
// Arguments:
// 	integer	ai_step	the step value the progress bar will increment by
//--------------------------------------------------------------------
// Returns:  integer	SUCCESS = 1		ERROR = -1
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

If IsNull(ai_step) Or (ai_step <= 0) Then
	Return -1
End If

ii_step = ai_step

Return 1

end function

public function integer of_setfillcolor (long al_fillcolor);//====================================================================
// Function: uo_progressbar.of_setfillcolor()
//--------------------------------------------------------------------
// Description:	Set the color the progress bar will fill with
//--------------------------------------------------------------------
// Arguments:
// 	long	al_fillcolor	color the progress bar will fill with
//--------------------------------------------------------------------
// Returns:  integer	SUCCESS = 1		ERROR = -1
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String	ls_modify, ls_return

If IsNull(al_fillcolor) Then
	Return -1
End If

il_fillcolor = al_fillcolor

ls_modify = "progress_rect.brush.color='" + String(al_fillcolor) + "'"
ls_return = dw_progress.Modify(ls_modify)

If ls_return <> "" Then
	Return -1
End If

Return 1

end function

public function integer of_setfillstyle (integer ai_fillstyle);//====================================================================
// Function: uo_progressbar.of_setfillstyle()
//--------------------------------------------------------------------
// Description:	Set the fill style of the progress bar
//		0 = LEFTRIGHT
//		1 = RIGHTLEFT
//		2 = TOPDOWN
//		3 = BOTTOMUP
//--------------------------------------------------------------------
// Arguments:
// 	integer	ai_fillstyle	 the fill style of the progressbar
//--------------------------------------------------------------------
// Returns:  integer	SUCCESS = 1		ERROR = -1
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


If IsNull(ai_fillstyle) Then
	Return -1
End If

If Not ((ai_fillstyle = TOPDOWN) Or (ai_fillstyle = BOTTOMUP) Or &
	(ai_fillstyle = LEFTRIGHT) Or (ai_fillstyle = RIGHTLEFT)) Then
	Return -1
End If

ii_fillstyle = ai_fillstyle

Return 1


end function

public function integer of_getfillstyle ();//====================================================================
// Function: uo_progressbar.of_getfillstyle()
//--------------------------------------------------------------------
// Description: Returns the fill style of the progress bar
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//	 	the fill style of the progress bar
//		0 = LEFTRIGHT
//		1 = RIGHTLEFT
//		2 = TOPDOWN
//		3 = BOTTOMUP
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Return ii_fillstyle

end function

public function integer of_reset ();//====================================================================
// Function: uo_progressbar.of_reset()
//--------------------------------------------------------------------
// Description: 	Reset the progress bar.  
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer	SUCCESS = 1 	ERROR = -1
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


dw_progress.SetRedraw(False)

// turn the visible properties of the progress bar off
dw_progress.Object.progress_rect.Visible = 0
dw_progress.Object.pct.Visible = 0

dw_progress.SetRedraw(True)

// reset the position of the progress bar
ii_position = ii_minimum
ii_percentcomplete = 0
dw_progress.Object.pct[1] = ""

Return 1

end function

public function integer of_setdisplaystyle (integer ai_displaystyle);//====================================================================
// Function: uo_progressbar.of_setdisplaystyle()
//--------------------------------------------------------------------
// Description:	Set the display style of the progress bar,  0=just the bar,	1=% complete,	2=position	, 3=text from settext
//--------------------------------------------------------------------
// Arguments:
// 	integer	ai_displaystyle	display style of the progressbar
//--------------------------------------------------------------------
// Returns:  integer		SUCCESS = 1		ERROR = -1
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

If IsNull(ai_displaystyle) Then
	Return -1
End If

If Not ((ai_displaystyle = BAR) Or (ai_displaystyle = PCTCOMPLETE) Or &
	(ai_displaystyle = Position) Or (ai_displaystyle = MSGTEXT)) Then
	Return -1
End If

ii_displaystyle = ai_displaystyle

Return 1

end function

public function string of_getcurrenttext ();//====================================================================
// Function: uo_progressbar.of_getcurrenttext()
//--------------------------------------------------------------------
// Description: returns the current text on the progress bar
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  string the current text on the progress bar
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String	ls_msgtext

ls_msgtext = dw_progress.Object.pct[1]

Return ls_msgtext

end function

public function integer of_increment (integer ai_inc);//====================================================================
// Function: uo_progressbar.of_increment()
//--------------------------------------------------------------------
// Description:	Increments the progress bar by ai_inc
//--------------------------------------------------------------------
// Arguments:
// 	integer	ai_inc	value to increment the progress bar
//--------------------------------------------------------------------
// Returns:  integer	the new position of the progress bar
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Integer	li_completion

If (ai_inc <= 0) Or IsNull(ai_inc) Then
	Return -1
End If

// increment the position i = i+inc
ii_position += ai_inc

// display the change on the progress bar
Return of_setposition(ii_position)


end function

public function integer of_increment ();//====================================================================
// Function: uo_progressbar.of_increment()
//--------------------------------------------------------------------
// Description:	Increments the progress bar by the default step value
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer	the new position of the progress bar
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Return of_increment(ii_step)

end function

protected function integer of_updatevisuals (decimal adc_completion);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_UpdateVisuals
//
//	Access:		protected
//
//	Arguments:	decimal
//	adc_completion	the completion value of the progress bar
//
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Resizes the progressbar to the completion size and sets the display text
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

long	ll_index, ll_width, ll_height

if isnull(adc_completion) or (adc_completion < 0) then
	return -1
end if

ll_width = this.width
ll_height = this.height

CHOOSE Case ii_fillstyle
	Case RIGHTLEFT
		// horizontal movement from right to left
		dw_progress.object.progress_rect.x = ll_width - integer(adc_completion * ll_width)
		dw_progress.object.progress_rect.width = integer(adc_completion * ll_width)
	Case LEFTRIGHT
		// horizontal movement from left to right
		dw_progress.object.progress_rect.width = integer(adc_completion * ll_width)
	Case TOPDOWN
		// vertical movement from top to bottom
		dw_progress.object.progress_rect.height = integer(adc_completion * ll_height)
	Case BOTTOMUP
		// vertical movement from bottom to top
		dw_progress.object.progress_rect.y = ll_height - integer(adc_completion * ll_height)
		dw_progress.object.progress_rect.height = integer(adc_completion * ll_height)
END CHOOSE

// Set percentages on screen
CHOOSE CASE ii_displaystyle
	CASE BAR
		dw_progress.object.pct.visible = 0
		dw_progress.object.pct[1] = ""
	CASE PCTCOMPLETE
		dw_progress.object.pct[1] = string(adc_completion, "#%")
	CASE POSITION
		dw_progress.object.pct[1] = string(ii_position, "#")
	CASE MSGTEXT
		if ii_msgtextcount > 0 then
			for ll_index = 1 to ii_msgtextcount
				if (adc_completion <= (ll_index / ii_msgtextcount)) then
					dw_progress.object.pct[1] = is_msgtext[ll_index]
					exit
				end if
			end for
		else
			dw_progress.object.pct[1] = "??"
		end if
	CASE ELSE
		dw_progress.object.pct.visible = 0
END CHOOSE

return 1
end function

public function string of_setfontsize (integer ai_fontsize);//====================================================================
// Function: uo_progressbar.of_setfontsize()
//--------------------------------------------------------------------
// Description:	Sets the progress bar text font size
//--------------------------------------------------------------------
// Arguments:
// 	integer	ai_fontsize		size the progress bar text should display in
//--------------------------------------------------------------------
// Returns:  string	The output of the Modify command (the error text or "") 
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String		ls_fontface
Integer		li_fontsize, li_fontcharset
FontFamily	lff_fontfamily
FontPitch	lfp_fontpitch
Boolean		lb_bold, lb_italic, lb_underline

SetNull(ls_fontface)
SetNull(li_fontsize)
SetNull(li_fontcharset)
SetNull(lff_fontfamily)
SetNull(lfp_fontpitch)
SetNull(lb_bold)
SetNull(lb_italic)
SetNull(lb_underline)

Return of_setfont(ls_fontface, ai_fontsize, li_fontcharset, lff_fontfamily, lfp_fontpitch, lb_bold, lb_italic, lb_underline)


end function

protected function string of_setfont (string as_fontface, integer ai_fontsize, integer ai_fontcharset, fontfamily aff_fontfamily, fontpitch afp_fontpitch, boolean ab_bold, boolean ab_italic, boolean ab_underline);//====================================================================
// Function: uo_progressbar.of_setfont()
//--------------------------------------------------------------------
// Description:	Change the font of an object in the datawindow.
//--------------------------------------------------------------------
// Arguments:
// 	string    	as_fontface   	The font to use (i.e. "MS Sans Serif")
// 	integer   	ai_fontsize   		The point size of the font.
// 	integer   	ai_fontcharset	The Character set to use for the Font  (0 - ANSI)
// 	fontfamily	aff_fontfamily		The font family (AnyFont!, Roman!, Swiss!, Modern!, Script!, Decorative!)
// 	fontpitch 	afp_fontpitch 	The pitch of the font (Default!, Fixed!, Variable!)
// 	boolean   	ab_bold       		True - Bold, False - Normal.
// 	boolean   	ab_italic     		True - Yes, False - No.
// 	boolean   	ab_underline  	True - Yes, False - No.
//--------------------------------------------------------------------
// Returns:  string		The output of the Modify command (the error text or "") 
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String			ls_FontFace, ls_Modify, ls_Objects[], ls_Undo, ls_FontSize, &
	ls_FontFamily, ls_OldFamily, ls_FontPitch, ls_OldPitch, ls_FontWeight, &
	ls_OldWeight, ls_Italic, ls_OldItalic, ls_Underline, ls_OldUnderline, &
	ls_FontCharSet, ls_name, ls_Return
Integer			li_NumObjects, li_Count, li_Undo

// Determine the DataWindow Modify parameters
Choose Case aff_FontFamily
	Case AnyFont!
		ls_FontFamily = "0"
	Case Roman!
		ls_FontFamily = "1"
	Case Swiss!
		ls_FontFamily = "2"
	Case Modern!
		ls_FontFamily = "3"
	Case Script!
		ls_FontFamily = "4"
	Case Decorative!
		ls_FontFamily = "5"
End Choose

Choose Case afp_FontPitch
	Case Default!
		ls_FontPitch = "0"
	Case Fixed!
		ls_FontPitch = "1"
	Case Variable!
		ls_FontPitch = "2"
End Choose

If ab_Bold Then
	ls_FontWeight = "700"
Else
	ls_FontWeight = "400"
End If

If ab_Italic Then
	ls_Italic = "1"
Else
	ls_Italic = "0"
End If

If ab_Underline Then
	ls_Underline = "1"
Else
	ls_Underline = "0"
End If

// Change font size
ls_FontSize = dw_progress.Object.pct.Font.Height
If Not IsNull(ai_FontSize) And ai_FontSize <> Integer(ls_FontSize) Then
	ls_Modify = " pct.Font.Height='-" + String(ai_FontSize) + "'"
End If

// Change font CharSet
ls_FontCharSet = dw_progress.Object.pct.Font.CharSet
If Not IsNull(ai_FontCharSet) And ai_FontCharSet <> Integer(ls_FontCharSet) Then
	ls_Modify = " pct.Font.CharSet='" + String(ai_FontCharSet) + "'"
End If

// Change font face
If Not IsNull(as_FontFace) Then
	ls_FontFace = dw_progress.Object.pct.Font.Face
	If as_FontFace <> ls_FontFace Then
		ls_Modify =  ls_Modify + " pct.Font.Face='" + as_FontFace + "'"
	End If
End If

// Change font family
If Not IsNull(aff_FontFamily) Then
	ls_OldFamily = dw_progress.Object.pct.Font.Family
	If ls_FontFamily <> ls_OldFamily Then
		ls_Modify =  ls_Modify + " pct.Font.Family='" + ls_FontFamily + "'"
	End If
End If

// Change font pitch
If Not IsNull(afp_FontPitch) Then
	ls_OldPitch = dw_progress.Object.pct.Font.Pitch
	If ls_FontPitch <> ls_OldPitch Then
		ls_Modify =  ls_Modify + " pct.Font.Pitch='" + ls_FontPitch + "'"
	End If
End If

// Change font weight
If Not IsNull(ab_Bold) Then
	ls_OldWeight = dw_progress.Object.pct.Font.Weight
	If ls_FontWeight <> ls_OldWeight Then
		ls_Modify = ls_Modify + " pct.Font.Weight='" + ls_FontWeight + "'"
	End If
End If

// Change italic
If Not IsNull(ab_Italic) Then
	If dw_progress.Object.pct.Font.Italic <> "1" Then
		ls_OldItalic = "0"
	Else
		ls_OldItalic = "1"
	End If
	If ls_Italic <> ls_OldItalic Then
		ls_Modify = ls_Modify + " pct.Font.Italic='" + ls_Italic + "'"
	End If
End If

// Change underline
If Not IsNull(ab_Underline) Then
	If dw_progress.Object.pct.Font.Underline <> "1" Then
		ls_OldUnderline = "0"
	Else
		ls_OldUnderline = "1"
	End If
	If ls_Underline <> ls_OldUnderline Then
		ls_Modify = ls_Modify + " pct.Font.Underline='" + ls_Underline + "'"
	End If
End If

ls_Return = dw_progress.Modify(ls_Modify)

Return ls_Return


end function

public function string of_setfontcharset (integer ai_fontcharset);//====================================================================
// Function: uo_progressbar.of_setfontcharset()
//--------------------------------------------------------------------
// Description:	Sets the progress bar text font character set
//--------------------------------------------------------------------
// Arguments:
// 	integer	ai_fontcharset	The Character Set The Font Uses on the Progress Bar
//--------------------------------------------------------------------
// Returns:  string	The output of the Modify command (the error text or "") 
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String		ls_fontface
Integer		li_fontsize, li_fontcharset
FontFamily	lff_fontfamily
FontPitch	lfp_fontpitch
Boolean		lb_bold, lb_italic, lb_underline

SetNull(ls_fontface)
SetNull(li_fontsize)
SetNull(li_fontcharset)
SetNull(lff_fontfamily)
SetNull(lfp_fontpitch)
SetNull(lb_bold)
SetNull(lb_italic)
SetNull(lb_underline)

Return of_setfont(ls_fontface, li_fontsize, ai_fontcharset, lff_fontfamily, lfp_fontpitch, lb_bold, lb_italic, lb_underline)


end function

public function integer of_setautoreset (boolean ab_switch);//====================================================================
// Function: uo_progressbar.of_setautoreset()
//--------------------------------------------------------------------
// Description:	Sets the flag to reset the progress bar when it reaches 100%
//--------------------------------------------------------------------
// Arguments:
// 	boolean	ab_switch	True to Reset the progress bar, false to leave it visible
//--------------------------------------------------------------------
// Returns:  integer	SUCCESS = 1		ERROR = -1
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

If IsNull(ab_switch)  Then
	Return -1
End If

ib_autoreset = ab_switch

Return 1

end function

public function boolean of_isautoreset ();//====================================================================
// Function: uo_progressbar.of_isautoreset()
//--------------------------------------------------------------------
// Description:	return the flag to reset the progress bar when it reaches 100%
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  boolean	True = clear the progress bar	. False = Don't clear the progress bar
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Return ib_autoreset

end function

public function integer of_setmessagetext (string as_msgtext[]);//====================================================================
// Function: uo_progressbar.of_setmessagetext()
//--------------------------------------------------------------------
// Description:	Sets the text array which is shown on the progress bar
//--------------------------------------------------------------------
// Arguments:
// 	string	as_msgtext[]		the text array to show on the progress bar separated by as_delimiter
//--------------------------------------------------------------------
// Returns:  integer	the number of elements in the text which is parsed -1 = error
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


If IsNull(as_msgtext) Then
	Return -1
End If

// pass in array of messagetext and return # of elements
is_msgtext = as_msgtext
ii_msgtextcount = UpperBound(is_msgtext)

Return ii_msgtextcount

end function

public function integer of_settextcolor (long al_textcolor);//====================================================================
// Function: uo_progressbar.of_settextcolor()
//--------------------------------------------------------------------
// Description:	Set the color the progress bar text
//--------------------------------------------------------------------
// Arguments:
// 	long	al_textcolor	 color the progress bar text will display
//--------------------------------------------------------------------
// Returns:  integer	SUCCESS = 1		ERROR = -1
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String	ls_modify, ls_return

If IsNull(al_textcolor) Or (al_textcolor < 0) Then
	Return -1
End If

il_textcolor = al_textcolor

ls_modify = "pct.color='" + String(al_textcolor) + "'"
ls_return = dw_progress.Modify(ls_modify)

If ls_return <> "" Then
	Return -1
End If

Return 1

end function

public function long of_gettextcolor ();//====================================================================
// Function: uo_progressbar.of_gettextcolor()
//--------------------------------------------------------------------
// Description:	Returns the color of the progress bar text.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long	 the color of the progress bar text
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Return il_textcolor

end function

public function long of_getbackcolor ();//====================================================================
// Function: uo_progressbar.of_getbackcolor()
//--------------------------------------------------------------------
// Description: Returns background the color of the empty progress bar.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long  the background color of the empty progress bar
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Return il_backcolor

end function

public function integer of_setbackcolor (long al_backcolor);//====================================================================
// Function: uo_progressbar.of_setbackcolor()
//--------------------------------------------------------------------
// Description:	Set the background color of the empty progress bar
//--------------------------------------------------------------------
// Arguments:
// 	long	al_backcolor		background color of the empty progress bar
//--------------------------------------------------------------------
// Returns:  integer	SUCCESS = 1		ERROR = -1
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String	ls_modify, ls_return

If IsNull(al_backcolor) Or (al_backcolor < 0) Then
	Return -1
End If

il_backcolor = al_backcolor

ls_modify = "datawindow.color='" + String(al_backcolor) + "'"
ls_return = dw_progress.Modify(ls_modify)

If ls_return <> "" Then
	Return -1
End If

Return 1

end function

public function integer of_getmessagetext (ref string as_messagetext[]);//====================================================================
// Function: uo_progressbar.of_getmessagetext()
//--------------------------------------------------------------------
// Description:	Returns the message text used for display on the progress bar
//--------------------------------------------------------------------
// Arguments:
// 	ref	string	as_messagetext[]	array to hold the message text - by reference
//--------------------------------------------------------------------
// Returns:  integer 	the number of elements in the message text array
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Integer	li_itemcount
String	ls_temp[]

// clear out the argument array
as_messagetext = ls_temp

// set the value
as_messagetext = is_msgtext

// get the number of items in the array
li_itemcount = UpperBound(as_messagetext)

Return li_itemcount


end function

public function integer of_getpctcomplete ();//====================================================================
// Function: uo_progressbar.of_getpctcomplete()
//--------------------------------------------------------------------
// Description:	Returns the visual percent complete of the progress bar
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer	 the visual percent complete of the progress bar (1-100)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Return ii_percentcomplete

end function

public function integer of_getinfo (ref nvo_infoattrib anv_infoattrib);//====================================================================
// Function: uo_progressbar.of_getinfo()
//--------------------------------------------------------------------
// Description: Gets the Object Information.
//--------------------------------------------------------------------
// Arguments:
// 	ref	nvo_infoattrib	anv_infoattrib	 he Information attributes.
//--------------------------------------------------------------------
// Returns:  integer 1 for success. 	-1 for error.
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


// Populate Information.
anv_infoattrib.is_name = 'Progress Bar'
anv_infoattrib.is_description = 'Progress Bar'

Return 1

end function

on uo_progressbar.create
this.dw_progress=create dw_progress
this.Control[]={this.dw_progress}
end on

on uo_progressbar.destroy
destroy(this.dw_progress)
end on

event constructor;
// initalize the display text
dw_progress.Object.pct[1] = ""

// expand dw to dimensions of on screen object
dw_progress.Height = This.Height
dw_progress.Width = This.Width

// make the dw header band height of on screen object
dw_progress.Object.datawindow.header.Height = This.Height

// make the progress rectangle the height and width of on screen object 
dw_progress.Object.progress_rect.Height = This.Height
dw_progress.Object.progress_rect.Width = This.Width

// center percentage text on screen object
dw_progress.Object.pct.Y = Integer((Integer(dw_progress.Object.datawindow.header.Height) / 2 ) - &
	(Integer(dw_progress.Object.pct.Height) / 2))
dw_progress.Object.pct.Width = This.Width



end event

type dw_progress from datawindow within uo_progressbar
integer width = 384
integer height = 76
string dataobject = "d_progress"
boolean border = false
end type

event rbuttondown;//====================================================================
// Event: uo_progressbar.Properties -  dw_progress  inherited  from  datawindow()
//--------------------------------------------------------------------
// Description:	Pass the button properties to the uo since this object takes up the whole uo space	
//--------------------------------------------------------------------
// Arguments:
// 	integer 	xpos	
// 	integer 	ypos	
// 	long    	row 	
// 	dwobject	dwo 	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/07/01
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

// pass right mouse button processing to the parent user object.
Parent.Event RButtonDown(2, xpos, ypos)

end event

