#!/bin/bash

script="$(readlink -f $0)"
script_dir="$(dirname $script)"

. "$script_dir/config.sh.in"


if [ ! -d "$delta_source_dir" ]; then
	git clone $delta_git_remote_address -o upstream "$delta_source_dir"
	pushd $delta_source_dir
		git checkout $delta_git_version
	popd
fi
