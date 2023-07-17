library(stringr)
suppressMessages(library(data.table))

select_player <- function(con) {
  cat("Please select x or o?  ")
  symbol <- readLines(con = con, n = 1)
  symbol <- as.character(symbol)

  while (!(symbol %in% c("X", "O", "x", "o"))) {
    cat("Please choose either 'x' or 'o' ")
    symbol <- readLines(con = con, n = 1)
    symbol <- as.character(symbol)
  }
  return(symbol)
}

display_board <- function(pos, check, comp_move = FALSE) {
  dim <- sqrt(length(pos))
  board <- data.table(matrix(data = pos, ncol = dim, nrow = dim))

  cat("\n")
  if (check == 2) {
    cat("Final board:")
  } else {
    (
      cat("Current board:")
    )
  }

  cat("\n")
  Sys.sleep(1)
  for (n in 1:dim(board)[1]) {
    if (n == dim(board)[1]) {
      cat(" ", board[[n, 1]], "|", board[[n, 2]], "|", board[[n, 3]], "\n")
    } else {
      cat(" ", board[[n, 1]], "|", board[[n, 2]], "|", board[[n, 3]], "\n")
      cat(" ---+---+---", "\n")
    }
  }
  cat("\n")
  if (check != 2 & comp_move == FALSE) {
    Sys.sleep(1.5)
    cat("Please select one of the open positions above ")
  }
}

select_position <- function(con) {
  input_pos <- readLines(con = con, n = 1)

  while (!(input_pos %in% c(1:9))) {
    cat("Invalid input. Please choose a number between 1 and 9:  ")
    input_pos <- readLines(con = con, n = 1)
  }

  input_pos <- as.integer(input_pos)

  return(input_pos)
}

invalid_check <- function(pos, input_pos) {
  open_pos <- which(!(pos == "x" | pos == "o"))
  if (length(open_pos) == length(pos)) {
    return(input_pos)
    break
  } else {
    while (!(input_pos %in% open_pos)) {
      cat("Oh no! That position is invalid, please select another position:  ")
      input_pos <- select_position(con)
    }
    return(input_pos)
  }
}

confirm_pos <- function(symbol, input_pos) {
  cat(sprintf("Place '%s' at position %s? [y/n] ", symbol, input_pos))
  answer <- readLines(con = con, n = 1)

  while (!(answer %in% c("y", "n"))) {
    cat("Invalid input. Please select y or n:  ")
    answer <- readLines(con = con, n = 1)
  }

  answer <- as.character(answer)
  return(answer)
}

update_position <- function(input_pos, pos, symbol) {
  input_pos <- invalid_check(pos, input_pos)
  answer <- confirm_pos(symbol, input_pos)
  if (answer == "y") {
    pos[input_pos] <- symbol
  } else {
    while (answer == "n") {
      cat("Please select another position  ")
      input_pos <- select_position(con)
      input_pos <- invalid_check(pos, input_pos)
      answer <- confirm_pos(symbol, input_pos)
    }
    pos[input_pos] <- symbol
  }
  return(pos)
}

computer_move <- function(pos, symbol, check) {
  open_pos <- which(!(pos == "x" | pos == "o"))
  if (length(open_pos) > 0 & check != 2) {
    cat("Computer moved ")
    cat("\n")
    move <- sample(open_pos, 1)

    if (symbol == "X") {
      comp_sym <- "O"
    } else if (symbol == "x") {
      comp_sym <- "o"
    } else if (symbol == "O") {
      comp_sym <- "X"
    } else if (symbol == "o") {
      comp_sym <- "x"
    }

    pos[move] <- comp_sym

    return(pos)
  } else {
    return(pos)
  }
}

check_winner <- function(pos) {
  open_pos <- which(!(pos == "x" | pos == "o"))
  win_combos <- list(
    pos[1:3], pos[4:6], pos[7:9],
    c(pos[c(1, 4, 7)]), c(pos[c(2, 5, 8)]), c(pos[c(3, 6, 9)]),
    c(pos[c(1, 5, 9)]), c(pos[c(3, 5, 7)])
  )
  for (win in win_combos) {
    check <- sum(duplicated(win))

    if (check == 2) {
      Sys.sleep(1.5)
      cat("\n")
      cat(sprintf("Player %s wins!", win[[1]]))
      break
    }
  }
  if (length(open_pos) == 0 & check != 2) {
    Sys.sleep(1.5)
    cat("\n")
    cat("It's a draw!")
    check <- 2
  }
  return(check)
}

if (interactive()) {
  con <- stdin()
} else {
  con <- "stdin"
}

cat("Welcome to Taylor's tic tac toe showdown!\n")
cat("\n")
Sys.sleep(1.5)
numRows <- 3
numCols <- 3
pos <- as.numeric(1:(numRows * numCols))

symbol <- select_player(con)
check <- check_winner(pos)
Sys.sleep(1.5)
display_board(pos, check)
while (check != 2) {
  input_pos <- select_position(con)
  pos <- update_position(input_pos, pos, symbol)
  if (check != 2) {
    check <- check_winner(pos)
    if (check == 2) {
      Sys.sleep(1.5)
      display_board(pos, check)
      break
    }
  }
  Sys.sleep(1.5)
  display_board(pos, check, comp_move = TRUE)
  Sys.sleep(1.5)
  pos <- computer_move(pos, symbol, check)
  if (check != 2) {
    check <- check_winner(pos)
    if (check == 2) {
      Sys.sleep(1.5)
      display_board(pos, check)
      break
    }
  }
  Sys.sleep(1.5)
  display_board(pos, check)
}
