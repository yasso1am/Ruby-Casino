# main menu greets player and asks if they want to play
# if they don't, it sends back to the main-main menu
require_relative 'player'


class Roulette 
        attr_accessor :player

    
    
    def initialize(player)
        @player = player
        puts "Hello #{@player.name}"
        @roulette_options = [
        {number: 1, color: "red"},
        {number: 2, color: "black"},
        {number: 3, color: "red"},
        {number: 4, color: "black"}, 
        {number: 5, color: "red"},
        {number: 6, color: "black"},
        {number: 7, color: "red"},
        {number: 8, color: "black"},
        {number: 9, color: "red"},
        {number: 10, color: "black"}, 
        {number: 11, color: "black"},
        {number: 12, color: "red"},
        {number: 13, color: "black"},
        {number: 14, color: "red"},
        {number: 15, color: "black"},
        {number: 16, color: "red"},
        {number: 17, color: "black"},
        {number: 18, color: "red"},
        {number: 19, color: "red"},
        {number: 20, color: "black"},
        {number: 21, color: "red"},
        {number: 22, color: "black"},
        {number: 23, color: "red"},
        {number: 24, color: "black"}, 
        {number: 25, color: "red"},
        {number: 26, color: "black"},
        {number: 27, color: "red"},
        {number: 28, color: "black"},
        {number: 29, color: "black"},
        {number: 30, color: "red"}, 
        {number: 31, color: "black"},
        {number: 32, color: "red"}, 
        {number: 33, color: "black"}, 
        {number: 34, color: "red"},
        {number: 35, color: "black"}, 
        {number: 36, color: "red"} 
        ]
        instructions_and_bet 

    end 

    def instructions_and_bet
        puts
        puts "\tWelcome to Roulette"
        puts 
        system("clear")
        puts "\nYou'll start by placing a bet."
        puts "\nIn this game, you can either select a color (Red or Black) or a number between 0 and 36 to bet on."
        puts "\nYou'll spin the roulette wheel, and if it matches what you chose, you win."
        puts "\nWhen you select the right color, your bet is DOUBLED."
        puts "\nWhen you select the right number, your bet is multiplied by 35!!!"
        puts "\nEasy, right?"
        puts 
        puts "*" * 40
        puts "Your wallet balance is $#{@player.bankroll} dollars"
        puts "*" * 40
        puts "\nWould you like to bet on a color?"
        puts "\nChoose 1 for COLOR or 2 for NUMBER."
        puts "\nChoose 3 if you want to QUIT."
        puts 
        print "> "
        game_choice = gets.to_i 
        case 
            when  game_choice == 1
                bet_on_a_color 
            when game_choice == 2
                bet_on_a_number 
            when game_choice == 3
                puts "\n\tHave a nice day!\n"
            else
                puts "Invalid choice."
                instructions_and_bet 
        end 
    end  


  # I need to fix this so the bet amount can only be a number 
    def bet_on_a_color 
        puts "\nPlease choose the amount of your bet."
        puts "Your bankroll balance is #{@player.bankroll}."
        print "\n Your bet amount is: $"
        @bet_amount = gets.to_i
        player.bankroll = (@player.bankroll - @bet_amount) 
        puts "\nWhat color would you like to bet on? Red or Black?"
        puts 
        user_color_choice = gets.strip.downcase 
        roulette_color_result = @roulette_options.sample[:color]
        puts 
        puts "The wheel landed on #{roulette_color_result}." 
        if user_color_choice == roulette_color_result
            color_bet_winnings = @bet_amount * 2
            @player.bankroll = @player.bankroll + color_bet_winnings 
            puts "\n\tYou win $#{color_bet_winnings}"
            puts "\n\tYour current balance is $#{@player.bankroll}."
            play_again_function 
        else 
            puts "\n\tSorry, you lose."
            play_again_function 
        end 
    end

    # I need to fix this so the bet amount can only be a number 
    def bet_on_a_number
        puts "\nPlease choose the amount of your bet."
        puts "Your bankroll balance is #{@player.bankroll}."
        print "\n Your bet amount is: $"
        @bet_amount = gets.to_i
        player.bankroll = (@player.bankroll - @bet_amount) 
        puts "\nChoose a number."
        puts 
        user_number_choice = gets.to_i
        roulette_number_result = @roulette_options.sample[:number]
        puts "\nThe wheel landed on number #{roulette_number_result}." 
        puts 
        if user_number_choice == roulette_number_result 
            number_bet_winnings = @bet_amount * 35
            puts "\tYou win $#{number_bet_winnings}"
            @player.bankroll = @player.bankroll + (number_bet_winnings) 
            puts "\n\tYour current balance is $#{@player.bankroll}."
            play_again_function  
        else 
            puts "\n\tSorry, you lose."
            play_again_function  
        end 
    end 
    
    def play_again_function 
        puts "\nWould you like to play again? Y or N?"
        puts 
        print "> "
        want_to_play = gets.strip.downcase 
        case
            when want_to_play == "y"
                play_again_choice 
            when want_to_play == "n"
                puts "\nThanks for playing!"
            else 
                puts "Invalid choice."
                play_again_function 
        end 
    end 

    def play_again_choice 
        puts "\nWould you like to bet on a color or number?" 
        puts "\nChoose 1 for color or 2 for number."
        puts "\nChoose 3 if you want to quit."
        play_again = gets.to_i
            case
                when play_again == 1
                    bet_on_a_color 
                when play_again == 2
                    bet_on_a_number  
                when play_again == 3
                    puts "\n\tHave a nice day!\n"
                else 
                    play_again_function 
            end 
    end 

end  