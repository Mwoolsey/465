#!/usr/bin/env ruby


=begin
  an update function might help
=end

debug = false

GUESSES = 10
@guesses = 0
@keep_cheating = true

# load the words file into an array
words_array = File.readlines("words")

# an array that will hold the guessed letters
@guessed_letters = []


def handle_guess
  #system("clear") or system("cls")

  guess_again = false 

  puts "Guess a letter"

  guess = gets.chomp

  # make sure to check that only one valid character was entered
  while guess.size != 1 || guess.index(/[a-zA-Z]/) == nil do
    puts "Please enter a single letter from the alphabet"
    guess = gets.chomp
  end

  # check if the guess was already used
  unless @guessed_letters.find_index(guess) == nil; guess_again = true; end

  # if the letter was already guessed loop until they guess a letter that 
  #   hasn't been used
  while guess_again == true
    #system("clear") or system("cls")
    puts "You already guessed that letter, please guess again"
    guess = gets.chomp

    if @guessed_letters.find_index(guess) == nil
      guess_again = false
    end
  end

  puts "\nYour guess was: #{guess}"

  # add the guess to the array of guessed letters
  @guessed_letters << guess
  # decrement the number of guesses
  @guesses += 1
  return guess
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

# call display here

# print the word
print "\n\n\n WORD = "
the_word.each {|letter| print "#{letter} "}
print "\n\n\n"


winner = false

# loop until the user doesn't have anymore guesses
while @guesses < GUESSES do

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
      words_array.each {|word| puts word if debug == true}
    else
      @keep_cheating = false
    end
  end

=begin
  # remove any words with the matching character
  while (words_array.map {|word| word if word.count("#{handle_guess}") == 0}.compact.size > 0) do
    puts "\nThe size of words_array is now: #{words_array.size}"
    #words_array.map! {|word| word if word.count("#{handle_guess}") == 0}.compact!
  end
=end

  # after cheating is done just pick the first word in the array to use
  chosen_word = words_array[0]
  
  next if chosen_word.chars.find_index(the_guess) == nil
  the_word[chosen_word.chars.find_index(the_guess)] = the_guess

  the_word.each {|letter| print "#{letter} "}
  puts

  if the_word.find_index("_") == nil
    winner = true
    break
  end

end

if winner == true
  puts "You are a winner"
else
  puts "Sorry you did not win this time, try again"
end
