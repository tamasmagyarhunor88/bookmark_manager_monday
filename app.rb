require 'sinatra/base'
require './lib/link'

class BookmarkManager < Sinatra::Base
  get '/' do
    @links = Link.all
    # @links = [
    #   "https://www.getfitwithhunor.com",
    #   "http://bepositivelikehunor.com",
    #   "http://hunor.wikipedia.org"
    # ]
    erb :index
  end

  run! if app_file == $0
end
