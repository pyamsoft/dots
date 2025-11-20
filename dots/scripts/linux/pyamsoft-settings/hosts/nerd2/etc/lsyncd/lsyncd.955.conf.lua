-- https://lsyncd.github.io/lsyncd/manual/config/file/
settings({
  logfile = "/tmp/lsyncd.955.log",
  statusFile = "/tmp/lsyncd.955.status",
  pidfile = "/tmp/lsyncd.955.pid",
  nodaemon = true,
})

sync({
  default.rsync,

  source = "/mnt/MassMedia/2/shares",
  target = "/mnt/MassMedia/1/shares",

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
