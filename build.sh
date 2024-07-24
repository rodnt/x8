#!/bin/bash

# https://doc.rust-lang.org/rustc/platform-support.html ( how to build for other plattforms ( archs ))
# Install the packages ( cargo build --target=x86_64-unknown-linux-musl --release; cargo build --target=aarch64-unknown-linux-gnu --release )
# Binaries will saved ( build ) at target/<target>/release/

TARGETS=("x86_64-unknown-linux-musl" "aarch64-unknown-linux-gnu")

for target in "${TARGETS[@]}"
do
    echo "Building for $target"
    cargo build --target=$target --release
    if [ $? -ne 0 ]; then
        echo "Failed to build for $target"
        exit 1
    fi
done

echo "All builds completed successfully"
