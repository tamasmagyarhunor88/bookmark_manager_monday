require 'sinatra/base'
require 'sinatra/flash'
require './lib/link'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    @links = Link.all
    erb :index
  end

  post '/add_link' do
    link, title = params[:new_link], params[:title]
    flash.now[:invalid_uri] = 'URI not valid' unless Link.add_new_link(link, title)
    @links = Link.all
    erb :index
  end


  run! if app_file == $0
end
