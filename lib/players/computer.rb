require 'pry'

module Players
  class Computer < Player
    CORNER_COMBINATIONS = [0,2,6,8]
    SIDE_COMBINATIONS = [1,3,5,7]

    def corner_free?(board)
      CORNER_COMBINATIONS.any? do |index|
        if (board.cells[index] != "X") && (board.cells[index] != "O")
          return index
        end
      end
    end

    def side_free?(board)
      SIDE_COMBINATIONS.any? do |index|
        if (board.cells[index] != "X") && (board.cells[index] != "O")
          return index
        end
      end
    end

    def move(board)
      #Can I make a move that will win the game?
      #Is the opponent about to win? Block!
      if board.near_win? != nil
        my_move = board.near_win?.to_i+1
      elsif corner_free?(board)
        #If a corner space is free, take it
        my_move = corner_free?(board)+1
        puts "Corner free: #{my_move}"
      #elsif (board.cells[4] != "X") && (board.cells[4] != "O")
        #If the center is free, take it
      #  my_move = 5
      #  puts "Center free: #{my_move}"
      else
        my_move = 1
        board.cells.each do |index|
          puts "#{index} is #{board.cells[index]}"
          if (board.cells[index] != "X") && (board.cells[index] != "O")
            my_move = board.cells[index] + 1
          end
        end
        #my_move = rand(8)+1
        #Otherwise, take a side space
        #my_move = side_free?(board)+1
        #puts "Side free: #{my_move}"
      end
      my_move.to_s
    end
  end
end
