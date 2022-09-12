# Python programming

This training is intended to help you gain and demonstrate fundamental skills in `python` programming 

## Background and Getting Help

To get the skills in python programming needed to complete this, check out:

DataCamp's introductory python course ([link](https://learn.datacamp.com/courses/intro-to-python-for-data-science)), and intermediate python course ([link](https://learn.datacamp.com/courses/intermediate-python)).

The nice thing about python is that there are millions of programmers who use this language and hundreds of excellent free and paid tutorials for learning it.

You can always visit Henry's office hours ([link](https://calendly.com/millerh1/30min)) and ask for help in the slack group. Don't worry if this takes a while, it's designed to be a challenge. 

## Miniproject: Tic-Tac-Toe

You and your friends love to play the classic game "Tic-Tac-Toe", but you can't play together anymore because of the pandemic! 

Write a python script that will allow you to play a game of Tic-Tac-Toe against your computer using the command line. When you're done, send your script to Henry to test!

Create a script that lets you play a full game of tic-tac-toe, given that:
1. The script has to be executable using `python <your_script.py>` (e.g., `python tic-tac-toe.py`).
2. All the rules of tic-tac-toe are included. `X` always goes first, then `O`. The first to get three-in-a-row wins. A stalemate when no moves remain is a tie.
3. The script should ask the player to choose moves using a prompt (see example). 
4. There should be no errors. No matter what the user inputs, they shouldn't see any errors. 

**Hint**: To get user input on the command line, use the following construct:

```python
symbol = input("X or O? ")
```

**Hint 2**: To avoid the user getting an error, make sure that their inputs are validated. For example, if I ask the user `X or O?` they shouldn't be allowed to answer `B`. In my version of the game (below), if the user enters an invalid response, I send a warning message using the `logging` library and prompt them again -- but you can choose your own way of handling these issues.

**Bonus**: There's no requirement to make it aesthetically nice, but you get bonus points! If you want to, you can use `print()` to make formatted messages to the player. You can also use `time.sleep()` to add pauses that allow the user time to read the screen. 

Here's an example:

![tic-tac-toe-py](https://user-images.githubusercontent.com/44813811/111715575-20790600-8822-11eb-878e-227f6f133ea5.gif)


