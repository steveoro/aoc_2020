#!/usr/bin/env ruby

ary = File.read("input.txt").split("\n").map(&:to_i).sort

def pivoting(list, p1, p2, p3)
  # Guard & exit if greater than goal (list is sorted):
  return if p1 + p2 + p3 > 2020

  # Output when goal is reached:
  if p1 + p2 + p3 == 2020
    puts "p1: #{p1}, p2: #{p2}, p3: #{p3} => p1 * p2 * p3 = #{p1 * p2 * p3}"
    return
  end

  # Go deep for p2 (move p3):
  pivoting(list[1..-1].dup, p1, p2, list[3]) if list.size > 3

  # Go deep for p1 (move p2 & p3):
  pivoting(list[1..-1].dup, p1, list[3], list[4]) if list.size > 4
end

pivoting(ary, ary[0], ary[1], ary[2])
