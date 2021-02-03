#!/usr/bin/env ruby

choices = ARGV.count > 0 ? ARGV : [:heads, :tails]
score = {}
tosses = (choices.count * 10) + 1

tosses.times do
  choice = choices[Random.rand(choices.count)]
  score[choice] ||= 0
  score[choice] += 1
end

winner = score.sort {|m, n| m[1] <=> n[1]}.last.first

puts winner
