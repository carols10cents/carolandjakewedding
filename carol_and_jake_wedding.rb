require 'sinatra/base'
require 'slim'

class CarolAndJakeWedding < Sinatra::Base
  enable :sessions
  configure :production, :development do
    enable :logging
  end

  get '/' do
    if session[:allowed]
      redirect to('/details')
    else
      slim :index
    end
  end

  post '/verify' do
    if params[:words].downcase.strip == "come celebrate"
      session[:allowed] = true
      redirect to('/details')
    else
      redirect to('/nope')
    end
  end

  get '/details' do
    if session[:allowed]
      slim :details
    else
      redirect to('/')
    end
  end

  get '/nope' do
    slim :nope
  end

  not_found do
    slim :'404'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
