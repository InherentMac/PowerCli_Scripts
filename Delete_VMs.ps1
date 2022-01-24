$vc_url = "1.2.3.4"
$vc_un = "administrator@vsphere.local"
$vc_pw = "nice_try"

Connect-VIServer -Server $vc_url -User $vc_un -Password $vc_pw
Get-VM UbuntuVM_* |Foreach-Object { #ALL VMS WITH DEBIAN IN NAME
     $VMName = $_.Name
     Write-Host $VMName #Write list of VM Names
     Stop-VM -Kill $VMName -Confirm:$false #Stop Running VMs
     Remove-VM -DeletePermanently -VM $_ -Confirm:$false #Permanently Remove VMs
}