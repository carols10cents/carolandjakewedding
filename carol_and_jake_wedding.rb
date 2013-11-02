require 'sinatra/base'
require 'slim'

class CarolAndJakeWedding < Sinatra::Base
  enable :sessions
  configure :production, :development do
    enable :logging
  end

  get '/' do
   slim :index
  end

  post '/verify' do
    logger.info params.inspect.to_s
    params[:words]
  end

  get '/details' do
    slim :details
  end

  get '/nope' do
    slim :nope
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
