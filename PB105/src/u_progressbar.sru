$PBExportHeader$u_progressbar.sru
forward
global type u_progressbar from uo_progressbar
end type
end forward

global type u_progressbar from uo_progressbar
event resize pbm_size
end type
global u_progressbar u_progressbar

event resize;call super::resize;// expand dw to dimensions of on screen object
dw_progress.height = this.height
dw_progress.width = this.width

// make the dw header band height of on screen object
dw_progress.object.datawindow.header.height = this.height

// make the progress rectangle the height and width of on screen object 
dw_progress.object.progress_rect.height = this.height
dw_progress.object.progress_rect.width = this.width

// center percentage text on screen object
dw_progress.object.pct.y = integer((integer(dw_progress.object.datawindow.header.height) / 2 ) - &
												(integer(dw_progress.object.pct.height) / 2))
dw_progress.object.pct.width = this.width

end event

on u_progressbar.create
call uo_progressbar::create
end on

on u_progressbar.destroy
call uo_progressbar::destroy
end on

