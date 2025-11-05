#!/usr/bin/env bash
set -euo pipefail

# Load Emscripten env (works both locally and in CI)
source "$(dirname "$(realpath "$0")")/../emsdk.env" 2>/dev/null || \
  source "$EMSDK/emsdk_env.sh"

TARGET=riscv64-softmmu   # change to x86_64-softmmu / aarch64-softmmu if desired

mkdir -p ../qemu-build && cd ../qemu-build
../qemu/configure \
  --target-list=$TARGET \
  --disable-system --enable-linux-user=no \
  --extra-cflags="-s USE_PTHREADS=1 -O3" \
  --extra-ldflags="-s ASYNCIFY=1 -s PTHREAD_POOL_SIZE=4 -s ASYNCIFY_STACK_SIZE=131072"

emmake make -j$(nproc) qemu-system-${TARGET#*-}
