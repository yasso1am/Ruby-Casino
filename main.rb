require_relative 'player'
require_relative 'high_low'
# require_relative 'game1'

# require_relative 'game2'
# require_relative 'game3'

require_relative "roulette"


class Main
attr_accessor :player

  def initialize
    player_menu
  end

def player_menu
  puts "*" * 60
  puts "\tWelcome to Casino DPL".colorize(:blue)
  puts "\tGood luck!"
  puts "*" * 60
  @player = Player.new
    puts "\tWelcome #{@player.name}, try your luck!".colorize(:blue)
    instructions
end

def instructions
  @player.bankroll
  puts "\t1) Play High-Low"
  puts "\t2) Play Roulette"
  puts "\t3) Play Dice"
  puts "\t4) Check your wallet"
  puts "\t5) Refresh your wallet"
  puts "\t6) Exit"
  user_selection
end

def user_selection
  choice = gets.strip.to_i
  case choice
    when 1
      HighLow.new(player, self)
    when 2
      Roulette.new(player)
    when 3
      Dice.new(player)
    when 4
      puts
      puts "You have #{@player.bankroll} remaining"
      puts
    when 5
      puts "Let's start over"
      @player.freshwallet
    when 6
      puts "Thanks for playing"
      exit
    else
      puts "Invalid input, try again"
      player_menu
    end
  instructions
end
end
Main.new
