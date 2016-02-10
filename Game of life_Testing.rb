require 'minitest/autorun'
require_relative 'Game_of_Life'

class GridTest < MiniTest::Test

	def setup
		@grid = Grid.new	
	end

	def test_set_cell
		@grid.set_cell(4, 6, true)
		@grid.set_cell(5, 7, false)

		assert_equal true, @grid.current_cell(4, 6)
		assert_equal false, @grid.current_cell(5, 7)
	end

	def test_board_as_string
		@grid.set_cell(0, 0, true)
		@grid.set_cell(1, 0, true)
		expected = "XX        \n" + "          \n" * 9
		assert_equal expected, @grid.test_board_as_string
	end
end