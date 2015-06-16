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