require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

  def check_guess(num_guess)
    if num_guess.to_i > NUMBER && num_guess.to_i - NUMBER > 5
      "Way too high!"
    elsif num_guess.to_i < NUMBER && NUMBER - num_guess.to_i > 5
      "Way too low!"
    elsif num_guess.to_i < NUMBER
      "Too low!"
    elsif num_guess.to_i > NUMBER
      "Too high!"
    elsif num_guess.to_i == NUMBER
      "You got it right! The SECRET NUMBER is #{NUMBER}"
    end
  end

  get '/' do
    guess = params["guess"]
    message = check_guess(guess)
    erb :index, :locals => {:number => NUMBER, :message => message}
  end
