ExUnit.start()

defmodule SensorTest do
  use ExUnit.Case, async: true
  import Location 

  @input """
  3   4
  4   3
  2   5
  1   3
  3   9
  3   3
  """

  test "differences" do
    assert(differences(@input) == 11)
  end

  test "occurrences" do
    assert(occurrences(@input) == 31)
  end
end
