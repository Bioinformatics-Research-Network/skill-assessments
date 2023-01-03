# install.packages("styler")
#library(styler)

# Function
random.fill <- function(mat, choice){
  empty.idx <- which(mat==0, mat)
  mat[sample(empty.idx, 1)] <- choice
  return(mat)
}
# Create an Empty Matrix
mat <- matrix(0, nrow=3, ncol=3, byrow=T)

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
  print('O goes second.')
  
  # random first
  mat <- random.fill(mat, npc.choice)
}else if(user.choice=='X'){
  
}

#rowsum to check
# for diagonals, use identity matrix