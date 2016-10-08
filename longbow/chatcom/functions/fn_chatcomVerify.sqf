/*****************************************************************************
Function name: RWT_fnc_chatcomVerify;
Authors: longbow
License: MIT License
Version: 1.0

Dependencies:
        RWT_fnc_chatcomProcess

Changelog:
        === 1.0 === 09-Oct-2016
                Initial release

Description:
	Function called from event handler attached to main in-game display,
	if chat key was pressed - waits till chat display initializes and
	attaches a new event handler to it

Arguments:
	NONE

Returns:
	BOOLEAN

*****************************************************************************/
if (inputAction "Chat" > 0) then
{
    rwt_chatcom_spawn = [] spawn
    {
        waitUntil {shownChat};
        waitUntil {!isNull (finddisplay 24 displayctrl 101)};
        rwt_chatcom_chat_eh = (findDisplay 24) displayAddEventHandler["KeyDown","_this call RWT_fnc_chatcomProcess"]; 
    };
};
false;

