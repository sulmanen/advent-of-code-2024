import Levels
import Enum

{:ok, input} = File.read("input.txt")

IO.puts "Part 1: Safe level count"
IO.puts count(safe(input))

IO.puts "Part 2: Safe level count with Dampener"
IO.puts count(safe_with_dampener(input))
