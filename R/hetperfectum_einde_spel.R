#' einde spel
#'
#' @param juist
#' @param fout
#'
#' @return
#' @export
#'
#' @examples
hetperfectum_einde_spel <- function(juist, fout){
  if(juist == 0 & fout == 0){
    perc_juist <- 0
  }else{
    perc_juist <- round(juist / sum(juist, fout) * 100, 2)
  }

  winnaar <- "Goed gedaan!"
  verliezer <- "Jij kan het beter. Spel nog en keer!"

  if(perc_juist >= 50.0){
    bericht <- winnaar
  }else{
    bericht <- verliezer
  }

  message("-----------------------------------------------------------------------------")
  message("Einde spel!")
  message(paste0("  Juist: ", juist))
  message(paste0("  Fout: ", fout))
  message(paste0("  Percentage juist: ", perc_juist))
  message(bericht)
  message("-----------------------------------------------------------------------------")
}

