class HomeController < ApplicationController

  def index
    load "#{Rails.root}/lib/ladder.rb"
    @start_word = dictionary[rand(dictionary.length)]
    @end_word = dictionary[rand(dictionary.length)] 
    while @start_word == @end_word
      @end_word = dictionary[rand(dictionary.length)] 
    end
  end

  def results
    @start = params[:start]
    @end = params[:end]
    @user_words = []
    # load all the user entered words into an array so they are in order
    @user_words << params[:word1];@user_words << params[:word2];@user_words << params[:word3];@user_words << params[:word4];@user_words << params[:word5]
    # get rid of any empty words
    @user_words.map! {|word| word if word != ""}.compact!

    # create an array that includes the start and end words to check the ladder
    total_array = []
    total_array << @start;
    @user_words.each {|word| total_array << word}
    total_array << @end

    # assign the corresponding message to @result
    if legal(total_array)
      @result = "You Won!"
    else
      @result = "You Lost, try again!"
    end
  end
end
