ExUnit.start()

defmodule ProgramTest do
  use ExUnit.Case, async: true
  import Program

  @input """
  xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))
  """

  @second_input """
  xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))
  """

  
  test "get multiply input pairs" do
    assert(parse_inputs(@input) == [])
  end

  test "run program" do
    assert(run(@input) == 161)
  end

  test "run program with filter" do
    assert(run_with_filter(@second_input) == [])
  end
end
