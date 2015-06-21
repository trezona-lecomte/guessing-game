class ConsoleUI

    def display_welcome_message
      puts "Welcome to the magical guessing game!"
    end

    # TODO pass first and last rather than range
    def get_guess_str(first, last)
      puts "Please enter a guess between #{first} and #{last}"

      STDIN.gets.chomp
    end

    def display_guess_result(guess:)
      puts "\nYour guess was #{guess.result}!"
    end

    def display_game_won_message
      puts "\nCongratulations, you guessed correctly!"
    end

    def display_game_lost_message(magic_element:)
      puts "\nOh no! You've run out of chances, so you lose. You were trying to guess: #{magic_element}."
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
