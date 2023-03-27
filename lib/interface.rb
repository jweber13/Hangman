require_relative 'messages'
require 'yaml'

class Interface
include Display

    def initialize(game)
        @game = game
        @is_playing = true
        Display.init_curses
    end

    def restart
        @game.reset_game
        Display.refresh_display
    end
  
    #primary game loop
    def play
        Display.show_message(MESSAGES[:welcome])
        display_instructions
        ln = Display.load_or_new
        if ln == 'l'
            load_and_deserialize
            Display.refresh_display
        elsif ln == 'n'
            Display.refresh_display
        end
        while @is_playing do
            Display.draw_word(@game.word, @game.guessed_letters)
            Display.show_guesses(@game.guessed_letters)
            Display.show_count(@game.wrong_guesses)
            Display.save_quit_query
            letter = Display.get_user_input
            result = @game.guess(letter)
            handle_game_result(result)
            if @game.game_over?
                Display.show_message(MESSAGES[:play_again]) 
                again = Display.get_user_input.downcase
                again == "y" ? restart : @is_playing = false
            end
        end
    end

    def load_and_deserialize
        yaml = File.read("saved_game.yml")
        saved_state = YAML::load(yaml)
        @game.load_game(saved_state)
    end

    def save_and_serialize
        save_state = @game.save_game
        yaml = YAML::dump(save_state)
        File.open("saved_game.yml", "w") { |f| f.write(yaml)}
        @is_playing = false
    end

    def display_instructions
        Display.show_context(MESSAGES[:instructions])
        #puts MESSAGES[:instructions]
    end

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
        when :save
            save_and_serialize
        when :quit
            exit
        end
    end
end