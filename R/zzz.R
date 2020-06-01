.onAttach <- function(libname, pkgname) {

  if (interactive()) {

    if (!grandview_exists()) {

      packageStartupMessage(
        paste0(strwrap(paste0(c(
          "{grandview} requires a binary application that you ",
          "must manually install because of some made up CRAN ",
          "rules that other, more user-friendly (but user-insecure) ",
          "environments like Python do not have to abide by. ",
          "Please run `grandview::install_viewer()` to use this ",
          "package."
        ), collaspe = "")), collapse = "\n")
      )

    }

  }

}