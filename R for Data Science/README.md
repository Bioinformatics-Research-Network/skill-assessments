# R programming

This training is intended to help you gain and demonstrate fundamental skills in `R` programming 

## Tic-Tac-Toe

You and your friends love to play the classic game "Tic-Tac-Toe", but you can't play together anymore because of the pandemic! 

Write an R script that will allow you to play a game of Tic-Tac-Toe against your computer using the command line. When you're done, send your script to Henry to test!

Create a script that lets you play a full game of tic-tac-toe, given that:
1. The script has to be executable using `Rscript <your_script.R>` (e.g., `Rscript tic-tac-toe.R`).
2. All the rules of tic-tac-toe are included. `X` always goes first, then `O`. The first to get three-in-a-row wins. A stalemate when no moves remain is a tie.
3. The script should ask the player to choose moves using a prompt (see example). 

**Hint**: To get user input on the command line, use the following construct:

```
if (interactive()) {
  con <- stdin()
} else {
  con <- "stdin"
}
cat("X or O? ")
symbol <- readLines(con = con, n = 1)
```

This is necessary to ensure that the script works regardless of whether you run it in RStudio or using `Rscript` on the command line. 

**Bonus**: There's no requirement to make it aesthetically nice, but you get bonus points! If you want to, you can use `cat()` to make formatted messages to the player. You can also use `Sys.sleep()` to add pauses that allow the user time to read the screen. 

Here's an example:

![tic-tac-toe](https://user-images.githubusercontent.com/44813811/111565769-f6640d00-8769-11eb-9f06-5076c18b3ab0.gif)



