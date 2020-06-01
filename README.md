
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Signed
by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-100%25-lightgrey.svg)
[![Linux build
Status](https://travis-ci.org/hrbrmstr/grandview.svg?branch=master)](https://travis-ci.org/hrbrmstr/grandview)  
![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-4.0.0-blue.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

# grandview

Provides Dedicated, Platform-Specific Viewers for ‘httpgd’ Graphics
Devices

## Description

The ‘httpgd’ packages provides a super-fast, asynchronous graphics
device for R graphics via ‘svglite’ and ‘later’ packages. Tools are
provided to use dedicated, platform-specific graphics “browsers” for
‘httpgd’ graphics devices.

This is an EXPERIMENTAL standalone viewer, written in Go, for the
super-cool {httpgd} package `remotes::install_github("nx10/httpgd")`.

The Windows viewer is not built yet because I haven’t got round to it
because I detest Windows.

The goal is to have a “Quartz”-like window (for folks familiar with that
on macOS) with full functionality. Right now, it’s just a basic viewer
(and ‘save’ doesn’t work for some reason that I’m trying to figure out.)

If I were you, I wouldn’t waste time on this package as it’ll likely
just get Sherlocked w/o notice by RStudio at some point and baked into
their ecosystem. I made it mainly for myself as I also detest using the
“browser for research” as an application runner.

I’m also just as likely to add an {httpgd} viewer functionality into
RSwitch since it already functions as an RStudio Server client and it
won’t take much to have it work with {httpgd} directly (or via this
package).

If you don’t trust the pre-built viewers, `tools-raw` has what you need
to make your own. They go into `tools::R_user_dir(package =
"grandview"), "app")` and for the macOS one you’ll need to use your own
signing cert (you may need to right-click open my built one once due to
faux security theatre by Apple).

Because I rely on `tools::R_user_dir()` this package requires R 4.0.0+.
That was a deliberate choice since the adoption rate for R 4.0.0+ is
likely low (so I have time to refine this package) and I’d rather rely
on it than {rappdirs}.

## What’s Inside The Tin

The following functions are implemented:

  - `hgd`: Initialize httpgd graphics device, start server, and launch
    viewer.
  - `install_viewer`: Install the binary viewer for your platform

## Installation

``` r
remotes::install_git("https://git.rud.is/hrbrmstr/grandview.git")
# or
remotes::install_git("https://git.sr.ht/~hrbrmstr/grandview")
# or
remotes::install_gitlab("hrbrmstr/grandview")
# or
remotes::install_bitbucket("hrbrmstr/grandview")
# or
remotes::install_github("hrbrmstr/grandview")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## Usage

``` r
library(grandview)

# current version
packageVersion("grandview")
## [1] '0.1.0'
```

``` r
install_viewer() # you'll get prompts to do this

hgd() # it accepts params which will get passed to the viewer

# plot stuff

dev.off()
```

## grandview Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
| :--- | -------: | ---: | --: | ---: | ----------: | ---: | -------: | ---: |
| R    |        6 | 0.67 | 134 | 0.73 |          40 | 0.48 |       53 | 0.54 |
| Go   |        1 | 0.11 |  23 | 0.13 |          15 | 0.18 |        5 | 0.05 |
| make |        1 | 0.11 |  15 | 0.08 |           3 | 0.04 |        1 | 0.01 |
| Rmd  |        1 | 0.11 |  11 | 0.06 |          26 | 0.31 |       40 | 0.40 |

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
