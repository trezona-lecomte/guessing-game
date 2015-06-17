class ConsoleUI

    def display_welcome_message
      puts "Welcome to the magical number guessing game!"
    end

    # TODO move cast/rescue parser/validator
    def get_guess_str(range:)
      puts "Please enter a number between #{range.first} and #{range.last}"

      STDIN.gets.chomp
    end

    # TODO handle no result
    def display_guess_result(guess:)
      puts "\nYour guess was #{guess.result}!"
    end

    def display_game_won_message
      puts "\nCongratulations, you guessed correctly!"
    end

    def display_game_lost_message(magic_element:)
      puts "\nOh no! You've run out of chances, so you lose. The number was #{magic_element}."
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
