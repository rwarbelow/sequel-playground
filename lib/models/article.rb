class Article
	def initialize(attributes)
		@title		 = attributes[:title]
		@body			 = attributes[:body]
		@author_id = attributes[:author_id]
		@id 			 = Article.next_id
	end

	def self.next_id
		all.count + 1
	end

	def self.all
		DB.from(:posts)
	end

	def self.save(post)

	end
end
