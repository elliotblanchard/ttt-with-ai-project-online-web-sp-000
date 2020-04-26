require 'pry'

module Players
  class Computer < Player
    def move(board)
      #random for now
      #binding.pry

      #Can I make a move that will win the game?
      puts board.near_win?
      #Is the opponent about to win? Block!

      #If a corner space is free, take it

      #If the center is free, take it

      #Otherwise, take a side space

      my_move = rand(8)+1
      my_move.to_s
    end
  end
end
