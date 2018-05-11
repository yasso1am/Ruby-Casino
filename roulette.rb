# main menu greets player and asks if they want to play
# if they don't, it sends back to the main-main menu

class Roulette 
    attr_accessor :player
  
  def initialize(player)
    puts "Hello #{player.name}"
  end 
  roulette_menu 
end 

def roulette_menu
    puts
    puts "Welcome to Roulette"
    puts 
    puts "Would you like to play? Y or N?"
    want_to_play = gets.strip 
    case
        when want_to_play == "Y" || want_to_play == "y"
            instructions_and_bet
        when want_to_play == "N" || want_to_play == "n"
            Main.rb 
        else 
            puts "Invalid choice."
            routlette_menu 
    end 
end 



#instructions are given with odds
# they are prompted to place a certain amount of money for the bet
# the money they bet will be deducted from wallet
# numbers can be between 0-36
# They can also choose to bet on red or black 

def instructions_and_bet 
    system("clear")
    puts "\nYou'll start by placing a bet."
    puts "\nIn this game, you can either select a color (Red or Black) or a number between 0 and 36 to bet on."
    puts "\nYou'll spin the roulette wheel, and if it matches what you chose, you win."
    puts "\nWhen you select the right color, your bet is doubled."
    puts "\nWhen you select the right number, your bet is multiplied by 35."
    puts "\nEasy, right?"
    puts "\nYour wallet balance is #{Player.bank_roll}"
    puts "\nPlease choose the amount of your bet. If you would like to leave the game, type quit."
    @bet_amount = gets.to_i
    Player.bank_roll = (Player.bank_roll - bet) 
    puts "\nWould you like to bet on a color? Y or N?"
    puts "\nIf N, you will be directed to pick a number."
    bet_on_color = gets.strip.undercase 
    case 
        when  bet_on_color == "y"
            puts "What color would you like to bet on? Red or Black?"
            user_color_choice = gets.strip.undercase 
            if user_color_choice == roulette_options.sample(:color)
                puts "You win" @bet_amount * 2
            else 
                puts "Sorry, you lose."
            end 
        when bet_on_color == "n"
            puts "What number would you like to bet on?"
            user_number_choice = gets.to_i
            
        end
    end  
end 

# once they place their bet, the wheel spins and spits out a number and the associated color

def wheel_spin_result 
    roulette_options = [
       {number: 1, color: red}
       {number: 2, color: black}
       {number: 3, color: red}
       {number: 4, color: black} 
       {number: 5, color: red}
       {number: 6, color: black}
       {number: 7, color: red}
       {number: 8, color: black}
       {number: 9, color: red}
       {number: 10, color: black} 
       {number: 11, color: black}
       {number: 12, color: red}
       {number: 13, color: black}
       {number: 14, color: red}
       {number: 15, color: black}
       {number: 16, color: red}
       {number: 17, color: black}
       {number: 18, color: red}
       {number: 19, color: red}
       {number: 20, color: black}
       {number: 21, color: red}
       {number: 22, color: black}
       {number: 23, color: red}
       {number: 24, color: black} 
       {number: 25, color: red}
       {number: 26, color: black}
       {number: 27, color: red} 
       {number: 28, color: black}
       {number: 29, color: black}
       {number: 30, color: red} 
       {number: 31, color: black}
       {number: 32, color: red} 
       {number: 33, color: black} 
       {number: 34, color: red}
       {number: 35, color: black} 
       {number: 36, color: red} 
        ]

end 

# the bet is compared to the spin result 
# if they get the number right, their bet is multiplied by 35 and added to wallet
# if they get the color right, their bet is doubled and added back to the wallet

def win_or_lose 
end 

roulette_menu 