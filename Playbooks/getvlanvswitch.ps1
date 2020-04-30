param 
( 
        $usernamevcenter,
        $passwordvcenter
)

Install-Module vmware.powercli -Force
Set-PowerCLIConfiguration -Scope User -ParticipateInCEIP $false
connect-VIServer -Server vcenter.local -User "$usernamevcenter" -Password "$passwordvcenter" | Out-Null
$vlan=Get-VirtualSwitch -Name DSwitch | Get-VirtualPortGroup | `
Select Name, @{N="VLANId";E={$_.Extensiondata.Config.DefaultPortCOnfig.Vlan.VlanId}}
ConvertTo-Json -InputObject $vlan