# The Common Drone CI Integration Template

A common Drone CI integration template that should be easily adaptable for most project's with few modifications

[![Continuous Integration(CI) status](https://cloud.drone.io/api/badges/the-common/drone-ci-integration/status.svg?github-camo-dont-cache=true)](https://cloud.drone.io/the-common/drone-ci-integration) [![REUSE compliance status](https://api.reuse.software/badge/github.com/the-common/drone-ci-integration)](https://api.reuse.software/info/github.com/the-common/drone-ci-integration)

## How to use

1. Download release archive from the [Releases](https://github.com/the-common/drone-ci-integration/releases) page
1. Extract the release archive
1. From the release folder, install the following files to your project's root directory
    - [.drone.yml](.drone.yml)  
      Drone CI configuration file
    - (Optional) [continuous-integration/](continuous-integration/)  
      Support files for convenience(CI, CD)
    - (Optional) [.gitattributes](.gitattributes.shipped)  
      Specify path patterns to exclude from the release archive
    - (Optional) [.pre-commit-config.yaml](.pre-commit-config.yaml.shipped)  
      [pre-commit](https://pre-commit.com) configuration file for continuous integration
    - (Optional) [.markdownlint.yml](.markdownlint.yml.shipped)  
      Markdownlint configuration file for checking Markdown documents
1. Customize [.drone.yml](.drone.yml) file to fit your project's need
1. Profit!

## Desktop integration

This product provides support for the following desktop environments:

* Gtk-based desktop environments
  GNOME/XFCE/Cinnamon/...
* KDE desktop environment

It conforms to the [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/) and the [XDG user directories convention](https://www.freedesktop.org/wiki/Software/xdg-user-dirs/), whenever possible.

To install the desktop integrations, run the [install-desktop-integrations.bash](install-desktop-integrations.bsash) program in a terminal.

## License

Unless otherwise specified, this product is released with [the Creative Commons Attribution-ShareAlike License, version 4.0](https://creativecommons.org/licenses/by-sa/4.0), or any more recent version of your choice, with an exception of the license only covers the configuration file itself, but not other assets in your project.

For the attribution requirement, please retain the "This file is based on ..." mention and link to this project.

### Identify licenses applicable to a certain product/development asset

If the asset is in plaintext format:

1. Check the `SPDX-License-Identifier` tag in the file's header
1. Check the [.reuse/dep5](.reuse/dep5) file from the source tree/release tree directory

If the asset is not in plaintext format:

Check the [.reuse/dep5](.reuse/dep5) file from the source tree/release tree directory

## Reference

* [Adding an entry to the Create New menu - KDE UserBase Wiki](https://userbase.kde.org/Adding_an_entry_to_the_Create_New_menu)
