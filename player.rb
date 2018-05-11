class Player
  attr_accessor :name, :bankroll

  def initialize(name)
      @name = name
      @bankroll = Wallet.new
  end

end
