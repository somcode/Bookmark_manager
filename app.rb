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
    link = Link.create(url: params['url'], title: params['title'])

    flash[:notice] = "You must submit a valid URL." unless link
    redirect('/')
  end

  post '/delete-link' do
    Link.delete(params['id'])
    redirect '/'
  end

  get '/update-link/:id' do
    @link_id = params['id']
    erb :update_link
  end

  post '/update-link' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("UPDATE links SET url = '#{params['url']}', title = '#{params['title']}' WHERE id = '#{params['id']}'")
    redirect('/')
  end



  run! if app_file == $0
end
