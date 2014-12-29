module SequelPlayground
	class Article
		attr_reader :title, :body, :author_id, :id

		def initialize(attributes)
			@title		 = attributes[:title]
			@body			 = attributes[:body]
			@author_id = attributes[:author_id]
			@id 			 = attributes[:id]
		end

		def self.next_id
			table.count + 1
		end

		def self.table
			DB.from(:articles)
		end

		def self.create(attributes)
			table.insert(
				:id				  => next_id,
				:title		  => attributes[:title],
				:body			  => attributes[:body],
				:author_id  => attributes[:author_id].to_i
				)
		end

		def self.all
			table.map { |row| Article.new(row) }
		end

		def self.find(id)
			row = table.where(id: id).first
			Article.new(row)
		end

		def author
			row = DB.from(:authors).where(id: author_id).first
			Author.new(row)
		end

	end
end
