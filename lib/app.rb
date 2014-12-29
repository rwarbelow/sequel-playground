require 'models/base'

module SequelPlayground
	DB = Sequel.postgres("sequel-playground")

	class Server < Sinatra::Base
		get '/' do
			erb :index
		end

		get '/authors' do
			erb :authors_index, locals: { authors: Author.all }
		end

		get '/articles' do
			erb :articles_index, locals: { articles: Article.all }
		end

		get '/authors/new' do
			erb :authors_new
		end

		get '/articles/new' do
			erb :articles_new
		end

		post '/articles' do
			Article.create(params[:article])
			redirect '/articles'
		end

		post '/authors' do
			Author.create(params[:author])
			redirect '/authors'
		end

		get '/articles/:id' do |id|
			erb :authors_show, locals: { author: Article.find(id) }
		end

		get '/authors/:id' do |id|
			erb :authors_show, locals: { author: Author.find(id) }
		end
	end

end
