require 'pry'

def player_menu
  puts "Welcome to Casino DPL"
  puts "Good luck!"
  puts "1) Play game1"
  puts "2) Play game2"
  puts "3) Play game3"
  puts "4) Check your wallet"
  puts "5) Exit"
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
    check_wallet
  when 5
    puts "Thanks for playing"
    exit
  else
    puts "Invalid input, try again"
    player_menu
  end
end
