# PowerShell-Single-Search-Registry

This PowerShell Script that I created will search the remote registry of a specified computer for a key that you specify. This is good if you are trying to troubleshoot a remote computer. 

This script is also good if you work in environments that alot of system and network administrators work in and that is Windows environments that don't have all the WinRM and firewall exceptions programmed so you cannot use invoke-command because it throws a PSsession exception. 

This script is not perfect but this demonostrates the potential of the script and when I say that I mean that you can wrap this script in a loop and cycle through several computers. 
