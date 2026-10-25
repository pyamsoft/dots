#!/bin/sh

readonly LED=/sys/class/leds/chromeos:multicolor:charging

main() {
  _state="$1"

  case "${_state}" in
  pre)
    # Take control of the light manually
    printf -- "none" >"${LED}/trigger"

    # Set it to blue
    printf -- "0 0 100 0 0 0" >"${LED}/multi_intensity"

    # Half-bright
    printf -- "50" >"${LED}/brightness"
    ;;
  post)
    # Give control back to the system
    printf -- "chromeos-auto" >"$L/trigger"
    ;;
  esac

  unset _state
  return 0
}

main "$@"
exit "$?"
