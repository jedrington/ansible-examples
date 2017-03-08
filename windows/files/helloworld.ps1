# Filename: helloworld.ps1
# Remote computer argument for Windows only, not for Linux
param( [string]$computer = "." )
$instances = Get-WMIObject -Class "Win32_DisplayConfiguration" -Namespace "root/CIMV2" -Computername $computer

foreach ( $item in $instances ) {
	Write-Host "DeviceName       : " $item.DeviceName
	Write-Host "PelsWidth        : " $item.PelsWidth
	Write-Host "PelsHeight       : " $item.PelsHeight
	Write-Host "BitsPerPel       : " $item.BitsPerPel
	Write-Host "DisplayFrequency : " $item.DisplayFrequency
	Write-Host
}

msg * "Your message goes here"
# end of script
