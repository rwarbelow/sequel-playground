require "bundler"
Bundler.require

namespace :db do
  desc "Setup database"
  task :setup do
    Sequel.extension :migration
    @database = Sequel.postgres "sequel-playground"
  end

  desc "Run migrations"
  task :migrate => [:setup] do
    Sequel::Migrator.run(@database, "db")
  end

  desc "Reset database"
  task :reset => [:setup] do
    Sequel::Migrator.run(@database, "db", :target => 0)
    Sequel::Migrator.run(@database, "db")
  end
end
