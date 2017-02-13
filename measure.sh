#!/bin/bash
import /tmp/gas.png
ratpoison -c "echo `identify /tmp/gas.png | sed -r 's/(.*PNG )([0-9]*x[0-9]*)(.*)/\2/g'`"
echo `identify /tmp/gas.png | sed -r 's/(.*PNG )([0-9]*x[0-9]*)(.*)/\2/g'` | xclip
