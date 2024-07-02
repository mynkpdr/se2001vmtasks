Please use the nslookup command (on powershell or linux on your local system) to identify the IP addresses associated with the following websites. After obtaining the IP addresses, enter each one into a browser to check if it directs you to the corresponding website. For each website, print the result using the echo command: if the website is successfully reached using the IP address, print "www.website.com Yes", otherwise print "www.website.com No". Perform these steps for each website sequentially:

www.google.com
www.yahoo.com
www.duckduckgo.com
www.youtube.com
www.aws.amazon.com

Create a file with name `script.sh` which contains the `echo` commands sequentially.

Hint:

You can use the nslookup command for DNS lookup.

What is DNS and Why Perform a DNS Lookup?: The Domain Name System (DNS) translates human-readable domain names (like www.example.com) into IP addresses (like 93.184.216.34). DNS is crucial because it allows users to access websites using domain names instead of remembering complex IP addresses. A DNS lookup retrieves the IP address associated with a domain name, which is essential for network troubleshooting and ensuring that domain names are correctly mapped to their respective IP addresses.
