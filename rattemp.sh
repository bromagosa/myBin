ratpoison -c "echo `cat /proc/acpi/thermal_zone/TZS1/temperature | awk '{print $2}'`ºC"
