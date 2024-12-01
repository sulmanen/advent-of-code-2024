import Location
{:ok, input} = File.read("input.txt")

IO.puts "Part 1: Sum of differences"
IO.puts differences(input)

IO.puts "Part 2: Sum of occurrences"
IO.puts occurrences(input)
