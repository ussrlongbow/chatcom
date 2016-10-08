/*****************************************************************************
Function name: RWT_fnc_chatcomExec;
Authors: longbow
License: MIT License
Version: 1.0

Dependencies:
	NONE

Changelog:
	=== 1.0 === 09-Oct-2016
		Initial release

Description:
	Functions executes a command, defined in rwt_chatcom class, and
        passes arguments to it.

Arguments:
	ARRAY [_COM,_ARG1,..,_ARG_N]
		_COM - STRING, name of command from rwt_chatcom class
		_ARG1-_ARGN - STRING, optional arguments to command

Returns:
	NOTHING

*****************************************************************************/

// read command name
private _com = _this select 0;
// check if supplied command is a valid command, defined in config and
// that it has 'code' property
if (!isText (getMissionConfig "rwt_chatcom" >> "commands" >> _com >> "code")) exitWith
{
    ["RWT_CHATCOM: %1", "Invalid command"] call BIS_fnc_error;
};
// store arguments for command
private _args = _this select [1,count _this];
// execute command
_args call compile getText (getMissionConfig "rwt_chatcom" >> "commands" >> _com >> "code");

