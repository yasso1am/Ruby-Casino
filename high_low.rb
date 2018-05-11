require_relative 'cards'
require_relative 'deck'
require_relative 'player'

class HighLow
  attr_accessor :player

def initialize(player)
  puts "Hello #{player.name}"
  puts player.bankroll.wallet
end
end
