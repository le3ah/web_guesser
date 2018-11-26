require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

  def check_guess(guess)
    if guess.to_i > NUMBER && guess.to_i - NUMBER > 5
      "Way too high!"
    elsif guess.to_i < NUMBER && NUMBER - guess.to_i > 5
      "Way too low!"
    elsif guess.to_i < NUMBER
      "Too low!"
    elsif guess.to_i > NUMBER
      "Too high!"
    elsif guess.to_i == NUMBER
      "You got it right! The SECRET NUMBER is #{NUMBER}"
    end
  end

  get '/' do
    guess = params["guess"]
    message = check_guess(guess)
    erb :index, :locals => {:number => NUMBER, :message => message}
  end
