class ConsoleUI

    def display_welcome_message
      puts "Welcome to the magical guessing game!"
    end

    def get_guess_str(first, last)
      puts "Please enter a guess between #{first} and #{last}"

      STDIN.gets.chomp
    end

    def display_guess_result(result)
      puts "\nYour guess was #{result}!"
    end

    def display_chances_left(chances)
      puts "You have #{chances} chances left.\n\n"
    end

    def display_game_won_message
      puts "\nCongratulations, you guessed correctly!"
    end

    def display_game_lost_message(hidden_value:)
      puts "\nOh no! You've run out of chances, so you lose. You were trying to guess: #{hidden_value}."
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
