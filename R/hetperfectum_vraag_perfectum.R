#' Spel begin
#'
#' @return
#' @export
#'
#' @examples
hetperfectum_vraag_perfectum <- function(){
  hetperfectum_begin_bericht()
  message("Druk op enter om door te gaan")
  readline("")
  tijd <- 0.5

  # load data
  hetperfectum <- hetperfectum::hetperfectum

  # juist aandworden
  juist <- 0

  # fout aandworden
  fout <- 0

  # Spelen logik
  while(nrow(hetperfectum) > 0){

    id <- sample(1:nrow(hetperfectum), 1)

    vraag <- hetperfectum$Infinitief[id]
    aantwoord <- hetperfectum$Perfectum[id]

    Sys.sleep(tijd)
    user_aantwoord <- readline(paste0('Wat is het Perfectum van "', vraag, '"?: '))
    Sys.sleep(tijd)

    # Exit logic
    if(user_aantwoord == "q"){
      return(hetperfectum_einde_spel(juist, fout))
    }
    # End Exit logic

    if(user_aantwoord == aantwoord){
      juist <- juist + 1
      hetperfectum <- hetperfectum[-id, ]
      message(paste0("Goed gedaan! Jij hebt ", juist, " juist perfectum geschreven."))
    }else{
        while(user_aantwoord != aantwoord){
          Sys.sleep(tijd)
          fout <- fout + 1
          user_aantwoord  <- readline("Nee! Nog en keer: ")
          Sys.sleep(tijd)
          if(user_aantwoord == aantwoord){
            juist <- juist + 1
            hetperfectum <- hetperfectum[-id, ]
            message(paste0("Goed gedaan! Jij hebt ", juist, " juist perfectum geschreven."))
          }
          # Exit logic
          if(user_aantwoord == "q"){
            return(hetperfectum_einde_spel(juist, fout))
          }
          # End Exit logic

        }

    }

  }

  Sys.sleep(tijd)
  message("Jij hebt alles perfectum juist geschreven. Dankjewel voor spelen!! :)")
  Sys.sleep(tijd)
  return(hetperfectum_einde_spel(juist, fout))
}







