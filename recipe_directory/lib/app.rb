#file: app.rb

require_relative 'database_connection'
require_relative 'recipe_repository'

DatabaseConnection.connect('recipe_directory_test')

sql = 'SELECT id, name, cooking_time, rating FROM recipes'
result = DatabaseConnection.exec_params(sql, [])

result.each do
  puts "#{record['id']} - #{record['name']} - #{record['cooking_time']} - #{record['rating']}"
end