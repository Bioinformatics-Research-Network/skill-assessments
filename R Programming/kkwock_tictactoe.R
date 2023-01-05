# install.packages("styler")
#library(styler)

# Function
random.fill <- function(mat, choice){
  empty.idx <- which(mat=='', mat)
  mat[sample(empty.idx, 1)] <- choice
  return(mat)
}
# Create an Empty Matrix
mat <- matrix('', nrow=3, ncol=3, byrow=T)

# Ask for User Input
# Choose X or O
user.choice <- readline(prompt="X or O?: ")

# Catch for empty input
while(user.choice==''){
  print("Input is empty.")
  user.choice <- readline(prompt="X or O?: ")
}

# Catch for invalid input
while(!(toupper(user.choice) %in% c("X", "O"))){
  print("Input invalid.")
  user.choice <- readline(prompt="X or O?: ")
}

# X goes first, O goes second
npc.choice <- if(toupper(user.choice) == 'O') 'X' else 'O'

if(user.choice=='O'){
  print('You go Second.')
}else{
  print('You go First.')
}


win = F

while(win = F){
  if(user.choice=='O'){
    # random first
    mat <- random.fill(mat, npc.choice)
    mat
    
    # user fill 
    rn <- as.numeric(readline(prompt="Which row?: "))
    cn <- as.numeric(readline(prompt="Which column?: "))
    mat[rn, cn] <- user.choice
    mat
    
  }else if(user.choice=='X'){
    # print board
    mat 
    
    # user fill
    rn <- as.numeric(readline(prompt="Which row?: "))
    cn <- as.numeric(readline(prompt="Which column?: "))
    mat[rn, cn] <- user.choice
    mat
    
    # random second
    mat <- random.fill(mat, npc.choice)
    mat
  }
}

# Check Win Function
win.check <- function(x){
  # win combinations
  win.combos <- list(c(1,2,3), c(4,5,6), c(7,8,9), # Row
                     c(1,4,7), c(2,5,8), c(3,7,9), # Col
                     c(1,5,9), c(7,5,3)) # Diag
  
  val <- unlist(as.list(mat))
  for(i in win.combos){
    result <- unique(val[i]) == c("X", "O")
    win = if(any(result == T)) T else F
    
  }
  
  return(result)
}
