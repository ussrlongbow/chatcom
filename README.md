# RWT:CHATCOM - Extended chat commands for Arma 3

This script module allows to configure chat commands, entered into chat, similar to server commands starting with '#' (like #login, #kick and etc)

## Script configuration
Script configuration files are located in longbow\chatcom\settings directory.

config.hpp contains the definition of leading character, telling script to treat it as custom chat command.

commands.hpp contains the definition of commands, every command is defined as a class and should contain a text, named 'code', which will be compiled, once command is issued.

In this particular example configuration, every chat message starting with '!' would be treated as command, command name should be followed by a whitespace, everythin after it is used as command arguments (supplied to code as an array of words, delimitered by a white space)

## Script usage
in multiplayer, open chat and type in '!help' - the script will look for its clas, and will compile the code

if you type in '!stat one two three' - it will call the code for 'stat' command, supplying arguments as ["one","two","three"] in _this variable.

## Installation
Script is packaged to comply A3MS guidelines, once you have extracted the Arma 3 Mission Skeleton into your mission folder, copy the contents of this repo to 'addon' directory inside your mission's root.
After that run 'build.bat' script, shipped with A3MS.
