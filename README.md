# SQL scripts IP Allow
These scripts are used to allow only IPs/Range defined for clients to connect to SQL Database without any firewall changes.

# Table master.dbo.IPAllow
This table is used to store IPs/Ranges allowed to connect to database. IP ranges uses CIDR (Classless Inter-Domain Routing) notation. More explanation about this notation can be found at https://networkengineering.stackexchange.com/questions/3697/the-slash-after-an-ip-address-cidr-notation<br>
<br>
Examples:<br>
<local machine> -> Local machine where SQL instance is installed<br>
10.145.33.22 -> Fixed IP<br>
10.0.0.0/8 -> IP range, same as 10.x.x.x<br>
 
# Functions

IPAddressIsInRange -> Function to check if IP is contained in range<br>
IPAddressToInteger -> Function to convert IP to int

# Trigger

allow_ipaddress -> Trigger to allow connection only for client IPs/ranges found in table IPAllow 
