
print("TIC-TAC-TOE \nGAME...\n")
print(30*' ', "   reference:    ")
print(30*' ', '     |    |      ')
print(30*' ', '  1  | 2  | 3    ')
print(30*' ', "-----+----+----- ")
print(30*' ', "     |    |      ")
print(30*' ', "  4  | 5  | 6    ")
print(30*' ', "-----+----+----- ")
print(30*' ', "     |    |      ")
print(30*' ', "  7  | 8  | 9    \n")


def display_board():
    print()
    print('                               reference:')
    print('     |    |     ', 10*' ', '     |    |   ',)
    print('  '+board[1]+'  | '+board[2]+'  | ' +
          board[3]+'   ', 10*' ', '  1  | 2  | 3  ')
    print('-----+----+-----', 10*' ', "-----+----+-----")
    print('     |    |     ', 10*' ', "     |    |     ")
    print('  '+board[4]+'  | '+board[5]+'  | ' +
          board[6]+'   ', 10*' ', "  4  | 5  | 6   ")
    print('-----+----+-----', 10*' ', "-----+----+-----")
    print('     |    |     ', 10*' ', "     |    |      ")
    print('  '+board[7]+'  | '+board[8]+'  | ' +
          board[9]+'   ', 10*' ', "  7  | 8  | 9    \n\n")


def human_input(mark):
    while True:
        inp = input(f"[HUMAN] '{mark}' Enter your choice:")
        if inp.isdigit() and int(inp) < 10 and int(inp) > 0:
            inp = int(inp)
            if board[inp] == " ":
                return inp
            else:
                print(f"[HUMAN] '{mark}' place already taken.")
        else:
            print(f"[HUMAN] '{mark}' Enter valid option (1 - 9).")


def winning(mark, board):
    winning_place = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [
        1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    for win_place in winning_place:
        if board[win_place[0]] == board[win_place[1]] == board[win_place[2]] == mark:
            return True


def win_move(i, board, mark):
    temp_board = list(board)
    temp_board[i] = mark
    if winning(mark, temp_board):
        return True
    else:
        return False


def cpu_input(cpu, human, board):
    for i in range(1, 10):
        if board[i] == ' ' and win_move(i, board, cpu):
            return i
    for i in range(1, 10):
        if board[i] == ' ' and win_move(i, board, human):
            return i
    for i in [5, 1, 7, 3, 2, 9, 8, 6, 4]:
        if board[i] == ' ':
            return i


def new_game():
    while True:
        nxt = input('[HUMAN] Do you want to play again?(y/n):')
        if nxt in ['y', 'Y']:
            again = True
            break
        elif nxt in ['n', 'N']:
            print('Have a great day')
            again = False
            break
        else:
            print('Enter correct input')
    if again:
        print('__________NEW GAME__________')
        main_game()
    else:
        return False


def win_check(human, cpu):
    winning_place = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [
        1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    for win_place in winning_place:
        if board[win_place[0]] == board[win_place[1]] == board[win_place[2]] == human:
            print('[HUMAN] wins the match!')
            if not new_game():
                return False
        elif board[win_place[0]] == board[win_place[1]] == board[win_place[2]] == cpu:
            print('[CPU] wins the match!')
            if not new_game():
                return False
    if ' ' not in board:
        print('MATCH DRAW!!')
        if not new_game():
            return False
    return True


def user_choice():
    while True:
        inp = input('[HUMAN]Choose your mark[x/o]: ')
        if inp in ['x', 'X']:
            print('[HUMAN]You choose "X".\n[HUMAN]You play first.')
            return 'x', 'o'
        elif inp in ['O', 'o']:
            print('[HUMAN] You choose "O".\n[HUMAN] CPU plays first.')
            return 'o', 'x'
        else:
            print('[HUMAN] Enter correct input!')


def main_game():
    global board
    play = True
    board = ['', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    human, cpu = user_choice()
    display_board()
    while play:
        if human == 'x':
            x = human_input(human)
            board[x] = human
            display_board()
            play = win_check(human, cpu)
            if play:
                o = cpu_input(cpu, human, board)
                print(f'[CPU] Entered:{o}')
                board[o] = cpu
                display_board()
                play = win_check(human, cpu)
        else:
            x = cpu_input(cpu, human, board)
            print(f'[CPU] Entered:{x}')
            board[x] = cpu
            display_board()
            play = win_check(human, cpu)
            if play:
                o = human_input(human)
                board[o] = human
                display_board()
                play = win_check(human, cpu)


if __name__ == '__main__':
    main_game()
