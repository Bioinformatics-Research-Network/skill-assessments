## attempting to build a tic tac toe


library(tidyverse)
pl_c = c() # player's "character" O or X
co_c = c() # computer's "character" O or X
tic = c() # tic is a value chosen by the player.
board <- data.frame(a=c(1,2,3), b=c(4,5,6), c=c(7,8,9)) # board

# use this to print the board
#invisible(sapply(board, cat, "\n"))

noboard <- c(1, 2, 3, 4, 5, 6, 7, 8, 9) # for easier random function.
# for example sample(1:length(noboard))[1]
rdsp <- c() # random spot
col_p <- c() # locate where the player picked column
row_p <- c() # locate where the player picked row
pl_l = c() # player character's placements.
co_l = c()


# initialize()

initialize <- function(){
  if (interactive()) {
    con <- stdin()
  } else {
    con <- "stdin"
  }
  cat("X or O? \n")
  pl_c <- readLines(con = con, n = 1)
  pl_c <- toupper(pl_c)
  if (pl_c == "X"){
    cat("You chose X \n")
    co_c = "O"
  }else if(pl_c == "O"){
    cat("You chose O \n")
    co_c = "X"
  }else{
    cat("I will choose one for you, X \n")
    pl_c = "X"
    co_c = "O"
  }
  return(c(pl_c, co_c))
}

# playturn()

playturn <- function(board, noboard, pl_c, pl_l){
  #player turn
  
  cat("###################\n   PLAYER's TURN \n###################\n")
  if (interactive()) {
    con <- stdin()
  } else {
    con <- "stdin"
  }
  invisible(sapply(board, cat, "\n"))
  
  # placement of the player
  cat("Where do you want to place \n")
  tic <- readLines(con = con, n = 1)
  tic <- as.numeric(tic)
  if (is.na(tic)){
    cat("what is wrong with you? \n")
    Sys.sleep(1)
    cat("I will choose a random spot for you \n")
    rdsp <- sample(1:length(noboard))[1]
    tic <- noboard[rdsp]
  }else{
    if (tic %in% noboard){
      
    }else{
      cat("what is wrong with you?\n")
      Sys.sleep(1)
      cat("I will choose a random spot for you\n")
      rdsp <- sample(1:length(noboard))[1]
      tic <- noboard[rdsp]
    }
  }
  col_p <- which(board==tic, arr.ind=TRUE)[2]
  row_p <- which(board==tic, arr.ind=TRUE)[1]
  pl_l <- c(pl_l, tic)
  board[row_p, col_p] <- pl_c
  noboard <- noboard[-which(noboard==tic)]
  tic <- c()
  Sys.sleep(1)
  ## finished placing
  return(list(board, noboard, pl_l))
}

# compturn()

compturn <- function(board, noboard, co_c, co_l){
  cat("###################\n  COMPUTER's TURN \n###################\n")
  Sys.sleep(1)
  
  rdsp <- sample(1:length(noboard))[1]
  tic <- noboard[rdsp]
  col_p <- which(board==tic, arr.ind=TRUE)[2]
  row_p <- which(board==tic, arr.ind=TRUE)[1]
  co_l <- c(co_l, tic)
  board[row_p, col_p] <- co_c
  noboard <- noboard[-which(noboard==tic)]
  tic <- c()
  return(list(board, noboard, co_l))
}

# playwin()
## need to modify the return values.
## may be if 'win" == 1, else == 0?
playwin <- function(pl_l){
  # check whether player won or not.
  result <- case_when(
    
    (1 %in% pl_l) ~ (case_when(
      (2 %in% pl_l && 3 %in% pl_l) ~ 1,
      (4 %in% pl_l && 7 %in% pl_l) ~ 1,
      (5 %in% pl_l && 9 %in% pl_l) ~ 1,
      TRUE ~ 0
      )),
    (2 %in% pl_l) ~ 
      (if (5 %in% pl_l && 8 %in% pl_l){
        1
      }else {0}),
    (3 %in% pl_l) ~ (case_when(
      (6 %in% pl_l && 9 %in% pl_l) ~ 1,
      (5 %in% pl_l && 7 %in% pl_l) ~ 1,
      TRUE ~ 0
      )),
    (4 %in% pl_l) ~
      (if (5 %in% pl_l && 6 %in% pl_l){
        1
      }else {0}),
    (7 %in% pl_l) ~ 
      (if (8 %in% pl_l && 9 %in% pl_l){
        1
      }else {0}),
    TRUE ~ 0
    )
  return(result)
}

# compwin()

play <- function(){
  
  ## initialize the game
  initialized <- initialize()
  pl_c <- initialized[1]
  co_c <- initialized[2]
  
  ## check whether computer should go first
  if (pl_c == "O"){
    coturn <- compturn(board, noboard, co_c, co_l)
    board <- coturn[[1]]
    noboard <- coturn[[2]]
    co_l <- coturn[[3]]
    invisible(apply(board, 2, cat, "\n"))
  }
  
  repeat{
    
    ## player turn
    plturn <- playturn(board, noboard, pl_c, pl_l)
    board <- plturn[[1]]
    noboard <- plturn[[2]]
    pl_l <- plturn[[3]]
    
    ## check for player win
    if (playwin(pl_l) == 1){
      invisible(sapply(board, cat, "\n"))
      return(cat("You won the game. Congrats"))
    }
    if (length(noboard)==0){
      return(cat("The game ended in a draw"))
    }
    
    ## computer turn
    coturn <- compturn(board, noboard, co_c, co_l)
    board <- coturn[[1]]
    noboard <- coturn[[2]]
    co_l <- coturn[[3]]
    invisible(sapply(board, cat, "\n"))
    
    
    if (playwin(co_l) == 1){
      return(cat("You lost the game. How?"))
    }
    if (length(noboard)==0){
      return(cat("The game ended in a draw"))
    }
  }
  
  
}

play()

