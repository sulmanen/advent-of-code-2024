ExUnit.start()

defmodule LevelsTest do
  use ExUnit.Case, async: true
  import Levels

  @input """
  7 6 4 2 1
  1 2 7 8 9
  9 7 6 2 1
  1 3 2 4 5
  8 6 4 4 1
  1 3 6 7 9
  """

  test "safe rows" do
    assert(safe(@input) == [[-1, -2, -2, -1], [2, 3, 1, 2]])
  end

  test "contains delta over abs 3" do
    assert(over_limit?([-2, -1, -4, -1]) == true)
  end

  test "contains safe values" do
    assert(over_limit?([-1, -2, -2, -1]) == false)
  end

  test "all positive" do
    assert(all_positive?([2, 3, 1, 2]))
  end

  test "all negative" do
    assert(all_negative?([-1, -2, -2, -1]))
  end

  test "some positive" do
    assert(all_negative?([2, -1, 2, 1]) == false)
  end
  
end
