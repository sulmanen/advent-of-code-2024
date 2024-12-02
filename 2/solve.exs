import Levels
import Enum

{:ok, input} = File.read("input.txt")

IO.puts "Part 1: Safe level count with tolerance 0"
IO.puts count(safe(input, 0))

IO.puts "Part 2: Safe level count with tolerance 1"
IO.puts count(safe(input, 1))
