#!/bin/bash

export SEC_BUILD_CONF_VENDOR_BUILD_OS=13
export PLATFORM_VERSION=13
export ANDROID_MAJOR_VERSION=T
export ARCH=arm64
export SUBARCH=arm64

export CC=clang
export CLANG_TRIPLE=aarch64-linux-gnu-
export CROSS_COMPILE=aarch64-linux-gnu-
export CROSS_COMPILE_ARM32=arm-linux-gnueabihf-
export CROSS_COMPILE_COMPAT=arm-linux-gnueabihf-
export LD=ld.lld
export AR=llvm-ar
export NM=llvm-nm
export OBJCOPY=llvm-objcopy
export OBJDUMP=llvm-objdump
export STRIP=llvm-strip

# HOSTCFLAGS=-fcommon → corrige 'multiple definition of yylloc' no dtc
make HOSTCFLAGS=-fcommon exynos9830-r8slte_defconfig
make HOSTCFLAGS=-fcommon -j$(nproc)
