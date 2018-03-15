require 'sinatra/base'
require './lib/link'
require './database_connection_setup'
require 'uri'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    @links = Link.all
    erb :index
  end

  get '/add-new-link' do
    erb :new
  end

  post '/create-new-link' do
    if params['url'] =~ /\A#{URI::regexp(['http', 'https'])}\z/
      Link.create(url: params['url'])
    else
      flash[:notice] = "You must submit a valid URL."
    end
    redirect '/'
  end

  run! if app_file == $0
end
