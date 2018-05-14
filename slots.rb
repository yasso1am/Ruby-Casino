require_relative 'player'


class Slots
        attr_accessor :player


def initialize(player)
    @player = player
    puts "Hello #{@player.name}"
    lottery_items = [ "💎", "💰", "👑" , "💀" ]
    @lottery = [lottery_items.dup, lottery_items.dup, lottery_items.dup, lottery_items.dup]
    lottery_game
end 





def lottery_game 
    system("clear") 
    puts "****************************"
    puts "\nWelcome to the Slots."
    puts "\nYou pay $1 each time you play."
    puts "\nIf you win, your bank roll is tripled."
    puts "If you get four skulls, you immediately go bankrupt."
    puts "\nIf your bank roll reaches 0, you lose."
    puts "\nYour bank roll is #{@player.bankroll}" 
    puts "\nWould you like to play? Y or N?"
    like_to_play = gets.strip 
    if like_to_play == "Y" || like_to_play == "y"
        puts "Good luck!" 
        let_us_play 
    elsif like_to_play == "N" || like_to_play == "n"
        puts "Fine then"
    else 
        puts "Invalid selection" 
        lottery_game 
    end 
end 

def let_us_play 
    system("clear") 
    puts "****************************"
    puts "\nWelcome to the Slots."
    puts "\nYou pay $1 each time you play."
    puts "\nIf you win, your bank roll is tripled."
    puts "\nIf you get four skulls, you immediately go bankrupt."
    puts "\nIf your bank roll reaches 0, you lose."
    puts "\nYour bank roll is #{@player.bankroll}" 
    #need to change below to a sample of 4 if I add the skulls 
    pull_the_handle = @lottery.flatten.sample(4)
    # I had to have my husband write the code that removes the brackets. Please let me know if 
    # if there is an easier way. Thanks!
    puts "\nYour result is #{pull_the_handle.reduce("") { |result, element| result + " " + element }}"

    if pull_the_handle == ["💎", "💎", "💎", "💎" ]
        puts "\nYOU WIN! YOU WIN! YOU WIN! YOU WIN! YOU WIN!"
        @player.bankroll = @player.bankroll * 3
        puts "Your new bank roll is #{@player.bankroll}" 
    elsif pull_the_handle == ["💰", "💰", "💰", "💰" ]
        puts "\nYOU WIN! YOU WIN! YOU WIN! YOU WIN! YOU WIN!"
        @player.bankroll = @player.bankroll * 3
        puts "Your new bank roll is #{@player.bankroll}" 
    elsif pull_the_handle == ["👑 ", "👑", "👑", "👑"]
        puts "\nYOU WIN! YOU WIN! YOU WIN! YOU WIN! YOU WIN!" 
        @player.bankroll = @player.bankroll * 3
        puts "Your new bank roll is #{@player.bankroll}" 
    elsif pull_the_handle == [ "💀", "💀", "💀", "💀"]
        puts "You have gone bankrupt.Thanks for the money!"
        @bank_roll = 0
        puts "Game Over"
        exit 
    else 
        puts "\nSorry, try again."
        @player.bankroll = @player.bankroll - 1
    end 

    if @player.bankroll == 0 
        puts "You are out of money. Come back when you have more. Loser." 
    else play_more 
    end 
end 

def play_more 
    puts "\nWould you like to play again? Y or N?"
    play_again = gets.strip 

    if play_again == "Y" || play_again == "y" || play_again == ""
        let_us_play
    elsif play_again == "N" or play_again == "n" 
        puts "Come back soon!"
        puts "You leave with #{@player.bankroll}"
    # add something here that if they exit, 
    # their score is saved to a file and three high scores are displayed. 
    # also add a way for them to add their name. 
    else 
        puts "Invalid selection."
        play_more 
    end 
end 
end