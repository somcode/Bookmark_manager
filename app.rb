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
    flash[:notice] = "You must submit a valid URL." unless Link.create(url: params['url'])
    redirect '/'
  end

  run! if app_file == $0
end
