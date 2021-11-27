# 1st iteration of TicTacToe
# Finally got the interface going, can detect incorrect selections when prompted X or O, player turn seems good to go,
# However, the computer opponent fails to move forward with random selection
# likely issue with data input and sampling 

my_df <- data.frame(
  "Col1" = c("NA","NA","NA"),
  "Col2" = c("NA","NA","NA"),
  "Col3" = c("NA","NA","NA")
)
rownames(my_df) <- c("1", "2", "3")
colnames(my_df) <- c("1", "2", "3")
sel_col = 0
sel_row = 0
interactive = 1
end = FALSE
win_cases <- list(c(1,2,3), c(4,5,6), c(7,8,9), c(1,5,9), c(3,5,7), c(2,5,8), c(3,6,9))

# don't place character outside of board
check_valid <- function(my_df, character){
  while(TRUE){
    cat(paste0("Player ",character," Turn: "))
    cat("Which row? ")
    sel_row = readLines(con = con, n = 1)
    if (!sel_row %in% seq(1:3)) {
      cat("That selection ain't on the board, yo. Please pick a number between 1 and 3.", "\n")
      next()
    }
    cat("Which column? ")
    sel_col = readLines(con = con, n = 1)
    if (!sel_col %in% seq(1:3)) {
      cat("That selection ain't on the board, yo. Please pick a number between 1 and 3.", "\n")
      next()
    } else if(my_df[as.numeric(sel_col),as.numeric(sel_row)] == "X" | my_df[as.numeric(sel_col), as.numeric(sel_row)] == "O"){
        cat("That space's already taken, yo. Find somewhere else to place your selection", "\n")
        next()
        } else {
          break()
          }
  }
}


# place selection on board
move <- function(sel_row, sel_col, my_df, character){
  character == my_df[sel_row, sel_col] 
  my_df
}

player_turn <- function(sel_row, sel_col, my_df, character){
  my_df = move(sel_row, sel_col, my_df, character)
  cat("Finally you chose something. Took you long enough.","\n")
  cat("Current board: ", "\n")
  my_df
}

opponent_turn <- function(my_df, character){
  cat("Computer's turn ('I don't think you can beat me'):", "\n")
  # if(is.numeric(my_df) == TRUE) {   # if the data frame is numeric, then no X and/or O exists yet.
  #   sel_row = sample(seq(1:3), 1)
  #   sel_col = sample(seq(1:3), 1)
  #   my_df = move(sel_row, sel_col, my_df, character)
  # } else {
  if(length(which(my_df == "X" | my_df == "O")) == 8){ # if there is only 1 free "space" left, use that "space"
    final_space = my_df[-which(my_df == "X" | my_df == "O"),-which(my_df == "X" | my_df == "O")]
    my_df[final_space] = character
    my_df
    } else {
      space = sample(as.numeric(my_df[-which(my_df == "X" | my_df[1:] == "O")]), 1) # otherwise, choose random "space" from the remaining free "spaces"
      my_df[space] = character ## FIX PREVIOUS LINE; YOU FORGOT TO FACTOR ROW AND COLUMN SEPARATELY
    }
  }
  cat("Current board:", "\n")
  my_df
#}

#### STOPPED HERE. NEED TO FIX COMPUTER INPUT FOR FINDING A RANDOM EMPTY SPOT ACCORDING TO ROW AND COLUMN
#### IDEAS INCLUDE MAKING PAIRS OF ALL EMPTY SPOTS AND SAMPLING THEM

# win or draw
who_won <- function(my_df){ 
  winner = FALSE
  for(i in 1:length(win_cases)){
    if(sum(which(my_df == "X") %in% win_cases[[i]]) >= 3){
      cat("X won some extra intelligence points.", "\n")
      winner = TRUE
      next()
    } else if (sum(which(my_df == "O") %in% win_cases[[i]]) >= 3){
      cat("O won some extra intelligence points.", "\n")
      winner = TRUE
    } 
  }
  if(length(which(my_df == "X" | my_df == "O")) == 9 && winner == FALSE){
    cat("It's a draw! Y'all are either really good or really bad at playing this game, and it's hard to say which one is the case.", "\n")
    winner = TRUE
  }
  return(winner)
}

# Actual code for the game
play <- function(my_df, character){
  if (character == "X"){ # if player chooses X => player first, then computer
    cat("Current Board: ", "\n")
    my_df
    while(end == FALSE){
      sel = check_valid(my_df, character)
      my_df = player_turn(sel_row, sel_col, my_df, character)
      return(my_df)
      end = who_won(my_df)
      if(end){
        break
      }
      my_df = opponent_turn(my_df, "O") ## ISSUE WITH OPPONENT TURN
      my_df
      end = who_won(my_df)
      if(end){
        break
      }
    }
  } else { # if player chooses O => computer first, then player
    while(end == FALSE){
      my_df = opponent_turn(my_df, "X")
      my_df
      end = who_won(my_df)
      if(end){
        break
      }
      sel = check_valid(my_df, character)
      my_df = player_turn(sel_row, sel_col, my_df, character)
      my_df
      end = who_won(my_df)
      if(end){
        break
      }
    }
  }
}

# Interface with the game itself
if (interactive()) {
  con <- stdin()
} else {
  con <- "stdin"
}
while(TRUE){ 
  cat("X or O? ") 
  character <- readLines(con = con, n = 1)
  uppercase <- toupper(character) # doesn't matter if the input is uppercase or lowercase, it will convert to uppercase
  if (uppercase != "X" & uppercase != "O"){ 
    cat("That selection ain't right, yo. Please pick either X or O.", "\n \n")
    next()
  } else{
    character <- uppercase
    break
  }
}

play(my_df,character)