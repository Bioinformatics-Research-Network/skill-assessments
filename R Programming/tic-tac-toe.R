# Two tokens in the game
allowed_tokens = c("X", "O")

# Function to get input from the user
get_input <- function(prompt) {
  if (interactive()) {
    return(readline(prompt))
  } else {
    cat(prompt)
    return(readLines("stdin", n=1))
  }
}

# Function to filter user input against an allowed list
filter_input <- function(input, allowed_inputs){
  if(input %in% allowed_inputs){
    return(input)
  }
  else {
    cat("Not an allowed answer.\n")
    return(NULL)
  }
}

# Function to allow the user to select their token
get_token <- function(allowed_inputs=allowed_tokens){
  token <- NULL
  while(is.null(token)){
    token <- get_input(paste(paste(allowed_tokens, collapse=" or "), "? "))
    token <- filter_input(token, allowed_tokens)
  }
  return (token)
}

# Function to get the user to confirm their move
get_confirmation <- function(token, row, coln){
  conf <- NULL
  while (is.null(conf)){
    conf <- get_input(paste0(c("Place ", token, " on row ", row, " column ", coln, "? [y/n] ")))
    conf <- tolower(conf)
    conf <- filter_input(conf, c("y", "n"))
  }
  return (conf)
}

# Function to get the user's move
get_user_move = function(board, token){
  conf="n"
  while (conf == "n"){
    row = as.integer(get_input("What row? "))
    coln = as.integer(get_input("What column? "))
    if (check_board(board, row, coln)){
      conf = get_confirmation(token, row, coln)
    }
    else{
      cat("That spot is occupied.\n")
    }
  }
  return (c(row, coln))
}

# Function to check if a position on the board is empty
check_board <- function(board, row, coln){
  return(is.na(board[row, coln]))
}

# Function to update the board with the user's move
update_board <- function(board, row, coln, token){
  board[row, coln] <- token
  return(board)
}

# Function for the computer to make its move
make_move <- function(board, token){
  loc <- sample(which(is.na(board)), 1)
  board[loc] <- token
  cat(paste("Player ", token, " made a move.\n"))
  return (board)
}

# Function to check that all elements of list are identical
ident <- function(...){
  args <- c(...) 
  if (length(args) > 2L){
    out <- c(identical(args[1] , args[2]) , ident(args[-1]))
  }else{
    out <- identical(args[1] , args[2])
  }    
  return(all(out))
}

# Function to get antidiagonal of the board
board_antidiag <- function(board) {
  return (board[col(board) + row(board) == 4L])
}

# Function to get the winner
get_winner <- function(board){
  for (token in allowed_tokens){
    if ((3 %in% rowSums(board==token, na.rm=TRUE)) | 
        (3 %in% colSums(board==token, na.rm=TRUE)) | 
        ident(c(diag(board), token)) |
        ident(c(board_antidiag(board), token))){
      return(token)
    }
  }
  if (sum(is.na(board)) == 0){
    return("No one")
  }
  else {
    return(NULL)
  }
}

# Function to play a game
play = function(){
  # Step 1: Get the user's token
  user_token = get_token()
  # Step 2: Get the computer's token
  computer_token = allowed_tokens[allowed_tokens != user_token]
  # Step 3: Initialize the board
  board = matrix(nrow=3, ncol=3)
  win = NULL
  # Step 4: If the user chose O, the computer gets first move
  if (user_token == "O"){
    board = make_move(board, computer_token)
  }
  # Step 5: Until there is a winner, user and computer alternate moves
  while (is.null(win)){
    # User sees the board and moves
    cat("Current board: \n")
    print(board)
    move = get_user_move(board, user_token)
    board = update_board(board, move[1], move[2], user_token)
    cat("Made your move. \n")
    cat("Current board: \n")
    print(board)
    # Check if the user won or the game is over
    win = get_winner(board)
    if (!is.null(win)){
      return (paste(win, " wins!"))
    }
    # The computer makes a move
    board = make_move(board, computer_token)
    # Check if the computer won or the game is over
    win = get_winner(board)
    if (!is.null(win)){
      cat("Current board: \n")
      print(board)
      return (paste(win, " wins!"))
    }
  }
}

if (!interactive()) {
  play()
}
