# PowerCli_Scripts
A collection of powershell scripts written to automate vSphere management.

## Current Automations

1. [Delete_VMs.ps1](https://github.com/InherentMac/PowerCli_Scripts/blob/main/Delete_VMs.ps1)
    - Connect to vCenter host.
    - Print list of VM names.
    - Stop all running VMs.
    - Delete all VMs in list.

2. [Deploy_VM_From_Template.ps1](https://github.com/InherentMac/PowerCli_Scripts/blob/main/Deploy_VM_From_Template.ps1)
    - Connect to vCenter host.
    - Test connection status.
    - Print DS list.
    - Create new VMs from template on DS and then start it. (Set to deploy 100)

3. [Deploy_VM_From_Template_MultiHost.ps1](https://github.com/InherentMac/PowerCli_Scripts/blob/main/Deploy_VM_From_Template_MultiHost.ps1)
    - Connect to vCenter host.
    - Test connection status.
    - List ESXi hosts.
    - Create new VMs from template round robin on ESXi hosts.
    - Power on the VMs.

4. [PowerOFF_VMs.ps1](https://github.com/InherentMac/PowerCli_Scripts/blob/main/PowerOFF_VMs.ps1)
    - Connect to vCenter host.
    - List all VMs (grep for all VMs with "Debian" in name).
    - Stop all VMs in list.
