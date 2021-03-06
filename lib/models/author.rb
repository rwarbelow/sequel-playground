module SequelPlayground
	class Author
		attr_reader :id, :first_name, :last_name

		def initialize(attributes)
			@id 				= attributes[:id]
			@first_name = attributes[:first_name]
			@last_name  = attributes[:last_name]
		end

		def self.table
			DB.from(:authors)
		end

		def self.create(attributes)
			table.insert(
				:id				  => next_id,
				:first_name => attributes[:first_name],
				:last_name  => attributes[:last_name],
				)
		end

		def self.next_id
			table.count + 1
		end

		def self.all
			table.map { |row| Author.new(row) }
		end

		def articles
			DB.from(:articles).where(author_id: self.id).map { |row| Article.new(row) }
		end

		def self.find(id)
			row = table.where(id: id).first
			Author.new(row)
		end
	end
end
