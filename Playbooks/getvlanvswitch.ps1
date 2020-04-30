param 
( 
        $usernamevcenter,
        $passwordvcenter
)

Install-Module vmware.powercli -Force
connect-VIServer -Server vcenter.local -User "$usernamevcenter" -Password "$passwordvcenter" | Out-Null
$vlan=Get-VDSwitch -Name DSwitch | Get-VDPortgroup | `
Select Name, @{N="VLANId";E={$_.Extensiondata.Config.DefaultPortCOnfig.Vlan.VlanId}}
$vlan.VLANId | Out-File -filePath vlanresult.json
$result=$vlan.VLANId

Write-Output $result