# Tailscale

We use Tailscale to access local device over a generally
safe Wireguard tunnel.

Upon activating a Tailnet, it is by default open to
every device to talk freely. We don't exactly want this
though its not a huge problem, but we can split up the network
into "admin" level and "server" level devices
(where admin devices are internal, and server devices are public facing)

You can copy the following tailnet ACL file into
the Tailscale "Access Controls" editor



```json
// Example/default ACLs for unrestricted connections.
{
	// Declare static groups of users. Use autogroups for all users or users with a specific role.

	// Define the tags which can be applied to devices and by which users.
	"tagOwners": {
		"tag:admin":  ["autogroup:admin"],
		"tag:server": ["autogroup:admin"],
	},

	// Define access control lists for users, groups, autogroups, tags,
	// Tailscale IP addresses, and subnet ranges.
	"acls": [
		// Allow communication between admin devices
		{
			"action": "accept",
			"src":    ["tag:admin"],
			"dst":    ["tag:admin:*"],
		},

		// Allow communication between server devices
		{
			"action": "accept",
			"src":    ["tag:server"],
			"dst":    ["tag:server:*"],
		},

		// Allow communication FROM admin TO server devices
		{
			"action": "accept",
			"src":    ["tag:admin"],
			"dst":    ["tag:server:*"],
		},

		// Allow all connections.
		// Comment this section out if you want to define specific restrictions.
		// {
		// 	"action": "accept",
		// 	"src": ["*"],
		// 	"dst": ["*:*"]
		// },
	],

	// Test access rules every time they're saved.
	"tests": [
		// Accept admin communication to admin
		{
			"src":    "tag:admin",
			"accept": ["tag:admin:1234"],
		},

		// Accept admin communication to server
		{
			"src":    "tag:admin",
			"accept": ["tag:server:1234"],
		},

		// Accept server communication to server
		{
			"src":    "tag:server",
			"accept": ["tag:server:1234"],
		},

		// Reject server communication to admin
		{
			"src":  "tag:server",
			"deny": ["tag:admin:1234"],
		},
	],
}
```
