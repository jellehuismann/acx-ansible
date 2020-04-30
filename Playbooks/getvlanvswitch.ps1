connect-VIServer -Server vcenter.local -User {{ username.vcenter }} -Password {{ password.vcenter }} | Out-Null
$vlan=Get-VirtualSwitch -Name DSwitch | Get-VirtualPortGroup | `
Select Name, @{N="VLANId";E={$_.Extensiondata.Config.DefaultPortCOnfig.Vlan.VlanId}}
$vlan | Out-File -filePath vlanresult.json