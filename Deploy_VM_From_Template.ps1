$vc_url = "1.2.3.4"
$vc_un = "administrator@vsphere.local"
$vc_pw = "nice_try"

$conn = Connect-VIServer -Server $vc_url -User $vc_un -Password $vc_pw
$VMHost = '1.5.1.138'
$templateName = 'Ubuntu_Template'
$vmName = 'UbuntuVM_1'
if ($conn) {
  Write-Host -ForegroundColor Green "Connected!"
  $DS = Get-Datastore -Name Local*
  1..99 | %{ 
     $currentVmName = $vmName + $_
     New-VM -Server $conn -Name $currentVmName -Template $templateName -Datastore 'NFS' -VMHost $VMHost
     Start-VM -VM $currentVmName
  }
  Disconnect-VIServer * -Force -Confirm:$false
} else {Write-Host -ForegroundColor Red "Error while connecting - aborting."}
