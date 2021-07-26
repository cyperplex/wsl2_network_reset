write-host "Starting reset of adapter"
Get-NetAdapter | Where-Object {$_.InterfaceDescription -Match "Cisco AnyConnect"} | Set-NetIPInterface -InterfaceMetric 4000
write-host "Set Metric to 1"
Get-NetIPInterface -InterfaceAlias "vEthernet (WSL)" | Set-NetIPInterface -InterfaceMetric 1
write-host "Restart WSL "
Get-Service LxssManager | Restart-Service
