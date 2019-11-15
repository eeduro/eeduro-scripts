#!/bin/bash

script="$(readlink -f $0)"
script_dir="$(dirname $script)"

. "$script_dir/config.sh.in"

if [ ! -d "$eeros_source_dir" ]; then
	git clone $eeros_git_remote_address -o upstream "$eeros_source_dir"
	pushd "$eeros_source_dir"
	git checkout $eeros_git_version
	popd
fi

if [ ! -d "$librobotcontrol_source_dir" ]; then
	git clone "$librobotcontrol_git_remote_address" -o upstream "$librobotcontrol_source_dir"
	pushd "$librobotcontrol_source_dir"
	git checkout "$librobotcontrol_git_version"
	popd
fi

if [ ! -d "$bbblue_eeros_source_dir" ]; then
	git clone "$bbblue_eeros_git_remote_address" -o upstream "$bbblue_eeros_source_dir"
	pushd "$bbblue_eeros_source_dir"
	git checkout "$bbblue_eeros_git_version"
	popd
fi

if [ ! -d "$delta_source_dir" ]; then
	git clone $delta_git_remote_address -o upstream "$delta_source_dir"
fi
