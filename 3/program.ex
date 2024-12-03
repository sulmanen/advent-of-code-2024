import Enum
import List
import Integer

defmodule Program do
  
  def run_with_filter(input) do
    String.split(input, ["don't()", "do()"])
    |> map_every(2, fn(sanitized_input) -> Regex.scan(~r/mul\((\d+),(\d+)\)/, sanitized_input) end)
    |> filter(fn(instruction) -> is_list(instruction) end)
    |> flat_map(fn(x) -> x end)
    |> map(fn(op) -> delete_at(op, 0) end)
    |> map(fn(operand_strings) -> map(operand_strings, fn(operand) -> elem(parse(operand, 10),0) end) end)
    |> reduce(0, fn(operands, acc) -> acc + first(operands) * last(operands) end)
  end

  
  def run(input) do
    String.split(input, "\n")
    |> flat_map(fn(line) -> Regex.scan(~r/mul\((\d+),(\d+)\)/, line) end)
    |> reject(&Enum.empty?/1)
    |> map(fn(op) -> delete_at(op, 0) end)
    |> map(fn(operand_strings) -> map(operand_strings, fn(operand) -> elem(parse(operand, 10),0) end) end)
    |> reduce(0, fn(operands, acc) -> acc + first(operands) * last(operands) end)
  end
end
