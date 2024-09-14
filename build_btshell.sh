#/usr/bin/env bash
newt clean all
newt build nucleof439zi_btshell
newt create-image nucleof439zi_btshell 1.0.0
newt load nucleof439zi_btshell

