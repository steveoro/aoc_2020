#!/usr/bin/elixir

{:ok, file} = File.read("input.txt")
lst = file |> String.trim
           |> String.split("\n")
           |> Enum.map(&String.to_integer/1)
           |> Enum.sort
# lst is now a list with sorted integers

# Find first diff w/ 2020 and yield the result:
Enum.any?(
  lst,
  fn n -> (diff = 2020 - n) &&
          Enum.member?(lst, diff) &&
          IO.puts("n: #{n}, diff: #{diff} => n * diff = #{n * diff}")
  end
)
