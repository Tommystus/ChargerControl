Start-Transcript -path c:\windows\temp\powermon.log
write-host "Starting $(Get-Date -Format G)" 

$batt = Get-WmiObject -Class Win32_Battery
#1 means on battery, 2 on ac power
If ($batt.BatteryStatus -like '1') {
	'PowerStatus: On_Battery'
}
elseif ($batt.BatteryStatus -like '2') {
	'PowerStatus: AC_Power'
}

$switchIP = "192.168.1.99"
#Sonoff S20 relay is on GPIO 12

#If charge is larger than 100, it means it is full/on ac power
if ($batt.EstimatedChargeRemaining -lt '100') {
	'EstimatedChargeRemaining: ' + $batt.EstimatedChargeRemaining + '%'
	if ($batt.EstimatedChargeRemaining -lt '40') {
		$rv = Invoke-WebRequest -Uri "http://$switchIP/control?cmd=GPIO,12,1"
	} else {
		if ($batt.EstimatedChargeRemaining -gt '75') {
			$rv = Invoke-WebRequest -Uri "http://$switchIP/control?cmd=GPIO,12,0"
		}
	}
} else {
	'EstimatedChargeRemaining: 100%'
}


write-host "Done $(Get-Date -Format G)"
Stop-Transcript
