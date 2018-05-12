require_relative 'cards'
require_relative 'deck'
require_relative 'player'
require 'colorize'

class HighLow
  attr_accessor :player, :deck, :hand, :main

  def initialize(player, main)
    @main = main
    @hand = []
    @player = player
    start_game
  end

  def card_shuffle
      deck = Deck.new
      @shuffled_deck = deck.shuffle_cards
  end

  def draw_card
    @card = @shuffled_deck.pop
    @hand << @card
  end

  def display_card1
    @card1 = @hand[0]
    puts "\tYou drew a #{@card.rank} of #{@card.suit}"
    puts
  end

  def display_card2
    @card2 = @hand[1]
    puts
    puts "\tYou drew a #{@card2.rank} of #{@card2.suit}"
    puts
  end

  def start_game
    puts "**********************************************************************"
    puts "\t\t#{@player.name}, this is High/Low!"
    puts "You currently have #{@player.bankroll} to work with, spend wisely!"
    puts "**********************************************************************"
    card_shuffle
    play_game
  end

  def play_game
    draw_card
    display_card1
    puts
    puts "\tWill the next card be 1) Higher or 2) Lower?"
      @choice = gets.strip.to_i
    betting
  end

  def betting
    puts
    puts "\t1) How much you wanna bet?"
    puts "\t2) Place your same bet again"
    puts "\t3) Bet $5"
    puts "\t4) It's not my lucky day, return to main menu"
      user_input = gets.strip.to_i
      case user_input
        when 1
          puts "\t\tHow much would you like to bet?".colorize(:orange)
          @bet = gets.strip.to_i
          puts "\tYour second card is:"
          draw_card
          display_card2
          evaluate
        when 2
          draw_card
          display_card2
          evaluate
        when 3
          @bet = 5
          draw_card
          display_card2
          evaluate
        when 4
          puts "Goodbye"
          @main.instructions
        else
          puts
          "Invalid selection, try again"
          puts
          betting
        end
      end
  end

  def evaluate
        card1 = @hand[0]
        card2 = @hand[1]
        puts
     puts "\t\tYour first card was #{card1.rank} of #{card1.suit}"
     puts "\t\tYour second card was #{card2.rank} of #{card2.suit}"
     puts
      case
        when
          @hand[0].to_numeric_value == @hand[1].to_numeric_value
            puts "******"
            puts "\t#{card1.rank} of #{card1.suit} and #{card2.rank} of #{card2.suit} are the same!"
            puts "\tTie score, try again!".colorize(:yellow)
            puts "******"
        when
          @hand[0].to_numeric_value > @hand[1].to_numeric_value && @choice == 1
            puts "******"
            puts "\tCard 2: #{card2.rank} of #{card2.suit} is lower than #{card1.rank} of #{card1.suit}"
            puts "\tYou thought it was going to be higher!"
            puts "\tYou lost this round".colorize(:red)
            puts "******"
          @player.bankroll = (@player.bankroll - @bet)
        when
          @hand[0].to_numeric_value < @hand[1].to_numeric_value && @choice == 2
            puts "******"
            puts "\tCard 2: #{card2.rank} of #{card2.suit} is higher than #{card1.rank} of #{card1.suit}"
            puts "\tYou thought it was going to be lower!"
            puts "\tYou lost this round".colorize(:red)
            puts "******"
          @player.bankroll = (@player.bankroll - @bet)
      when
        @hand[0].to_numeric_value < @hand[1].to_numeric_value && @choice == 1
        puts "******"
        puts "\tCard 2: #{card2.rank} of #{card2.suit} is higher than #{card1.rank} of #{card1.suit}"
        puts "\tYou thought it was going to be higher!"
        puts "\tYou win - nice job!".colorize(:green)
        puts "******"
        @player.bankroll = (@player.bankroll + (@bet * 2))
      when
        @hand[0].to_numeric_value > @hand[1].to_numeric_value && @choice == 2
        puts "******"
        puts "\tCard 2: #{card2.rank} of #{card2.suit} is lower than #{card1.rank} of #{card1.suit}"
        puts "\tYou thought it was going to be lower!"
        puts "\tYou win - nice job!".colorize(:green)
        puts "******"
        @player.bankroll = (@player.bankroll + (@bet * 2))
      else
        puts "Something went wrong, let's try again"
      end
      puts "End of round, let's play again!"
      @hand = []
      start_game
  end
