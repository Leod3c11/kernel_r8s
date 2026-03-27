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

# LLVM=1      → usa assembler integrado do Clang (resolve '-EL' e LSE atomics)
# LLVM_IAS=1  → força Integrated Assembler mesmo em submakes
# HOSTCFLAGS  → resolve 'multiple definition of yylloc' no dtc (gcc 10+ bug)
# KCFLAGS     → desabilita warning que vira erro no Clang 19 novo
EXTRA_MAKE_FLAGS="LLVM=1 LLVM_IAS=1 HOSTCFLAGS=-fcommon KCFLAGS=-Wno-gnu-variable-sized-type-not-at-end"

make $EXTRA_MAKE_FLAGS exynos9830-r8slte_defconfig
make $EXTRA_MAKE_FLAGS -j$(nproc)
