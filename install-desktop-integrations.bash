#!/usr/bin/env bash
# Install desktop integrations of the templates
#
# Copyright 2021 林博仁(Buo-ren, Lin) <Buo.Ren.Lin@gmail.com>
# SPDX-License-Identifier: CC-BY-SA-4.0

set \
    -o errexit \
    -o nounset

script_dir="${BASH_SOURCE[0]%/*}"

init(){
    local templates_dir

    templates_dir="$(get_templates_dir)"

    mkdir -p "${templates_dir}"
    install \
        --mode=0644 \
        "${script_dir}"/.drone.yml.shipped \
        "${templates_dir}"/.drone.yml
    install \
        --directory \
        --mode=0755 \
        "${templates_dir}"/continuous-integration \
        "${templates_dir}"/continuous-integration
    install \
        --mode=0755 \
        "${script_dir}"/continuous-integration/build-product-release-archive.sh \
        "${templates_dir}"/continuous-integration/build-product-release-archive.sh
    install \
        --mode=0755 \
        "${script_dir}"/continuous-integration/static-code-analysis.sh \
        "${templates_dir}"/continuous-integration/static-code-analysis.sh
}

get_templates_dir(){
    local templates_dir

	if test -f "${HOME}"/.config/user-dirs.dirs;then
		# external file, disable check
		#shellcheck disable=SC1091
		source "${HOME}"/.config/user-dirs.dirs

		if test ! -v XDG_TEMPLATES_DIR; then
            templates_dir="${HOME}"/Templates
        else
			templates_dir="${XDG_TEMPLATES_DIR}"
		fi
	else
        templates_dir="${HOME}"/templates
    fi

    printf '%s' "${templates_dir}"
}

init