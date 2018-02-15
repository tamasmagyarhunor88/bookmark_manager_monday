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
    link = params[:new_link]
    flash.now[:invalid_uri] = 'URI not valid' unless Link.add_new_link(link)
    @links = Link.all
    erb :index
  end


  run! if app_file == $0
end

# Link.valid(link)? Link.add_new_link(link) : flash.now
