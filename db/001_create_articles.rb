Sequel.migration do
  change do
    create_table(:articles) do
      primary_key   :id
      String        :title
      Text          :body
      foreign_key   :author_id
    end
  end
end
