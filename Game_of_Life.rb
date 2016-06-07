require 'byebug'

class Grid

	WIDTH = 10
	HEIGHT = 10

	def initialize
	@cells = Array.new(WIDTH) { Array.new(HEIGHT, (false)) }
	end

  def set_cell(x, y, dead_or_alive)
    @cells[x][y] = dead_or_alive
  end

	def create_and_set_position
    35.times do
      x = rand(0..9)
      y = rand(0..9)
      set_cell(x, y, true)
    end
  end

  def live?(x, y)
    @cells[x][y]
  end

  def play_game
    create_and_set_position
    board_as_string
    print_board
  end

  def print_board
    puts board_as_string
  end

  def board_as_string
    board = ""

    HEIGHT.times do |y|
      WIDTH.times do |x|
        if live?(x,y)
          board << 'X'
        else
          board << ' '
        end
      end
      board << "\n"
    end
    board
  end

  def neighbours(x,y)
    neighbours_count = 0

    if @cells[x - 1][y - 1] && (x != 0 && y != 0) #west 
      neighbours_count += 1
    end

    if @cells[x][y - 1] && y != 0 #south
      neighbours_count += 1
    end

    if @cells[x + 1][y - 1] && y != 0 #north east 
      neighbours_count += 1
    end

    if @cells[x - 1][y] && x != 0 #west
      neighbours_count
    end

    if @cells[x + 1][y] && x != 9 #east
      neighbours_count
    end

    if @cells[x - 1][y + 1] && (x != 0 && y != 9) #south west
      neighbours_count
    end
    
    if @cells[x][y + 1] && y != 9 #north
      neighbours_count
    end
   
    if @cells[x + 1][y + 1] && (x != 9 && y != 9) #east 
    neighbours_count
    end
   
    return neighbours_count
  end


end

class Game
 attr_accessor :grid

  def initialize # create a new Grid and assigns it to an instance variable @grid. Then it sets some cells live on this grid. 
   @grid = Grid.new
   @grid.create_and_set_position
   @grid.print_board
  end

  def clear_screen()
    puts "\e[H\e[2J"
  end

  def live_in_next_grid?(live, neighbours_count) #returns whether a cell should live or be dead in the next grid
  # Any live cell with fewer than two live neighbours will be dead in the next grid, as if caused by under-population.
    if live == true && neighbours_count < 2
      false
    elsif live == true && (neighbours_count == 2 || neighbours_count == 3) # Any live cell with two or three live neighbours lives in the next grid.
      true
    elsif live == true && neighbours_count > 3 #Any live cell with more than three live neighbours dies, as if by overcrowding.
      false
    elsif live == false && neighbours_count == 3 #Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
      true
    else
      false
    end
  end
end


life = Grid.new

life.play_game
puts life.neighbours(3, 6)
game = Game.new

puts game.live_in_next_grid?(false, 2)
#game.grid = Grid.new
#puts game.grid
#puts game.grid.set_cell(4, 5, true)
#puts game.grid.live_in_next_grid?(true, 3)




