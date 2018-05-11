class Player
  attr_accessor :name, :bankroll

  def initialize
    puts "What's your name?"
    name = gets.chomp
    @name = name
    @bankroll = 1000
  end

# def freshwallet
#   @bankroll = 1000
# end

  def freshwallet
    @bankroll = 1000
  end
end


#
# class Wallet
#   attr_accessor :wallet
#
#   def initialize
#     @wallet = 1000
#   end
#
# end
