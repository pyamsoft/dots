# OPNsense

## Dnsmasq

The UI in 25.7.1 shows the option of "Listen on Interfaces" as "All", but this is actually "NONE"
You MUST pick your interfaces specifically, or else firewall rules will not be correctly added for DHCP,
and your clients will not get IP addresses.
