# install.packages("styler")
#library(styler)

# Stalemate Test
# stale <- structure(c("O", "X", "O", "X", "X", "O", "X", "O", "X"), dim = c(3L, 3L)) # for testing 

#---- Functions ----# 
# NPC random space filler
random.fill <- function(mat, choice){
  empty.idx <- which(mat=='', mat)
  mat[sample(empty.idx, 1)] <- choice
  return(mat)
}

# Win check
win.check <- function(mat){
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

# Empty space check
user.input <- function(mat){
  # check if input is within range (1-3)
  rn <- n.check(as.numeric(readline(prompt="Which row? (1-3): ")), 'row')
  cn <- n.check(as.numeric(readline(prompt="Which column? (1-3): ")), 'col')
  
  while(mat[rn, cn] != ''){ 
    # if field is not empty, ask user to input again
    print("Space is already filled. Choose another.")
    print(mat)
    rn <- n.check(as.numeric(readline(prompt="Which row? (1-3): ")), 'row')
    cn <- n.check(as.numeric(readline(prompt="Which column? (1-3): ")), 'col')
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

# ---- Tic Tac Toe ----# 
# Create an Empty Matrix
mat <- matrix('', nrow=3, ncol=3, byrow=T)
players <- c("X", "O")

# Choose X or O
user.choice <- player.check()

# X goes first, O goes second
npc.choice <- if(user.choice == 'O') 'X' else 'O'
win = F
round = 0

if(user.choice=='O'){
  print("You go second.")
  while(win == F & round < 5){
    round = round + 1
    # npc first
    print("NPC's turn")
    mat <- random.fill(mat, npc.choice)
    print(mat)
    
    results <- win.check(mat)
    win <- results[1]
    
    # user fill 
    if(win == F) print("Your turn") else print("Game Over")
    mat <- user.input(mat)
    print(mat)
    
    results <- win.check(mat)
    win <- results[1]
  }
}else if(user.choice=='X'){
  print("You go first.")
  while(win == F & round < 5){
    round = round + 1
    # print board
    print(mat)
    
    # user fill 
    print("Your turn")
    mat <- user.input(mat)
    print(mat)
    
    results <- win.check(mat)
    win <- results[1]
    
    # npc second
    if(win == F) print("Your turn") else print("Game Over")
    mat <- random.fill(mat, npc.choice)
    
    results <- win.check(mat)
    win <- results[1]
  }
}

# Results
if(win==T){
  print(paste((players[results[2]]), "Wins")  )
}else if(win == F & round == 5){
  print("Stalemate")
}
