import numpy as np
import sys
import time

def select_player():
    symbol = input("Please select X or O: ")
    symbol = symbol.upper()
    
    while symbol not in ["X", "O"]:
        symbol = input("Please choose either 'X' or 'O': ")
        symbol = symbol.upper()
    
    return symbol

def display_board(pos, check, comp_move=False):
    dim = int(np.sqrt(len(pos)))
    board = np.array(pos).reshape((dim, dim))
    
    print()
    if check == 2:
        print("Final board:")
    else:
        print("Current board:")
    
    print()
    sys.stdout.flush()
    for row in range(dim):
        if row == dim - 1:
            print(f" {board[row, 0]} | {board[row, 1]} | {board[row, 2]} ")
        else:
            print(f" {board[row, 0]} | {board[row, 1]} | {board[row, 2]} ")
            print(" ---+---+--- ")
    
    print()
    sys.stdout.flush()
    if check != 2 and not comp_move:
        print("Please select one of the open positions above")
    
    time.sleep(1.5)

def select_position():
    input_pos = input("Enter a number between 1 and 9: ")
    
    while input_pos not in map(str, range(1, 10)):
        input_pos = input("Invalid input. Please choose a number between 1 and 9: ")
    
    return int(input_pos)

def invalid_check(pos, input_pos):
    open_pos = [i + 1 for i, val in enumerate(pos) if val not in ["X", "O"]]
    if len(open_pos) == len(pos):
        return input_pos
    else:
        while input_pos not in open_pos:
            input_pos = select_position()
            input_pos = invalid_check(pos, input_pos)
        return input_pos

def confirm_pos(symbol, input_pos):
    answer = input(f"Place '{symbol}' at position {input_pos}? [y/n]: ")
    
    while answer not in ["y", "n"]:
        answer = input("Invalid input. Please select 'y' or 'n': ")
    
    return answer

def update_position(input_pos, pos, symbol):
    input_pos = invalid_check(pos, input_pos)
    answer = confirm_pos(symbol, input_pos)
    
    if answer == "y":
        pos[input_pos - 1] = symbol
    else:
        while answer == "n":
            print("Please select another position")
            input_pos = select_position()
            input_pos = invalid_check(pos, input_pos)
            answer = confirm_pos(symbol, input_pos)
        pos[input_pos - 1] = symbol
    
    return pos

def computer_move(pos, symbol, check):
    open_pos = [i + 1 for i, val in enumerate(pos) if val not in ["X", "O"]]
    if len(open_pos) > 0 and check != 2:
        print("Computer moved")
        move = np.random.choice(open_pos)
        
        if symbol == "X":
            comp_sym = "O"
        elif symbol == "O":
            comp_sym = "X"
        
        pos[move - 1] = comp_sym
    
    return pos

def check_winner(pos):
    open_pos = [i + 1 for i, val in enumerate(pos) if val not in ["X", "O"]]
    win_combos = [
        pos[:3], pos[3:6], pos[6:9],
        pos[::3], pos[1::3], pos[2::3],
        pos[::4], pos[2:8:2]
    ]
    
    for win in win_combos:
        check = sum(np.unique(win, return_counts=True)[1] > 1)
        if check == 2:
            print(f"\nPlayer {win[0]} wins!")
            sys.stdout.flush()
            return check
    
    if len(open_pos) == 0 and check != 2:
        print("\nIt's a draw!")
        sys.stdout.flush()
        check = 2
    
    return check

print("Welcome to Taylor's tic tac toe showdown!\n")
sys.stdout.flush()

pos = list(range(1, 10))
symbol = select_player()
check = check_winner(pos)
time.sleep(1.5)
display_board(pos, check)
while check != 2:
    input_pos = select_position()
    pos = update_position(input_pos, pos, symbol)
    
    if check != 2:
        check = check_winner(pos)
        if check == 2:
            time.sleep(1.5)
            display_board(pos, check)
            break

    time.sleep(1.5)
    display_board(pos, check, comp_move=True)
    time.sleep(1.5)
    pos = computer_move(pos, symbol, check)
    
    if check != 2:
        check = check_winner(pos)
        if check == 2:
            time.sleep(1.5)
            display_board(pos, check)
            break
        
    time.sleep(1.5)
    display_board(pos, check)
