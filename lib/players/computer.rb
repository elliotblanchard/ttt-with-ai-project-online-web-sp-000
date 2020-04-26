require 'pry'

module Players
  class Computer < Player
    CORNER_COMBINATIONS = [0,2,6,8]
    SIDE_COMBINATIONS = [1,3,5,7]
    def move(board)
      #Can I make a move that will win the game?
      #Is the opponent about to win? Block!
      if board.near_win? != nil
        my_move = board.near_win?.to_i+1
      elsif corner_free?
        #If a corner space is free, take it
        puts "Corner free"
        my_move = corner_free?+1
      elsif (board.cells[4] != "X") && (board.cells[4] != "O")
        #If the center is free, take it
        my_move = 5
      else
        #Otherwise, take a side space
        my_move = board.side_free?
      end

      #my_move = rand(8)+1
      my_move.to_s
    end
  end

  def corner_free?
    CORNER_COMBINATIONS.any? do |index|
      if (board.cells[index] != "X") && (board.cells[index] != "O")
        return index
      end
    end
  end
end
