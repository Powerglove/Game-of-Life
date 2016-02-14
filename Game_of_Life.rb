require 'byebug'

class Grid

	WIDTH = 10
	HEIGHT = 10

	def initialize
	@cells = Array.new(WIDTH) { Array.new(HEIGHT, " ") }
	end

	def create_and_set_position
    35.times do
      x = rand(0..9)
      y = rand(0..9)
      set_cell(x, y, "X")
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
    board_as_string
  end

  def print_board
    puts board_as_string
  end

  def board_as_string
    board = ""
    @cells.each do |x|
      x.each do |y|
        board << y
      end
      board << "\n"
    end
    board
  end

  def neighbours(x,y)
  end


end

life = Grid.new
life.play_game
life.print_board



