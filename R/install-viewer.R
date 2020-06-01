#' Install the binary viewer for your platform
#'
#' @export
install_viewer <- function() {

  path.expand(normalizePath(
    file.path(tools::R_user_dir(package = "grandview"), "app")
  )) -> place

  dir.create(place, recursive = TRUE, showWarnings = FALSE)

  if (is_macos()) {

    httr::GET(
      url = "https://github.com/hrbrmstr/grandview/releases/latest/download/GrandView.app.zip",
      httr::write_disk(file.path(place, "GrandView.app.zip"), overwrite = TRUE),
      httr::progress()
    )

    unzip(
      zipfile = file.path(place, "GrandView.app.zip"),
      exdir = place,
      overwrite = TRUE
    )

    file.remove(file.path(place, "GrandView.app.zip"))

    Sys.chmod(file.path(place, "GrandView.app", "Contents", "MacOS", "GrandView"), "0755")

    message("You may have to right-click and 'open' the app to accept permissions.")

    system2("open", shQuote(place))

  } else if (is_linux()) {

    httr::GET(
      url = "https://github.com/hrbrmstr/grandview/releases/latest/download/grandview",
      httr::write_disk(file.path(place, "grandview"), overwrite = TRUE),
      httr::progress()
    )

    Sys.chmod(file.path(place, "grandview"), "0755")

  } else {
    message("Windows not supported yet.")
  }

}
