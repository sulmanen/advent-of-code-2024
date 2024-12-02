import Enum
import Integer
import List

defmodule Levels do

  def parse_report(input) do
    String.split(input, "\n")
    |> map(fn (line_string) -> String.split(line_string, " ") end)
    |> map(fn (line) -> map(filter(line, fn(level) -> level != "" end), fn(number_string) -> elem(parse(number_string, 10), 0) end) end)
    |> reject(&Enum.empty?/1)
  end

  def safe(input) do
    parse_report(input)
    |> filter(fn(levels) -> safe_report?(levels) end)
  end

    
  def safe_with_dampener(input) do
    parse_report(input)
    |> filter(fn(levels) -> any?(map(0..count(levels), fn(i) -> safe_report?(delete_at(levels, i)) end)) end)
  end

  def safe_report?(report) do
    chunk_every(report,2,1, :discard)
    |> flat_map(fn(adjacent) -> [last(adjacent) - first(adjacent)] end)
    |> safe_deltas?
  end

  def safe_deltas?(deltas) do
    !over_limit?(deltas) && (all_positive?(deltas) || all_negative?(deltas))
  end
  
  def over_limit?(deltas) do
    count(deltas, fn(delta) -> abs(delta) > 3 || abs(delta) == 0 end) > 0
  end

  def all_positive?(deltas) do
    count(deltas, fn(delta) -> delta <= 0 end) == 0
  end

  def all_negative?(deltas) do
    count(deltas, fn(delta) -> delta >= 0 end) == 0
  end
  
 end
