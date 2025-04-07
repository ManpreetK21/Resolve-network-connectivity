# Resolve-networkconnectivity
This script is designed to troubleshoot network connectivity by clearing the DNS cache, requesting a new IP address from the DHCP server, setting a static IP if necessary, and confirming the success or failure of these actions.

## Features

This script is designed to help resolve common network connectivity issues. It performs the following steps:
1. Clears the DNS Cache: The script begins by clearing the DNS cache stored on the device to eliminate any outdated or incorrect DNS information.
2. Requests a New IP Address: The script then communicates with the DHCP server to request a new IP address configuration, potentially resolving IP address conflicts or connection issues.
3. Sets Static IP Address: If the previous steps do not resolve the issue, the script assigns a static IP address to the device, ensuring a stable connection.
4. Connectivity Check: Once the changes are applied, the script checks the network status. If the configuration is successful, it displays a success message. 
5.If these steps do not resolve the issue, the script will display an error message, suggesting that further assistance from a network expert may be needed.

This script is ideal for troubleshooting network connectivity problems, automating the process of resetting network settings and ensuring a reliable connection.

## Prerequisties
1. PowerShell installed on Windows device
2. Administrator privileges to run network related commands




