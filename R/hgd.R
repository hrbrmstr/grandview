#' Initialize httpgd graphics device, start server, and launch viewer.
#'
#' @param host Hostname.
#' @param port Port.
#' @param width Graphics device width (pixels).
#' @param height Graphics device height (pixels).
#' @param bg Background color.
#' @param pointsize Graphics device point size.
#' @param system_fonts Named list of font names to be aliased with
#'   fonts installed on your system. If unspecified, the R default
#'   families \code{sans}, \code{serif}, \code{mono} and \code{symbol}
#'   are aliased to the family returned by
#'   \code{\link[gdtools]{match_family}()}.
#' @param user_fonts Named list of fonts to be aliased with font files
#'   provided by the user rather than fonts properly installed on the
#'   system. The aliases can be fonts from the fontquiver package,
#'   strings containing a path to a font file, or a list containing
#'   \code{name} and \code{file} elements with \code{name} indicating
#'   the font alias in the SVG output and \code{file} the path to a
#'   font file.
#' @param recording Should a plot history be recorded.
#' @param cors Toggles Cross-Origin Resource Sharing (CORS) header.
#'   When set to TRUE, CORS header will be set to "*".
#' @param token (Optional) security token string. When set all requests
#'   need to include this token to be allowed. (Either in a request header
#'   (X-HTTPGD-TOKEN) field or as a query parameter.)
#'
#' @export
hgd <- function(host = "127.0.0.1",
                port = 8288,
                width = 720,
                height = 576,
                bg = "white",
                pointsize = 12,
                system_fonts = list(),
                user_fonts = list(),
                recording = TRUE,
                cors = FALSE,
                token = "") {

  capture.output(
    httpgd(
      host = host[1],
      port = port[1],
      width = width[1],
      height = height[1],
      bg = bg[1],
      pointsize = pointsize[1],
      system_fonts = system_fonts,
      user_fonts = user_fonts,
      recording = recording[1],
      cors = cors[1],
      token = token[1]
    )
  ) -> ignore

  gd_url <- sprintf("http://%s:%s/live", host[1], port[1])

  if (nchar(token[1]) > 0) gd_url <- sprintf("%s?token=%s", gd_url, token[1])

  if (file.exists(grandview_app())) {

    system2(
      command = grandview_app(),
      args = c(
        gd_url,
        as.character(as.integer(width[1])),
        as.character(as.integer(height[1]))
      ),
      wait = FALSE
    )

  }

  message("{httpgd} running at ", gd_url)

}

# dir.create(
#   file.path(tools::R_user_dir(package = "grandview"), "app"),
#   recursive = TRUE
# )





