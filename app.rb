require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/' do
    @links = [
      "http://www.makersacademy.com",
      "http://www.facebook.com",
      "http://www.google.com"
              ]
    erb :index
  end

  run! if app_file == $0

end
