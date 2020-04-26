require 'pry'

class Board

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Top column
    [1,4,7], # Middle column
    [2,5,8], # Bottom column
    [0,4,8], # Diag A
    [6,4,2], # Diag B
  ]

  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def position(input)
    @cells[input_to_index(input)]
  end

  def full?
    return_value = true
    @cells.each do |index|
      if (index.nil? || index == " ")
        return_value = false
      end
    end
    return_value
  end

  def turn_count
    counter = 0
    @cells.each do |index|
      if !(index.nil? || index == " ")
        counter += 1
      end
    end
    counter
  end

  def taken?(index)
    !(@cells[index.to_i-1].nil? || @cells[index.to_i-1] == " ")
  end

  def near_win?
    WIN_COMBINATIONS.each do |win_state|
      occupied_spaces = 0
      empty_spaces = 0
      win_state.each do |index|
        if taken?(index-1)
          puts "#{index} is occupied"
          occupied_spaces += 1
        else
          empty_spaces += 1
          puts "#{index} is empty"
        end
      end
      #puts "Win state: #{win_state} and Occupied spaces: #{occupied_spaces} and empty spaces: #{empty_spaces}"
    end
  end

  def valid_move?(input)
    index = input_to_index(input)
    if ( index.between?(0,8) && taken?(index+1) == false)
      return true
    end
  end

  def update(input,player)
    index = input_to_index(input)
    @cells[index.to_i] = player.token
   end
end
