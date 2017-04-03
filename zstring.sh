#!/usr/bin/env bash
#
# zstring.sh - provides shortcuts for advanced string operations in zsh
#
# Copyright (c) 2017 by Christian Rebischke <chris.rebischke@archlinux.org>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http: #www.gnu.org/licenses/
#
#======================================================================
# Author: Christian Rebischke
# Email : chris.rebischke@archlinux.org
# Github: www.github.com/Shibumi
#
#
#
# vim:set et sw=4 ts=4 tw=72:
#

surroundSingleQuotes() {
    # surrounds the word under the cursor with single quotes
    LBUFFER=`echo $LBUFFER | sed "s/\(.*\) /\1 '/"`
    RBUFFER=`echo $RBUFFER | sed "s/\($\| \)/' /"`
    zle redisplay
}
zle -N surroundSingleQuotes
bindkey "^['" surroundSingleQuotes

surroundDoubleQuotes() {
    # surrounds the word under the cursor with double quotes
    LBUFFER=`echo $LBUFFER | sed 's/\(.*\) /\1 "/'`
    RBUFFER=`echo $RBUFFER | sed 's/\($\| \)/" /'`
    zle redisplay
}
zle -N surroundDoubleQuotes
bindkey '^["' surroundDoubleQuotes

clearString() {
    # clears content of a surrounded string
    LBUFFER=`echo $LBUFFER | sed 's/\(.*\)\('"'"'\|"\).*/\1\2/'`
    RBUFFER=`echo $RBUFFER | sed 's/.*\('"'"'\|"\)\(.*$\)/\1\2/'`
    zle redisplay
}
zle -N clearString
bindkey '^[;' clearString
