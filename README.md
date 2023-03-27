# Hangman

Game logic is run by class "Game" which holds attributes (guesses count, array of words, word, last guess, etc)
Game class also handles save / load data which is sent or grabbed by Interface. 
First off, the Game is created then added to the Interface class. 

Interface class uses Game object and accepts user input and runs the Game's loop.
Players can save the state or load. 
Output is handled by the Display module. 

Display module uses "Curses" to run the game in a user-friendly console window. 
via "Curses", the Display module allows for displaying the game board, current guesses, messages to player, etc. 

This game requires the Curses gem. 