#!/bin/sh
ratpoison -c "echo `date +'       %r %n   %A %d/%m/%y'`  `cal -NMbh | tail -n +2 | sed -e 's/^dl/\n\n dl/' -e 's/.*/ & /' -e \"s/\ $(date +%e)\ /\[$(date +%e)\]/\"`" 
