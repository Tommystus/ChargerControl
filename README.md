# ChargerControl
Windows Laptop Charger Control using PowerShell with ESP Easy on Sonoff S20

Use Powershell script to monitor battery level then send http control command to ESP Easy on Sonoff S20 to enable charging when battery level is below certain limits then turn off charging when it's near full.

Add this script to Windows's task scheduler to run hourly or more often as needed.  Below is the action command.
```
powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -NoLogo -File "C:\myScripts\powermon.ps1"
```

I use this on laptop that is being used mostly like a desktop with power plug in all the time.  This is not good for the battery because it rarely get to discharge.

Based on https://github.com/Pro/battery-monitor/blob/master/BatteryCheck.ps1
