# submitted by: Camille Sayoc
# Python Programming module
# code formatted using Black

import numpy as np
import random
import time


class Player(object):
    # create Player class

    # player attributes
    symbol = ""

    def __init__(self, name):
        self.name = name

    def move(self) -> tuple[str, str]:
        # column and row taken by player
        column = input("What column? ")
        row = input("What row? ")

        return column, row


class Computer(object):
    # create Computer player class

    # computer attributes
    symbol = ""

    def __init__(self, name):
        self.name = name

    def auto_move(self) -> tuple[str, str]:
        # random generation of column, row input by computer
        columns = [0, 1, 2]
        rows = [0, 1, 2]

        column = random.choice(columns)
        row = random.choice(rows)

        return str(column), str(row)


def main():
    start = True  # flag to start while loop

    while start:

        symbol = input("X or O? ").upper()  # ask first player what symbol they would choose
        valid_input = ["X", "O"]  # list of valid input symbol

        if symbol in valid_input:

            # create Player objects
            player_1, player_2 = Player("One"), Computer("Two")

            # assign active and passive player
            active, passive = player_1, player_2

            # assign symbols to each Players
            player_1.symbol = valid_input.pop(valid_input.index(symbol))
            player_2.symbol = valid_input[0]

            # initialize board matrix
            board_matrix = np.tile(".", (3, 3))

            play = True  # flag to start while loop prompting players to input column/row

            while play:
                # ask for player's symbol
                print("------------------------------")
                print("Player " + active.symbol + "'s turn: ")
                print()
                time.sleep(1)

                # if active player is the Computer, use auto_move
                if active == player_2:
                    column, row = active.auto_move()

                    # computer should know which moves have already been taken
                    # combination of column, row move is generated until a valid position is given
                    while board_matrix[int(row), int(column)] != ".":
                        column, row = active.auto_move()

                # if active player is player 1, ask for input column and row
                elif active == player_1:
                    column, row = active.move()

                # list of valid inputs to column/row
                valid_moves = [0, 1, 2]

                # check if row and column are digits and if column and row inputs by player is in valid_moves
                if (
                    column.isdigit()
                    and row.isdigit()
                    and (int(column) in valid_moves)
                    and (int(row) in valid_moves)
                ):

                    # confirm move for player 2
                    if active == player_2:
                        confirm_move = "y"
                        print("What column? ", end="")
                        time.sleep(0.7)
                        print(column)
                        print("What row? ", end="")
                        time.sleep(0.7)
                        print(row)
                        print(
                            "Place "
                            + active.symbol
                            + " at column "
                            + column
                            + " and row "
                            + row
                            + "? [y/n]",
                            end=" ",
                        )
                        time.sleep(0.7)
                        print("y")

                    # confirm move for player 1
                    else:
                        confirm_move = input(
                            "Place "
                            + active.symbol
                            + " at column "
                            + column
                            + " and row "
                            + row
                            + "? [y/n] "
                        )

                    # assess confirmation answer by player 1
                    if confirm_move.lower() == "n" and confirm_move.lower() != "y":
                        print("Please re-enter column and row choice.")
                    elif confirm_move.lower() == "y":
                        if board_matrix[int(row), int(column)] != ".":
                            # ask to re-enter column and rows
                            print("Position already taken. Enter new column and row.")
                        else:
                            print("Move confirmed.")
                            time.sleep(1)

                            # put symbol on specified column, row index
                            board_matrix[int(row), int(column)] = active.symbol

                            # show board matrix
                            print("Current board: ")
                            print(board_matrix)
                            time.sleep(1)

                            for i in ["X", "O"]:
                                # check rows
                                for x in [0, 1, 2]:
                                    if (
                                        (board_matrix[0, x] == i)
                                        and (board_matrix[1, x] == i)
                                        and (board_matrix[2, x] == i)
                                    ):
                                        print("Player " + i + " wins!")
                                        play = False
                                        start = False
                                        exit()

                                    if (
                                        (board_matrix[x, 0] == i)
                                        and (board_matrix[x, 1] == i)
                                        and (board_matrix[x, 2] == i)
                                    ):
                                        print("Player " + i + " wins!")
                                        play = False
                                        start = False
                                        exit()

                                # check diagonal
                                if (
                                    (board_matrix[0, 0] == i)
                                    and (board_matrix[1, 1] == i)
                                    and (board_matrix[2, 2] == i)
                                ):
                                    print("Player " + i + " wins!")
                                    play = False
                                    start = False
                                    exit()

                                # check off-diagonal
                                if (
                                    (board_matrix[0, 2] == i)
                                    and (board_matrix[1, 1] == i)
                                    and (board_matrix[2, 0] == i)
                                ):
                                    print("Player " + i + " wins!")
                                    play = False
                                    start = False
                                    exit()

                                # if all positions have been filled up and no one has won, outcome is stalemate
                                if "." not in board_matrix:
                                    print("Stalemate. No player wins.")
                                    play = False
                                    start = False
                                    exit()

                            # switch players
                            active, passive = passive, active
                    else:
                        print("Please re-enter column and row choice.")
                else:
                    print("Invalid column/row given. Enter new column and row.")
        else:
            print("Only X or O allowed")


if __name__ == "__main__":
    main()
