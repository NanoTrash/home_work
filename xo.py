#отрисовал доску
def show():
    for i in range(0, 9, 3):
        print(*board[i : i+3])
#указал диапазон возможных ходов
def possible_moves(board):
    return (i for i in range(9) if isinstance(board[i], int))

def move(board, p, i):
    return board[:i] + [p] + board[i+1:]
#победные комбинации
def won(board):
    for i, d in (0, 1), (3, 1), (6, 1), (0, 3), (1, 3), (2, 3), (0, 4), (2, 2):
        if board[i] == board[i + d] == board[i + 2*d]:
            return True

def value(board, p, q):
    if won(board):
        return -1
    return -min((value(move(board, p, i), q, p)
                 for i in possible_moves(board)),
                default=0)
#лучший ход для AI
def best_move():
    return min(possible_moves(board),
               key=lambda i: value(move(board, 'O', i), 'X', 'O'))

board = list(range(1, 10))
try:                            
    while True:#критерий окончания игры
        show()
        board = move(board, 'X', int(input('Ходи: ')) - 1)
        if won(board):
            raise Exception('Победа!')
        if board.count('X') == 5:
            raise Exception('Нечья!')
        board = move(board, 'O', best_move())
        if won(board):
            raise Exception('Ты проиграл!')
except Exception as result:
    show()
    print(result)