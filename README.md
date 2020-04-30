# SQL scripts IP Allow
These scripts are used to allow only IPs/Range defined for clients to connect to SQL Database without any firewall changes:<br>
<br>
sqlipallow1.sql ⮕ Creates tables and functions (IPs/Ranges can be configured in this script)<br>
sqlipallow2.sql ⮕ Creates trigger<br>
rollback.sql ⮕ Rollback all the changes<br>

# Table IPAllow
This table is used to store IPs/Ranges allowed to connect to database. IP ranges uses CIDR (Classless Inter-Domain Routing) notation. More explanation about this notation can be found at https://networkengineering.stackexchange.com/questions/3697/the-slash-after-an-ip-address-cidr-notation<br>
<br>
Examples:<br>
\<local machine\> ⮕ Local machine where SQL instance is installed<br>
10.145.33.22 ⮕ Fixed IP<br>
10.0.0.0/8 ⮕ IP range, same as 10.x.x.x<br>
 
# Functions

IPAddressIsInRange ⮕ Function to check if IP is contained in range<br>
IPAddressToInteger ⮕ Function to convert IP to int

# Trigger

allow_ipaddress ⮕ Trigger to allow connection only for client IPs/ranges found in table IPAllow 

# References

Original IP blocking code with simple range mask:<br>
http://sql-articles.com/articles/security/ip-address-blocking-or-restriction-in-sql-server/<br>
<br>
Original source of functions IPAddressIsInRange and IPAddressToInteger:<br>
https://gist.github.com/phdesign/e899c7536375ad0d373262226c0d00ec<br>
