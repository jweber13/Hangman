module Display

    def self.draw_hangman(guesses_left)
        # code here
    end
  
    def self.draw_word(word, guessed_letters)
        disp_arr = word.chars.map { |s| guessed_letters.include?(s) ? s : "_"}.join(" ")
        p disp_arr
    end
    
    def self.show_guesses(guesses)
        puts "Guesses so far: #{guesses.join(",")}"
    end

    def self.show_count(wrong_guesses)
        puts "Wrong guesses: #{wrong_guesses}"
    end

  end