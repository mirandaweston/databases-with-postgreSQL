require_relative 'recipe'
require_relative 'database_connection'

class RecipeRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    sql = 'SELECT id, name, cooking_time, rating FROM recipes;'
    result_set = DatabaseConnection.exec_params(sql, [])

    recipes = []

    result_set.each do |record|
      recipe = Recipe.new
      recipe.id = record['id']
      recipe.name = record['name']
      recipe.cooking_time = record['cooking_time']
      recipe.rating = record['rating']

      recipes << recipe
    end

    return recipes

    # Returns an array of Recipe objects.
  end

  #select a single recipe record
  #given its id in argument (a number)

  def find(id)
  #executes the SQL
  sql = 'SELECT id, name, cooking_time, rating FROM recipes WHERE id = $1;'
  sql_params = [id]

  result_set = DatabaseConnection.exec_params(sql, sql_params)
  record = result_set[0]

  recipe = Recipe.new
  recipe.id = record['id']
  recipe.name = record['name']
  recipe.cooking_time = record['cooking_time']
  recipe.rating = record['rating']

  return recipe

  #returns a single Recipe object
  end
end