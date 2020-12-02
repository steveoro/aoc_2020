#!/usr/bin/elixir

{:ok, file} = File.read("input.txt")
lst = file |> String.trim
           |> String.split("\n")
           |> Enum.map(&String.to_integer/1)
           |> Enum.sort
# lst is now a list with sorted integers

defmodule Pivoting do
  # Just exit when greater than goal (list is sorted):
  def deep_search(_list, p1, p2, p3) when p1 + p2 + p3 > 2020, do: nil

  # Goal reached?
  def deep_search(_list, p1, p2, p3) when p1 + p2 + p3 == 2020 do
    IO.puts("p1: #{p1}, p2: #{p2}, p3: #{p3} => p1 * p2 * p3 = #{p1 * p2 * p3}")
  end

  # Do the actual search:
  def deep_search(list, p1, p2, p3) when p1 + p2 + p3 < 2020 do
    # Go deep for p2 (move p3; don't go if list is shorter):
    if(Enum.at(list, 3, false), do: Pivoting.deep_search((tl list), p1, p2, Enum.at(list, 3, 0)), else: list)

    # Go deep for p1 (move p2 & p3; don't go if list is shorter):
    if(Enum.at(list, 4, false), do: Pivoting.deep_search((tl list), p1, Enum.at(list, 3, 0), Enum.at(list, 4, 0)), else: list)
  end
end

Pivoting.deep_search(lst, (hd lst), Enum.at(lst, 1, 0), Enum.at(lst, 2, 0))
