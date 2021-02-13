#!/usr/bin/env bash
# Install desktop integrations of the templates
#
# Copyright 2021 林博仁(Buo-ren, Lin) <Buo.Ren.Lin@gmail.com>
# SPDX-License-Identifier: CC-BY-SA-4.0

set \
    -o errexit \
    -o nounset

shopt \
    -s nullglob

script_dir="$(
    realpath \
        --relative-base="${PWD}" \
        --strip \
        "${BASH_SOURCE[0]%/*}"
)"

init(){
    local \
        templates_dir \
        templates_dir_kde="${HOME}"/.local/share/templates \
        drone_yml_filename

    templates_dir="$(get_templates_dir)"
    mkdir -pv "${templates_dir}"

    if is_source_tree "${script_dir}"; then
        drone_yml_filename=.drone.yml.shipped
    else
        drone_yml_filename=.drone.yml
    fi

    install \
        --mode=0644 \
        --verbose \
        "${script_dir}"/"${drone_yml_filename}" \
        "${templates_dir}"/.drone.yml
    install \
        --directory \
        --mode=0755 \
        --verbose \
        "${templates_dir}"/continuous-integration
    install \
        --mode=0755 \
        --verbose \
        "${script_dir}"/continuous-integration/build-product-release-archive.sh \
        "${templates_dir}"/continuous-integration/build-product-release-archive.sh
    install \
        --mode=0755 \
        --verbose \
        "${script_dir}"/continuous-integration/static-code-analysis.sh \
        "${templates_dir}"/continuous-integration/static-code-analysis.sh

    install \
        --directory \
        --mode=0755 \
        --verbose \
        "${templates_dir_kde}"
    install \
        --mode=0644 \
        --verbose \
        "${script_dir}"/"${drone_yml_filename}" \
        "${templates_dir_kde}"
    install \
        --mode=0644 \
        --verbose \
        "${script_dir}"/desktop-integration/drone.yml.desktop \
        "${templates_dir_kde}"

    echo -e '\nInstallation completed.'
}

is_source_tree(){
    local script_dir="${1}"

    if test -n "$(echo -n .*.shipped)"; then
        return 0
    else
        return 1
    fi
}

get_templates_dir(){
    local \
        templates_dir \
        templates_dir_fallback="${HOME}"/Templates

	if test -f "${XDG_CONFIG_HOME:-"${HOME}"/.config}"/user-dirs.dirs;then
		# external file, disable check
		#shellcheck source=/dev/null
		source "${XDG_CONFIG_HOME:-"${HOME}"/.config}"/user-dirs.dirs

		if test ! -v XDG_TEMPLATES_DIR; then
            templates_dir="${templates_dir_fallback}"
        else
			templates_dir="${XDG_TEMPLATES_DIR}"
		fi
	else
        templates_dir="${templates_dir_fallback}"
    fi

    printf '%s' "${templates_dir}"
}

init
