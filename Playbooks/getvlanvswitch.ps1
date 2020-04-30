connect-VIServer -Server vcenter.local -User {{ vcenter_user }} -Password {{ vcenter_pass }} | Out-Null
$vlan=Get-VirtualSwitch -Name DSwitch | Get-VirtualPortGroup | `
Select Name, @{N="VLANId";E={$_.Extensiondata.Config.DefaultPortCOnfig.Vlan.VlanId}}
$vlan | Out-File -filePath vlanresult.json