# file: app.rb

#require_relative 'lib/database_connection'
require_relative 'lib/recipes_repository'
require_relative 'lib/recipe'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipes_directory')

# Perform a SQL query on the database and get the result set.
#sql = 'SELECT id, title FROM albums;'
#result = DatabaseConnection.exec_params(sql, [])
repo = RecipeRepository.new
recipes = repo.all

# Print out each record from the result set .
recipes.each do |record|
  puts "#{record.id} - #{record.name} - #{record.cook_time} - #{record.rating}"
end