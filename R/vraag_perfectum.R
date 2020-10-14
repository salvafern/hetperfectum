vraag_perfectum <- function(){
  # load data
  data(hetperfectum)

  # points
  score <- 0

  # Spelen logik
  while(nrow(hetperfectum) > 0){

    id <- sample(1:nrow(hetperfectum), 1)

    vraag <- hetperfectum$Infinitief[id]
    aantwoord <- hetperfectum$Perfectum[id]

    message(paste0('Wat is het Perfectum van "', vraag, '"?'))
    user_aantwoord <- readline("Jouw aandwoord: ")

    # Exit logic
    if(user_aantwoord == "q"){
      return(message(paste0("Jij heeft ", score, ". Goed gedaan!")))
    }
    # End Exit logic

    if(user_aantwoord == aantwoord){
      message("Ja!")
      hetperfectum <- hetperfectum[-id, ]
      score <- score + 1
    }else{
        while(user_aantwoord != aantwoord){
          user_aantwoord  <- readline("Nee! Nog en keer: ")
          if(user_aantwoord == aantwoord){score <- score + 1}
          # Exit logic
          if(user_aantwoord == "q"){
            return(message(paste0("Jij heeft ", score, " gegeven. Goed gedaan!")))
          }
          # End Exit logic

        }

    }

  }



}
