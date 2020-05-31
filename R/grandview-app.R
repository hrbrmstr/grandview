is_windows <- function() {
  tolower(Sys.info()[["sysname"]]) == "windows"
}

is_linux <- function() {
  tolower(Sys.info()[["sysname"]]) == "linux"
}

is_macos <- function() {
  tolower(Sys.info()[["sysname"]]) == "darwin"
}

grandview_app <- function() {

  if (is_macos()) {
    file.path(tools::R_user_dir(package = "grandview"), "app", "GrandView.app", "Contents", "MacOS", "GrandView")
  }

}
