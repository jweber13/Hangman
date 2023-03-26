require_relative 'messages'

class Interface
include Display

    def initialize(game)
        @game = game
        Display.init_curses
    end
  
    def play
        display_instructions
        loop do
            Display.draw_word(@game.word, @game.guessed_letters)
            Display.show_guesses(@game.guessed_letters)
            Display.show_count(@game.wrong_guesses)
            letter = Display.get_user_input
            result = @game.guess(letter)
            handle_game_result(result)
            break if @game.game_over?
        end
    end

    def display_instructions
        Display.show_message(MESSAGES[:welcome])
        Display.show_context(MESSAGES[:instructions])
        #puts MESSAGES[:welcome]
        #puts MESSAGES[:instructions]
    end
=begin
    def get_user_input
        #puts MESSAGES[:enter_letter_prompt]
        gets.chomp.downcase
    end
=end

    def handle_game_result(result)
        case result
        when :win
            Display.show_message(MESSAGES[:win_message])
            #puts MESSAGES[:win_message]
        when :lose
            Display.show_message(MESSAGES[:lose_message] % { insert: @game.word})
            #puts MESSAGES[:lose_message] % { insert: @game.word}
        when :char_mismatch
            Display.show_message(MESSAGES[:char_mismatch_message])
            #puts MESSAGES[:char_mismatch_message]
        when :duplicate_guess
            Display.show_message(MESSAGES[:duplicate_guess_message] % { insert: @game.last_guess})
            #puts MESSAGES[:duplicate_guess_message] % { insert: @game.last_guess}
        when :bad_guess
            Display.show_message(MESSAGES[:bad_guess] % { insert: @game.last_guess})
            #puts MESSAGES[:bad_guess] % { insert: @game.last_guess}
            #puts format(MESSAGES[:bad_guess_message], letter: @game.last_guess)
        end
    end
end