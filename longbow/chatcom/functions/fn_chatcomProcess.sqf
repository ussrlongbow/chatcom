/*****************************************************************************
Function name: RWT_fnc_chatcomProcess;
Authors: longbow
License: MIT License
Version: 1.0

Dependencies:
        RWT_fnc_chatcomExec

Changelog:
        === 1.0 === 09-Oct-2016
                Initial release

Description:
        Functions parses a chat message and checks if it starts with a
	special character, which is followed by chat command.
	Executed from event handler attached to chat's display

Arguments:
        ARRAY [_COM,_ARG1,..,_ARG_N]
                _COM - STRING, name of command from rwt_chatcom class
                _ARG1-_ARGN - STRING, optional arguments to command

Returns:
        BOOLEAN

*****************************************************************************/
if ((_this select 1) != 28) exitWith {false};
private _chatmsg = ctrlText (finddisplay 24 displayctrl 101);
if ((getText (getMissionConfig "rwt_chatcom" >> "specialchar")) != (_chatmsg select [0,1])) exitWith {false};
(finddisplay 24 displayctrl 101) ctrlSetText "";
closeDialog 0;
(findDisplay 24) displayRemoveEventHandler ["KeyDown", rwt_chatcom_chat_eh];
(findDisplay 24) closeDisplay 1;
(_chatmsg splitString "! ") call RWT_fnc_chatcomExec;
true;

