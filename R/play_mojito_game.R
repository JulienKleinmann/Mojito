#' @title Mojito Game
#'
#' @description This function is just use to launch the shiny app we created that
#'  let you play a game called : The mojito game. There is no argument to pass 
#'  to this function since it just launch the game.
#' 
#' @author ggplot3
#' @examples
#' play_mojito_game()

#' @export 
#'@import ggplot2 shiny shinyjs shinyWidgets shinyalert
#'


play_mojito_game <- function() {
  appDir <- system.file("shiny-examples", "myapp", package = "Mojito")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `Mojito`.", call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}
