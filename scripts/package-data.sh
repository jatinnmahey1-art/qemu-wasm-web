#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/../emsdk.env" 2>/dev/null || source "$EMSDK/emsdk_env.sh"

mkdir -p web/assets/pack
cp web/assets/alpine.img web/assets/bios/* web/assets/pack/

emcc -s FORCE_FILESYSTEM=1 -s EXIT_RUNTIME=1 \
  -s ASYNCIFY=1 -s USE_PTHREADS=1 \
  ../qemu-build/riscv64-softmmu/qemu-system-riscv64 \
  -o web/qemu-system-riscv64.html \
  --preload-file web/assets/pack@/
