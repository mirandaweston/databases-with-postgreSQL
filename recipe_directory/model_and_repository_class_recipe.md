# Recipes Directory Model and Repository Classes Design Recipe


## 1. Designing and creating the Table

(See recipes_directory_single_class_recipe)


## 2. Creating Test SQL seeds

Tests will depend on data stored in PostgreSQL to run.

```sql

-- (file: spec/seeds.sql)

-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE recipes RESTART IDENTITY; 

-- Below this line there should only be `INSERT` statements.

INSERT INTO recipes (name, cooking_time, rating) VALUES ('Lemon drizzle cake', '45', '5');
INSERT INTO recipes (name, cooking_time, rating) VALUES ('Chocolate brownie', '40', '3');
INSERT INTO recipes (name, cooking_time, rating) VALUES ('Sticky toffee pudding', '30', '4');
INSERT INTO recipes (name, cooking_time, rating) VALUES ('White chocolate cheesecake', '25', '4');

```
## 3. Defining the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby

# Table name: recipes

# Model class
# (in lib/recipe.rb)
class Recipe
end

# Repository class
# (in lib/recipe_repository.rb)
class RecipeRepository
end
```

## 4. Implementing the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby

# Table name: recipes

# Model class
# (in lib/recipe.rb)

class Recipe
  attr_accessor :id, :name, :cooking_time, :rating
end

```


## 5. Defining the Repository Class interface

The Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby

# Repository class
# (in lib/recipe_repository.rb)

class RecipeRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, cooking_time, rating FROM recipes;

    # Returns an array of Recipe objects.
  end

  #select a single recipe record
  #given its id in argument (a number)

  def find(id)
  #executes the SQL
  #SELECT id, name, cooking_time, rating FROM recipes WHERE id = $1;

  #returns a single Recipe object
  end
end
```

## 6. Test Examples

Ruby code defining the expected behaviour of the Repository class, following the design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby

# 1
# get all recipes

repo = RecipeRepository.new

recipes = repo.all

recipes.length # =>  4

recipes.first.id # =>  "1"
recipes.first.name # =>  "Lemon drizzle cake"
recipes.first.cooking_time # => "45"
recipes.first.rating # => "5"

```

```ruby

# 2
# get a single recipe ('Lemon drizzle cake')

repo = RecipeRepository.new

recipe = repo.find(1)

recipe.name # => 'Lemon drizzle cake'
recipe.cooking_time # => '45'
recipe.rating # => '5'

```
```ruby

# 3
# get a single recipe ('White chocolate cheesecake')

repo = RecipeRepository.new

recipe = repo.find(4)

recipe.name # => 'White chocolate cheesecake'
recipe.cooking_time # => '25'
recipe.rating # => '4'

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby


# file: spec/recipe_repository_spec.rb

RSpec.describe RecipeRepository do
  DatabaseConnection.connect('recipes_directory')
  def reset_recipes_table
    seed_sq1 = File.read('spec/seeds_recipes.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_recipes_table
  end

  # (tests will go here).
end
```

## 8. Test-driving and implementing the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->



<!-- END GENERATED SECTION DO NOT EDIT -->