-- https://lsyncd.github.io/lsyncd/manual/config/file/
settings({
	logfile = "/tmp/lsyncd.954.log",
	statusFile = "/tmp/lsyncd.954.status",
	pidfile = "/tmp/lsyncd.954.pid",
	nodaemon = true,
})

sync({
	default.rsync,

	source = "/mnt/MassMedia/2/media/",
	target = "/mnt/MassMedia/1/media/",

	rsync = {
		archive = true,
		compress = false,
		verbose = true,
		_extra = {
			-- delete removed files from target
			"--delete",
		},
	},
})
