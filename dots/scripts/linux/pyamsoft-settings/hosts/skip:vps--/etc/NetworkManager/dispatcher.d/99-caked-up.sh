#!/bin/sh

# Apply CAKE qdisc on WiFi network devices

IFACE="$1"
STATUS="$2"

_apply_cake() {
  if command -v /usr/sbin/tc >/dev/null && [ "$STATUS" = "up" ]; then
    /usr/sbin/tc qdisc replace dev "${IFACE}" root cake || return 1
  fi

  return 0
}

main() {
  case "${IFACE}" in
  wl*)
    _apply_cake || return 1
    return 0
    ;;
  *)
    return 0
    ;;
  esac

}

main "$@" || exit 1
exit 0
