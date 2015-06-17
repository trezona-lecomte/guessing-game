class ConsoleUI

		def display_welcome_message
			puts "Welcome to the magical number guessing game!"
		end

		def get_guess(lower_bound, upper_bound)
			puts "Please enter a number between #{lower_bound} and #{upper_bound}"
   		Integer(STDIN.gets.chomp) rescue nil
		end

		def display_too_high_message(guess)
			puts "\nYour guess of #{guess} was too high!"
		end

		def display_too_low_message(guess)
			puts "\nYour guess of #{guess} was too low!"
		end

		def display_game_won_message
			puts "\nCongratulations, you guessed correctly!"
		end

		def display_game_lost_message(magic_number)
			puts "\nOh no! You've run out of chances, so you lose. The number was #{magic_number}."
		end

   	def display_unicorn
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