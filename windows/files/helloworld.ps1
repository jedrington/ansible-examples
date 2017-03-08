# Filename: helloworld.ps1
# Remote computer argument for Windows only, not for Linux
param( [string]$computer = "." )
if ( $HOME[0] -eq "/" ) {
	# Linux
	# Command line argument is ignored.
	# Less info than Windows' WMI version.

	# xrandr/Select-String tip by diegows on StackOverflow.com
	# http://superuser.com/a/418700
	$info = ( xrandr | Select-String -Pattern "\*" ) -split "\s+"

	Write-Host "DeviceName       : "
	Write-Host "PelsWidth        : " ( $info[1] -split "x" )[0]
	Write-Host "PelsHeight       : " ( $info[1] -split "x" )[1]
	Write-Host "BitsPerPel       : "
	Write-Host "DisplayFrequency : " ( $info[2] -split "\*" )[0]
	Write-Host

} else {
	# This PowerShell code for Windows was generated using the WMI Code Generator, Version 10.0 RC3
	# http://www.robvanderwoude.com/wmigen.php

	$instances = Get-WMIObject -Class "Win32_DisplayConfiguration" -Namespace "root/CIMV2" -Computername $computer

	foreach ( $item in $instances ) {
		Write-Host "DeviceName       : " $item.DeviceName
		Write-Host "PelsWidth        : " $item.PelsWidth
		Write-Host "PelsHeight       : " $item.PelsHeight
		Write-Host "BitsPerPel       : " $item.BitsPerPel
		Write-Host "DisplayFrequency : " $item.DisplayFrequency
		Write-Host
	}
}
msg * "Your message goes here"
# end of script
