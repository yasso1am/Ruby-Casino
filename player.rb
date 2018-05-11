require_relative 'wallet'

class Player
  attr_accessor :name, :bankroll

  def initialize
    puts "What's your name?"
    name = gets.chomp
    @name = name
    @bankroll = Wallet.new
  end

end
