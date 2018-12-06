#' @export
play_mojito_game <- function() {
  appDir <- system.file("shiny-examples", "myapp", package = "Mojito")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `Mojito`.", call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}
