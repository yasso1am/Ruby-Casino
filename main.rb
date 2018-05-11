require_relative 'player'
require_relative 'wallet'
require_relative 'high_low'
# require_relative 'game1'
# require_relative 'game2'
# require_relative 'game3'
class Main
  attr_accessor :player

  def initialize
    player_menu
  end

def player_menu
  puts "*" * 60
  puts "\tWelcome to Casino DPL"
  puts "\tGood luck!"
  puts "\tWhat's your name?"
  puts "*" * 60
  @player = Player.new
    puts "Welcome #{@player.name}, try your luck!"
    instructions
end

def instructions
  puts "\t1) Play High-Low"
  puts "\t2) Play game2"
  puts "\t3) Play game3"
  puts "\t4) Check your wallet"
  puts "\t5) Exit"
  user_selection
end

def user_selection
  choice = gets.strip.to_i
  case choice
    when 1
      HighLow.new(player)
    when 2
      play_game2
    when 3
      play_game3
    when 4
      puts
      puts "You have #{@p1.bankroll.wallet} remaining"
      puts
    when 5
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
