#!/bin/sh

main() {
  sudo cp ./cryodeck /usr/local/bin/cryodeck || {
    printf -- 'Failed to install cryodeck\n'
    return 1
  }

  sudo chmod 755 /usr/local/bin/cryodeck || {
    printf -- 'Failed to chmod cryodeck\n'
    return 1
  }

  sudo cp ./cryodeck.service /etc/systemd/system/cryodeck.service || {
    printf -- 'Failed to install cryodeck service\n'
    return 1
  }

  sudo chmod 644 /etc/systemd/system/cryodeck.service || {
    printf -- 'Failed to chmod cryodeck.service\n'
    return 1
  }

  return 0
}

main "$@" || exit 1
exit 0
