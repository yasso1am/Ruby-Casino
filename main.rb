require 'pry'
require_relative 'player'
require_relative 'wallet'
# require_relative 'game1'
# require_relative 'game2'
# require_relative 'game3'

def player_menu
  puts "*" * 60
  puts "\tWelcome to Casino DPL"
  puts "\tGood luck!"
  puts "\tWhat's your name?"
  puts "*" * 60
    name = gets.strip
      @p1 = Player.new(name)
  puts "Welcome #{name}, try your luck!"
    instructions
end

def instructions
  puts "\t1) Play game1"
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
      play_game1
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
player_menu
