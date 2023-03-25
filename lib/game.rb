require_relative 'messages'

class Game
include Display

    attr_accessor :word
    attr_accessor :guessed_letters
    attr_reader :words_arr
    attr_reader :wrong_guesses
    attr_reader :last_guess

    def initialize(arr)
        @words_arr = arr
        @word = @words_arr.select{ |s| s.length >= 5 && s.length <= 12}.sample 
        @guessed_letters = []
        @wrong_guesses = 0
        @last_guess = " "
    end

    def reset_game
        @word = @words_arr.select{ |s| s.length >= 5 && s.length <= 12}.sample 
        @guessed_letters = []
        @wrong_guesses = 0
        @last_guess = " "
    end

    def guess(letter)
        return :duplicate_guess if @guessed_letters.include?(letter)
        return :char_mismatch if !letter.match?(/[[:alpha:]]/)
        @last_guess = letter
        @guessed_letters << letter
        if @word.include?(letter)
            if game_won?
                :win
            else
                :good_guess
            end
        else
            @wrong_guesses += 1
            if game_lost?
                :lose
            else
                :bad_guess
            end
        end
    end

    def game_over?
        game_won? || game_lost?
    end

    def current_state
        #serialize & return the current state of the game
    end

    def game_won?
        #determine if the game is won
        wrong_guesses < 6 && @word.chars.all? { |c| guessed_letters.include?(c) }
    end

    def game_lost?
        #determine if the game is lost. 
        wrong_guesses >=6 
    end
end