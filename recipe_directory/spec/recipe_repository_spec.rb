require 'recipe_repository'

RSpec.describe RecipeRepository do
  DatabaseConnection.connect('recipes_directory')
  def reset_recipes_table
    seed_sql = File.read('spec/seeds_recipes.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_recipes_table
  end

  it "tests the '#all' method with psql" do
    
    repo = RecipeRepository.new

    recipes = repo.all

    expect(recipes.length).to eq 4
    expect(recipes.first.cooking_time.to_i).to eq 45
    expect(recipes.first.rating.to_i).to eq 5
  end

  it "returns the single recipe ('Lemon drizzle cake')" do

    repo = RecipeRepository.new

    recipe = repo.find(1)
    
    expect(recipe.id.to_i).to eq 1
    expect(recipe.name).to eq 'Lemon drizzle cake'
    expect(recipe.cooking_time.to_i).to eq 45
    expect(recipe.rating.to_i).to eq 5
  end

  it "returns the single recipe ('White chocolate cheesecake')" do

    repo = RecipeRepository.new

    recipe = repo.find(4)
    
    expect(recipe.id.to_i).to eq 4
    expect(recipe.name).to eq 'White chocolate cheesecake'
    expect(recipe.cooking_time.to_i).to eq 25
    expect(recipe.rating.to_i).to eq 4
  end
end