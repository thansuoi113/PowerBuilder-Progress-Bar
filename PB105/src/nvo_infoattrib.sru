$PBExportHeader$nvo_infoattrib.sru
forward
global type nvo_infoattrib from nonvisualobject
end type
end forward

global type nvo_infoattrib from nonvisualobject autoinstantiate
end type

type variables
String	is_name
String	is_description


end variables
on nvo_infoattrib.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_infoattrib.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

