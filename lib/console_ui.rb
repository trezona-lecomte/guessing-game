class ConsoleUI

		def welcome
			puts "Welcome to the magical number guessing game!"
		end

		def get_guess(lower_bound, upper_bound)
			puts "Please enter a number between #{lower_bound} and #{upper_bound}"
   		Integer(STDIN.gets.chomp) rescue nil
		end

		def say_too_high(guess)
			puts "Sorry, your guess of #{guess} was too high! Try guessing lower."
		end

		def say_too_low(guess)
			puts "Sorry, your guess of #{guess} was too low! Try guessing higher."
		end

		def say_game_won
			puts "Congratulations, you guessed correctly!"
		end

		def say_game_lost(magic_number)
			puts "Oh no! You've run out of chances, so you lose. The number was #{magic_number}."
		end

   	def unicorn
   		puts " *
  *
   *     **
    *   ******
     ************                                        ****
      *** **********                                   ********
     ****************                                 *****  ****
    ********************                             ****    ****
    *******  ******************             ******   ***     ***
     *****    ****************************************        *
               *****************************************
                ***************************************
                **************************************
                 ********************     ***********
             ***********                  *********
         *******                          ********
        ***                                ******
       **                                     ****
      **                                       ***
     ***                                     ****"
		end
end