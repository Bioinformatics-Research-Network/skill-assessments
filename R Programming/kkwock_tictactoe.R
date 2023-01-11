# install.packages("styler")
# library(styler)

# Stalemate Test
# stale <- structure(c("O", "X", "O", "X", "X", "O", "X", "O", ""), dim = c(3L, 3L)) # for testing 

#---- Functions ----# 
# NPC random space filler
random.fill <- function(x, choice){
  empty.idx <- which(x=='')
  x[unlist(sample(as.list(empty.idx), 1))] <- choice
  return(x)
}

# Win check
is.win <- function(mat){
  # win combinations
  win.combos <- list(c(1,2,3), c(4,5,6), c(7,8,9), # col
                     c(1,4,7), c(2,5,8), c(3,7,9), # row
                     c(1,5,9), c(7,5,3)) # Diag
  
  val <- unlist(as.list(mat))
  win = 0
  
  for(i in win.combos){
    n <- unique(val[i])
    if(length(n) > 1){
      win = win + 0
    }else if(length(n)==1 & n != ""){
      player.win <- which(n== c("X", "O"))
      win = win + 1
    }
  }
  if(win > 0){
    return(c(TRUE, player.win))
  }else{
    return(c(FALSE, NULL))
  }
}

# Valid Row/Col number
n.check <- function(x, pos){
  while(!(x %in% 1:3)){
      print("Input invalid")
      if(pos == 'row'){
        x <- as.numeric(readline(prompt="Choose row (1-3): "))
      }else if(pos == 'col'){
        x <- as.numeric(readline(prompt="Choose column (1-3): "))
      }
  }
  return(x)
}

# confirm check 
confirm.check <- function(x){
  while(!(x %in% c("Y", "y", "N", "n"))){
    x <- readline(prompt="Input invalid. Please type y (yes) or n (no) to confirm move: ")
  }
  return(x)
}

# Empty space check
user.input <- function(mat){
  # check if input is within range (1-3)
  confirm <- 'n'
  while(confirm == 'n'){
    rn <- n.check(as.numeric(readline(prompt="Which row? (1-3): ")), 'row')
    cn <- n.check(as.numeric(readline(prompt="Which column? (1-3): ")), 'col')
    confirm <- confirm.check(readline(prompt=paste0("Place your move on Row ", rn, 
                                                    ", Column ",cn ,"? (y/n): ")))
  }
  while(mat[rn, cn] != ''){ 
    # if field is not empty, ask user to input again
    confirm <- 'n'
    print("Space is already filled. Choose another.")
    # print(mat)
    while(confirm == 'n'){
      rn <- n.check(as.numeric(readline(prompt="Which row? (1-3): ")), 'row')
      cn <- n.check(as.numeric(readline(prompt="Which column? (1-3): ")), 'col')
      confirm <- confirm.check(readline(prompt=paste0("Place your move on Row ", rn, 
                                                      ", Column ",cn ,"? (y/n): ")))
    }
  }
  # fill input into matrix
  mat[rn, cn] <- user.choice
  return(mat)
}

# Player choice function
player.check <- function(){
  user.choice <- toupper(readline(prompt="X or O?: "))
  # Catch for empty input
  while(user.choice==''){
    print("Input is empty.")
    user.choice <- toupper(readline(prompt="X or O?: "))
  }
  
  # Catch for invalid input
  while(!(user.choice %in% players)){
    print("Input invalid.")
    user.choice <- toupper(readline(prompt="X or O?: "))
  }
  
  return(user.choice)
}

# Print Round
print.round <- function(x){
  cat("\n\n#### Round", as.character(x), "####\n\n")
}

# ---- Tic Tac Toe ----# 
players <- c("X", "O")

# Choose X or O
user.choice <- player.check()

# X goes first, O goes second
npc.choice <- if(user.choice == 'O') 'X' else 'O'

# Create an Empty Matrix
mat <- matrix('', nrow=3, ncol=3, byrow=T)
win = F
r = turn = 0
total.turns = 9

if(user.choice=='O'){
  cat("\nO goes second.\n")
  
  while(win == F & turn < total.turns){
    # NPC Goes first
    turn = turn + 1
    r <- r + 1
    print.round(r)
    mat <- random.fill(mat, npc.choice)
    results <- is.win(mat)
    win <- results[1]
    
    # user fill second
    if(win == F & turn < total.turns){
      print(mat)
      turn = turn + 1
      cat("\nYour turn\n")
      mat <- user.input(mat)
      # print(mat)
    }
  
    results <- is.win(mat)
    win <- results[1]
  }
}else if(user.choice=='X'){
  cat("\nX goes first.\n")
  while(win == F & turn < total.turns){
    # print board
    r <- r + 1
    print.round(r)
    
    print(mat)
    
    # user fill 
    turn = turn + 1
    cat("\nYour turn\n")
    mat <- user.input(mat)
    # print(mat)
    
    results <- is.win(mat)
    win <- results[1]
    
    # npc second
    if(win == F & turn < total.turns){
      turn = turn + 1
      # print("NPC's turn") # Print Round?
      mat <- random.fill(mat, npc.choice)
      # print(mat)
    }
    
    results <- is.win(mat)
    win <- results[1]
  }
}

# Results
if(win==T){
  print(mat)
  cat("\nGame Over\n")
  cat(paste((players[results[2]]), "Wins")  )
}else if(win == F & turn == total.turns){
  print(mat)
  cat("\n\nStalemate")
}
