def draw_board(board)
    (0..8).each do |index|
        #za dobiti ploču 3x3
        if index % 3 == 2
            print " [#{board[index]}] \n"
        else
            print " [#{board[index]}] "
        end
    end
end

def init_board(board)
    (0..8).each do |no|
        board[no] = no
    end
end

def play_turn(player, board)
    ask_again = true
    while ask_again
        ask_again = false
        print "Enter field: "
        field = gets.to_i

        if board[field] == 'X' || board[field] == 'O'
            puts "Not a legit move, choose another"
            ask_again = true
        else
            board[field] = player
        end

    end 
end

turn = 1
board = Array.new(9)
init_board(board)
puts "Tic tac toe!"
while turn <= 9  
    player = turn % 2 == 1 ? 'O' : 'X'       #ako je paran potez igra 'X'
    puts "Turn: #{turn}"
    puts "Next to play: '#{player}'"

    draw_board(board)

    play_turn(player, board)

    turn += 1
    puts ""
end

draw_board(board)
puts "Game over"