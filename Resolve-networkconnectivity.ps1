#Before running the script make sure to open Powershell with administrator Privileges

#This script is written to resolve connectivity issues. The script do as follows: 
#  1. Clear DNS Cache to start with clean lookups to make sure there is no incorrect DNS responses 
#  2. Then it requests the dhcp server for new dhcp ip address configurations
#  3. Then it checks if the connection is secured and media is connected
#  4. If still doesnot resolve then it gives the static IP address connectivity for streamless connection
#  5. Then, it checks the connectivity again to make sure network is connected 
#  6. The scripts ends

# Clear DNS Cache
Clear-DnsClientCache
#variable for adapter name
 $adapter = "Wi-Fi"
#  requests the dhcp server for new ip adress
Get-NetAdapter | Where-Object {$_.Name -eq $adapter} |ForEach-Object { ipconfig /renew }
#  checks if the connection is secured and media is connected
$status = (Get-NetAdapter $adapter).Status

# If-else loop defining the course of action depending on $status

if ($status -eq "Up") {
    #write messages if media is connected and exit 

    Write-Host "Already connected via DHCP. No changes applied." -ForegroundColor green  

    exit
    }
else {
    #set Ip address to static and exit

    #assign variables to adapter name, ip address, gateway and dns to make it simple in cmdlets
   
    $ip = "192.168.0.28"
    $gateway = "192.168.0.1"
    $dns = "192.168.0.1"
    $dns2 = "8.8.8.8"

    #Disable Dhcp to avoid ip conflict

    Set-NetIPInterface -InterfaceAlias $adapter -Dhcp Disabled

    #Sets the ip address parameters and dns server address

    New-NetIPAddress -InterfaceAlias $adapter -IPAddress $ip -PrefixLength 24 -DefaultGateway $gateway
    
    Set-DnsClientServerAddress -InterfaceAlias $adapter -ServerAddresses $dns, $dns2

    # wait for 5 seconds to update the changes

    Start-Sleep -seconds 5

    #Displays the message on the condition if its connected or not
    $status = (Get-NetAdapter$adapter).Status
    
    if ($status -eq "Up") {

        Write-Host " Configuration Successfully Completed" -ForegroundColor Green 
        }

        else {

        Write-Host "An Error Occurred " -ForegroundColor Red

        }
    Exit

}


