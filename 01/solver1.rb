#!/usr/bin/env ruby

ary = File.read("input.txt").split("\n").map(&:to_i).sort

ary.any? do |i|
  diff = 2020 - i
  # Bail out when done:
  done = ary.include?(diff)
  puts "i: #{i}, diff: #{diff} => i * diff = #{i * diff}" if done
  # Report the outcome to any?:
  done
end
