#!/usr/bin/env ruby

system("clear") or system("cls")

debug = false

GUESSES = 10
@guesses = 0
@keep_cheating = true
chosen_word = []

# load the words file into an array
words_array = File.readlines("words")

# an array that will hold the guessed letters
@guessed_letters = []


def handle_guess
  #system("clear") or system("cls")

  guess_again = false 

  puts "\n\nGuess a letter"

  # make sure it is case insensitive
  guess = gets.chomp.downcase

  # make sure to check that only one valid character was entered
  while guess.size != 1 || guess.index(/[a-zA-Z]/) == nil do
    puts "Please enter a single letter from the alphabet"
    # make sure it is case insensitive
    guess = gets.chomp.downcase
  end

  # check if the guess was already used
  unless @guessed_letters.find_index(guess) == nil; guess_again = true; end

  # if the letter was already guessed loop until they guess a letter that 
  #   hasn't been used
  while guess_again == true
    #system("clear") or system("cls")
    puts "You already guessed that letter, please guess again"
    # make sure it is case insensitive
    guess = gets.chomp.downcase

    # make sure to check that only one valid character was entered
    while guess.size != 1 || guess.index(/[a-zA-Z]/) == nil do
      puts "Please enter a single letter from the alphabet"
      # make sure it is case insensitive
      guess = gets.chomp.downcase
    end

    # if the guess is not in the array of guessed letters then set break clause
    if @guessed_letters.find_index(guess) == nil
      guess_again = false
    end
  end

  # add the guess to the array of guessed letters
  @guessed_letters << guess
  # decrement the number of guesses
  @guesses += 1
  return guess
end

def display (word)
  system("clear") or system("cls")
  print "\n\n\n WORD = "
  word.each {|letter| print "#{letter} "};print "\n\n\n"
  puts "Guesses left: #{GUESSES-@guesses}"
  puts "\nLetters guessed: #{@guessed_letters.join(',')}"
end

puts "\nPlease enter how long you would like the word to be in the range 5-20"

# get the size of word that the user want to play
word_size = gets.to_i

# check to make sure it is a valid size or set to defaluts
if word_size < 5
  word_size = 5
elsif word_size > 20
  word_size = 20
end

# delete all words that are not of the chosen size
words_array.map! {|word| word if word.size == word_size+1}.compact!

# this is the array that will show correct guesses, it starts with only _'s
the_word = Array.new(word_size, "_")

system("clear") or system("cls")

winner = false
# loop until the user doesn't have anymore guesses
while @guesses < GUESSES do
  # call display  
  display (the_word)

  # this is a loop to keep cheating while we can
  if @keep_cheating == false
    the_guess = handle_guess
  end
  while @keep_cheating == true do
    the_guess = handle_guess
    # check if the mapping would leave us with a size greater than zero. If it does than run
    #   the mapping, if it would leave us with no elements then stop cheating
    if (words_array.map {|word| word if word.count("#{the_guess}") == 0}.compact.size > 0)
      words_array.map! {|word| word if word.count("#{the_guess}") == 0}.compact!
      # call display
      display(the_word)
    else
      @keep_cheating = false
    end
  end

  # after cheating is done just pick the first word in the array to use
  chosen_word = words_array[0]
  
  # if it is a wrong guess move to next iteration
  if chosen_word.chars.find_index(the_guess) == nil
    next
  else
    # since the guess method increments guesses we have do decrement it
    #   on a correct guess
    @guesses -= 1
  end

  # this sets the letter from "_" to the correct letter
  chosen_word.bytes.each_index { |index| the_word[index] = the_guess if chosen_word[index] == the_guess }

  if the_word.find_index("_") == nil
    winner = true
    break
  end

end # out of guesses, finish game

# call display
display(the_word)

if winner == true
  puts "\nYou are a winner".upcase
else
  puts "\nSorry you did not win this time, try again"
end

puts "\nThe word was: #{chosen_word}\n\n\n"
