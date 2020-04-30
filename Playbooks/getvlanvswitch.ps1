param 
( 
        $usernamevcenter,
        $passwordvcenter
)

Install-Module vmware.powercli -Force
Set-PowerCLIConfiguration -Scope User -ParticipateInCEIP $true
connect-VIServer -Server vcenter.local -User "$usernamevcenter" -Password "$passwordvcenter" | Out-Null
$vlan=Get-VirtualSwitch -Name DSwitch | Get-VirtualPortGroup | `
Select @{N="VLANId";E={$_.Extensiondata.Config.DefaultPortCOnfig.Vlan.VlanId}}
$result=ConvertTo-Json -InputObject $vlan

return $result