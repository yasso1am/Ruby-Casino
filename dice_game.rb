require_relative 'dice'
require 'pry'
require 'colorize'

class Craps
	attr_accessor :player

	def initialize(player)
		@player = player
		puts
		puts "Welcome to the Craps table #{@player.name}!".colorize(:light_green).bold
		play
	end

	def place_bet
		puts
		puts "You have $ #{player.bankroll}".colorize(:cyan)
		puts
		puts "How much would you like to bet ($10 max)?"
		puts
		@bet = gets.strip.to_i
	end

	def roll_again
		@d.roll
		@compare = @d.dice_sum
	end

	def add_winnings
		@player.bankroll = (@player.bankroll + @bet)
	end

	def take_loss
		@player.bankroll = (@player.bankroll - @bet)
	end

	def play_boxcar
		@d.roll
		@compare = @d.dice_sum
		puts
		puts "you rolled #{@compare}"
		if @boxcar == @compare
			puts
			puts "You win the boxcar!".colorize(:green).italic
			add_winnings
		elsif @compare == 7
			puts
			puts "Seven out!".colorize(:red).italic
			take_loss
		else
			puts
			puts "Lady Luck was not on your side!".colorize(:red).italic
			take_loss
		end
	end	

	def play
		@d = Dice.new
		place_bet
		@rolled = @d.dice_sum

		case @rolled
			when 7, 11
				puts
				puts "You rolled #{@rolled}"
				puts
				puts "You win!".colorize(:green).italic
				add_winnings				
			when 2, 3, 12
				puts
				puts "You rolled #{@rolled}"
				puts
				puts "Crap out! Better luck next time.".colorize(:red).italic
				take_loss
			else
				puts
				puts "You rolled #{@rolled}"
				@boxcar = @rolled
				puts
				puts "playing a boxcar...".colorize(:yellow).italic
				play_boxcar				
			end
		puts	
		puts "Would you like to play again? - yes or no".colorize(:light_blue)
		puts
		play_again_choice = gets.strip.downcase
		case play_again_choice
			when "yes"	
				play
			when "no"
				puts
				puts "Goodbye".colorize(:green).italic
		end
	end
end


