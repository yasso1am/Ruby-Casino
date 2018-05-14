require_relative 'cards'
require 'pry'

class Deck
  attr_accessor :cards

  def initialize
    @rank = %w(2 3 4 5 6 7 8 9 10 J Q K A)
    @suits = %w(Spades Diamonds Clubs Hearts)
    @cards = []
    generate_deck
  end

  # def generate_deck - MINE VERSION
  #   @suits.each do |suit|
  #     @ranks.each do |rank|
  #       @value.each do |value|
  #         binding.pry
  #       color = (suit == 'Spades' || suit == 'Clubs') ? 'Black' : 'Red'
  #       @cards << Card.new(rank, suit, color, value)
  #       end
  #     end
  #   end

    def generate_deck # ANTHONY
      @suits.each do |suit|
        @rank.each do |rank|
          color = (suit == 'Spades' || suit == 'Clubs') ? 'Black' : 'Red'
          @cards << Card.new(rank, suit, color)
        end
      end
    end



  def shuffle_cards
    @shuffle = @cards.shuffle
  end

  def list
    @shuffle.each do |card|
      puts "#{card.rank} of #{card.suit} (#{card.color})"
    end
  end
end

# d = Deck.new
# puts d.cards
