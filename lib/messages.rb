MESSAGES = {
    welcome: "\nWelcome to Hangman!  \n\n",
    instructions: "The game rules are as follows: \n
- The word is chosen at random from a list of 10,000 words
- Your goal is go guess what the word is.
- Each turn, you select one letter. 
- If that letter is in the word, the letter will be revealed in the word.
- If you guess incorrectly, your wrong guess count increases. 
- If you guess wrong too many times, you lose. \n 
Good luck. \n\n",
    enter_letter_prompt: "Please enter your guess",
    win: "w",
    lose: "l",
    win_message: "\nYou win!
Congratulations. 
You're a big deal.\n\n",
    lose_message: "\nYou have used all of your guesses. 
The correct word is %{insert}.
Sorry, better luck next time\n\n",
    duplicate_guess_message: "You already guessed that letter. Please try again",
    character_check1: "Please enter a single letter guess",
    character_check2: "Please enter only letters",
    char_mismatch_message: "Please enter only a single letter, alphanumeric",
    bad_guess: "The word does not contain the letter %{insert}",
    good_guess: "The word contains the letter %{insert}",
    play_again: "Would you like to play again?",
}