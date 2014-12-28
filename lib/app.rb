require 'models/article'
require 'models/author'

module SequelPlayground
	DB = Sequel.postgres "sequel-playground"

	class Server < Sinatra::Base
		get '/' do
			erb :index, locals: { authors: Author.all }
		end

		get '/authors' do
			erb :authors_index
		end

		get '/articles' do
			erb :articles_index
		end

		get '/authors/new' do
			erb :authors_new
		end

		get '/articles/new' do
			erb :articles_new
		end

		post '/articles' do

		end

		post '/authors' do
			Author.create(params[:author])
			redirect '/'
		end

		get '/articles/:id' do

		end

		get '/authors/:id' do

		end
	end

end
