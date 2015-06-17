class ConsoleUI

    def display_welcome_message
      puts "Welcome to the magical number guessing game!"
    end

    # TODO move cast/rescue parser/validator
    def get_guess(lower_bound, upper_bound)
      valid_guess = false

      until valid_guess
        puts "Please enter a number between #{lower_bound} and #{upper_bound}"

        valid_guess = Integer (STDIN.gets.chomp) rescue nil
        valid_guess = nil unless valid_guess.between?(lower_bound, upper_bound) rescue nil
      end

      valid_guess
    end

    # TODO handle no result
    def display_guess_result(result)
      puts "\nYour guess was #{result}!"
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