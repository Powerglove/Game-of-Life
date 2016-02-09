require 'byebug'

class Grid

	WIDTH = 10
	HEIGHT = 10

	def initialize
	@cells = Array.new(WIDTH) { Array.new(HEIGHT, false) }
	end

	def create_and_set_position
    35.times do
      x = rand(0..9)
      y = rand(0..9)
      set_cell(x, y, true)
    end
  end

	def set_cell(x, y, live)
    @cells[x][y] = live
  end

  def current_cell(x, y)
    @cells[x][y]
  end

  def play_game
    create_and_set_position
    print_board
  end

  def print_board
    @cells.each do |x|
      puts x.each { |y| y}.join(" | ")
    end
  end

  def neighbours(x,y)
  end


end

life = Grid.new
life.play_game


