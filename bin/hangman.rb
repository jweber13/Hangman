require_relative '../lib/display'
require_relative '../lib/game'
require_relative '../lib/interface'

file = File.open("./lib/words.txt")
words_array = file.readlines.map(&:chomp) #{ |line| line.chomp }
file.close

game = Game.new(words_array)
interface = Interface.new(game)
interface.play
