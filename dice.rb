class Dice
 def initialize
   roll
 end

 def roll
   @die1 = 1 + rand(6)
   @die2 = 1 + rand(6)
 end

 def show_dice
   print "Die1: ", @die1, " Die2:", @die2
 end

 def show_sum
   print "Sum of dice is ", @die1 + @die2, ".\n"
 end

 def dice_sum
 	roll_sum = @die1 + @die2
 end
end
# 
# d = Dice.new
# d.show_dice
# puts
# d.show_sum
