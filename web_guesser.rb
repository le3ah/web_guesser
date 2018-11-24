require 'sinatra'

get '/' do
  x = rand(100)
  "The secret number is #{x}"
end
