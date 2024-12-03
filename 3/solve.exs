import Program

{:ok, input} = File.read("input.txt")

IO.puts "Part 1: Sum of program output"
IO.puts run(input)

IO.puts "Part 2: Sum of filtered program output"
IO.puts run_with_filter(input)
