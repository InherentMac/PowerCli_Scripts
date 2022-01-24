# vCenter Appliance credentials
$vc_url = "1.2.3.4"
$vc_un = "administrator@vsphere.local"
$vc_pw = "nice_try"

# User variables for Template and VM naming
$VMTemplate = Get-Template -Name "Debian_Template"
$vmName = "DebianVM_"
$numberOfVMs = 2

# Connect to vCenter
$conn = Connect-VIServer -Server $vc_url -User $vc_un -Password $vc_pw

# If connected, run script - else abort
if ($conn) {
    Write-Host -ForegroundColor Green "Connected!"

    # Get hosts from vCenter and append to an array
    $hostlist = @()
    Get-VMHost -Server $conn | ForEach-Object {
        $hostlist += $_
    }

    # Get template object based on name given above
    $template = Get-Template -Server $conn -Name $templateName

    # Loop through hosts in array in round-robin
    $hostindex = 0

    # Perform actions in this block for each VM to be created
    1..$numberOfVMs | %{ 
       $currentVmName = $vmName + $_
       New-VM -Server $conn -Name $currentVmName -Template $VMTemplate -Datastore 'datastore1' -Host $hostlist[$hostindex]
       Start-VM -Server $conn -VM $currentVmName
       $hostindex++
       if ($hostindex -eq $hostlist.count) {
          $hostindex = 0
       }
    }

    # When completed, disconnect from vCenter
    Disconnect-VIServer * -Force -Confirm:$false
} else {
    Write-Host -ForegroundColor Red "Error while connecting - aborting."
}