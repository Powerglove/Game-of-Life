require 'minitest/autorun'
require_relative 'Game_of_Life'


class GridTest < MiniTest::Test

	def setup
		@cells = Grid.new	
	end

	def test_set_cell
		@cells.set_cell(4, 6, true)
		@cells.set_cell(5, 7, false)

		assert_equal true, @cells.live?(4, 6)
		assert_equal false, @cells.live?(5, 7)
	end

	def test_board_as_string
		@cells.set_cell(0, 0, "X")
		@cells.set_cell(1, 0, "X")
		expected = "XX        \n" + "          \n" * 9
		assert_equal expected, @cells.board_as_string
	end

	def test_neighbours

		@cells.set_cell(0, 0, true)
		@cells.set_cell(0, 1, true)
		@cells.set_cell(1, 2, true)

		assert_equal 0, @cells.neighbours(0, 0)
		assert_equal 1, @cells.neighbours(0, 1)
		assert_equal 1, @cells.neighbours(1, 2)
	end

end

class GameTest < MiniTest::Test

	def setup
		@game = Game.new
	end

	def test_live_in_next_grid?
		assert_equal false, @game.live_in_next_grid?(false, 2)
		
	end

end