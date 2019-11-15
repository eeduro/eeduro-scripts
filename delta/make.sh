#!/bin/bash

script="$(readlink -f $0)"
script_dir="$(dirname $script)"

. "$script_dir/config.sh.in"

if [ "$rm_build_install_dir" = true ]; then
  rm -rf "$build_dir" "$install_dir"
fi


mkdir -p $eeros_build_dir
pushd $eeros_build_dir
cmake -DCMAKE_TOOLCHAIN_FILE=$toolchain_file \
      -DCMAKE_INSTALL_PREFIX=$install_dir \
      -DCMAKE_BUILD_TYPE=Release \
      $eeros_source_dir
make
make install
popd


mkdir -p $bbblue_eeros_build_dir
pushd $bbblue_eeros_build_dir
cmake -DCMAKE_TOOLCHAIN_FILE=$toolchain_file \
      -DADDITIONAL_INCLUDE_DIRS="$librobotcontrol_source_dir/libraries/" \
      -DADDITIONAL_LINK_DIRS="$librobotcontrol_source_dir/libraries/" \
      -DCMAKE_INSTALL_PREFIX=$install_dir \
      -DCMAKE_BUILD_TYPE=Release \
      -DREQUIRED_EEROS_VERSION=$eeros_required_version \
      $bbblue_eeros_source_dir
make
make install
popd


mkdir -p $delta_build_dir
pushd $delta_build_dir
cmake -DCMAKE_TOOLCHAIN_FILE=$toolchain_file \
      -DADDITIONAL_INCLUDE_DIRS="$librobotcontrol_source_dir/libraries/" \
      -DADDITIONAL_LINK_DIRS="$librobotcontrol_source_dir/libraries/" \
      -DCMAKE_INSTALL_PREFIX=$install_dir \
      -DCMAKE_BUILD_TYPE=Release \
      -DUSE_BBBLUE="$use_bbblue" \
      -DREQUIRED_EEROS_VERSION="$eeros_required_version" \
      -DREQUIRED_BBBLUE_EEROS_VERSION="$bbblue_eeros_required_version" \
      $delta_source_dir
make
popd
