#!/bin/sh

_start_server() {
  # Display configuration information
  printf -- "Initializing server with:\n"
  printf -- "Batch size: %s\n" "${n_batch}"
  printf -- "Number of CPU threads: %s\n" "${n_threads}"
  printf -- "Number of GPU layers: %s\n" "${n_gpu_layers}"
  printf -- "Context window: %s\n" "${n_ctx}"
  
  # Run the server
  exec python3 -m llama_cpp.server \
    --n_ctx "${n_ctx}" \
    --n_threads "${n_threads}" \
    --n_gpu_layers "${n_gpu_layers}" \
    --n_batch "${n_batch}" \
    "$@"
}

_download_curl() {
  # Check if curl is installed
  if command -v curl >/dev/null; then
    return 0
  fi

  apt-get update --yes --quiet || {
    printf -- 'Failed apt-get update when trying to download curl\n'
    return 1
  }
  apt-get install --yes --quiet curl || {
    printf -- 'Failed apt-get install when trying to download curl\n'
    return 1
  }

  return 0
}

_download_model() {
  printf -- "Model file not found. Downloading...\n"

  _download_curl || return 1

  # Download the model file
  printf -- 'Download model from %s => %s\n' "${MODEL_DOWNLOAD_URL}" "${MODEL}"
  if ! curl -L -o "${MODEL}" "${MODEL_DOWNLOAD_URL}"; then
    printf -- 'Initial model attempt failed!'
    printf -- 'Try again with TLS1.2 from %s => %s\n' "${MODEL_DOWNLOAD_URL}" "${MODEL}"
    curl -L --tlsv1.2 -o "${MODEL}" "${MODEL_DOWNLOAD_URL}" || {
      printf -- 'All model download attemps failed\n'
      return 1
    }
  fi

  return 0
}

main() {
  # Check if the MODEL environment variable is set
  if [ -z "${MODEL}" ]; then
    printf -- "Please set the MODEL environment variable\n"
    return 1
  fi
  
  # Check if the MODEL_DOWNLOAD_URL environment variable is set
  if [ -z "${MODEL_DOWNLOAD_URL}" ]; then
      printf -- "Please set the MODEL_DOWNLOAD_URL environment variable\n"
      return 1
  fi
  
  # Check if the model file exists
  if [ ! -f "${MODEL}" ]; then
    _download_model || return 1
  else
      printf -- "%s model found\n" "${MODEL}"
  fi
  
  # Build the project
  make build || {
    printf -- 'Failed to build project'
    return 1
  }
  
  # Get the number of available CPU threads
  n_threads="$(grep -c '^processor' /proc/cpuinfo)"
  
  # Define context window
  n_ctx=4096
  
  # Offload everything to CPU
  n_gpu_layers=0
  
  # Define batch size based on total RAM
  total_ram="$(grep 'MemTotal' /proc/meminfo | awk '{ print $2 }')"
  n_batch=2096
  if [ "${total_ram}" -lt 8000000 ]; then
      n_batch=1024
  fi
  
  _start_server "$@" || return 1
  return 0
}

main "$@" || exit 1
exit 0

