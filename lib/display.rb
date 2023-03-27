require 'curses'
require_relative 'messages'

module Display
include Curses

    def self.init_curses
        Curses.init_screen
        Curses.cbreak
        #Curses.noecho
        Curses.stdscr.keypad(true)
    end

    def self.load_or_new
        Curses.setpos(1,0)
        Curses.addstr("New game or Load game? ('n' / 'l')")
        Curses.setpos(2,0)
        Curses.addstr(">")
        Curses.getstr.chomp
    end

    def self.draw_hangman(guesses)
        # code here
    end
  
    def self.draw_word(word, guessed_letters)
        Curses.setpos(4,0)
        Curses.clrtoeol
        disp_arr = word.chars.map { |s| guessed_letters.include?(s) ? s : "_"}.join(" ")
        Curses.addstr(disp_arr)
    end
    
    def self.show_guesses(guesses)
        Curses.setpos(5,0)
        Curses.addstr("Guesses so far: #{guesses.join(",")}")
    end

    def self.show_count(wrong_guesses)
        Curses.setpos(6,0)
        Curses.addstr("Wrong guesses: #{wrong_guesses}")
    end

    def self.show_message(msg)
        Curses.setpos(1,0)
        Curses.clrtoeol
        Curses.addstr(msg)
    end

    def self.show_context(msg)
        Curses.setpos(12,0)
        Curses.addstr(msg)
    end

    def self.get_user_input
        Curses.setpos(8,0)
        Curses.clrtoeol
        Curses.addstr("> ")
        Curses.getstr.chomp
    end

    def self.user_query
        Curses.setpos(9,0)
        Curses.addstr("type 'save' to save game and exit, 'quit' to end game.")
    end

    def self.refresh_display
        Curses.refresh
        Curses.clear
    end
  end