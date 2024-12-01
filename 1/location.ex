import Enum
import Integer
import List

defmodule Location do

  def parse_lists(input) do
    String.split(input, "\n")
    |> map(fn (line) -> String.split(line) end)
    |> map(fn (line) -> map(line, fn(number_string) -> elem(parse(number_string, 10), 0) end) end)
    |> reduce([[], []], fn(value, acc) -> [concat(first(acc), [first(value)]), concat(last(acc), [last(value)])] end)
    |> map(fn(list) -> filter(list, fn(value) -> value != nil end) end)
    |> map(fn(list) -> sort(list, :asc) end)
  end
  
  def differences(input) do
    parse_lists(input)
    |> Enum.zip
    |> reduce([], fn(value, acc) -> concat(acc, [abs(elem(value, 0) - elem(value, 1))]) end)
    |> reduce(0, fn(value, acc) -> value + acc end)
  end

  def occurrences(input) do
    locations = parse_lists(input)
    other_list = last(locations)
    reduce(first(locations), 0, fn(value, acc) -> acc + value * count(other_list, fn(other_value) -> other_value == value end) end)
  end
end
