# QEMU → WebAssembly Demo

One-click GitHub Actions build that produces `qemu-system-riscv64.js + .wasm` and deploys a live demo on **GitHub Pages**.

## Features
- Multi-threaded TCG JIT (`USE_PTHREADS`)
- Asyncify for blocking syscalls
- Preloaded BIOS + Alpine disk
- Zero-config CI/CD

## Live demo
https://YOURNAME.github.io/qemu-wasm-web

## How to use locally

```bash
git clone https://github.com/YOURNAME/qemu-wasm-web.git
cd qemu-wasm-web
./scripts/build-qemu.sh
./scripts/package-data.sh
emrun web/qemu-system-riscv64.html
