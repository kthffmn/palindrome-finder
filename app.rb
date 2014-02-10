###################################
### P A L I N D R O M E   A P P ###
###################################

require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile
require './lib/palindrome.rb'

class App < Sinatra::Application

	get '/' do
		erb :index
	end

	post '/result' do
		palindrome = Palindrome.new(params["string"])
		@string = params["string"]
    @result = palindrome.get_longest
		erb :results
	end

end
