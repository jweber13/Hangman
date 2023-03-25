require_relative 'messages'

class Interface
include Display

    def initialize(game)
        @game = game
    end
  
    def play
        display_instructions
        loop do
            Display.draw_word(@game.word, @game.guessed_letters)
            Display.show_guesses(@game.guessed_letters)
            Display.show_count(@game.wrong_guesses)
            letter = get_user_input
            result = @game.guess(letter)
            handle_game_result(result)
            break if @game.game_over?
        end
    end

    def display_instructions
        puts MESSAGES[:welcome]
        puts MESSAGES[:instructions]
    end

    def get_user_input
        puts MESSAGES[:enter_letter_prompt]
        gets.chomp.downcase
    end

    def handle_game_result(result)
        case result
        when :win
            puts MESSAGES[:win_message]
        when :lose
            puts MESSAGES[:lose_message] % { insert: @game.word}
        when :char_mismatch
            puts MESSAGES[:char_mismatch_message]
        when :duplicate_guess
            puts MESSAGES[:duplicate_guess_message] % { insert: @game.last_guess}
        when :bad_guess
            puts MESSAGES[:bad_guess] % { insert: @game.last_guess}
            #puts format(MESSAGES[:bad_guess_message], letter: @game.last_guess)
        end
    end
end