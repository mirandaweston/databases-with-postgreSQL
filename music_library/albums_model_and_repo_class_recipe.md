# Albums Model and Repository Classes Design Recipe


## 1. Designing and creating the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).


## 2. Creating Test SQL seeds

Tests will depend on data stored in PostgreSQL to run.

```sql

-- (file: spec/seeds_albums.sql)

-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE albums RESTART IDENTITY; 

-- Below this line there should only be `INSERT` statements.

INSERT INTO albums (title, release_year, artist_id) VALUES ('Renaissance', '2022', '1');
INSERT INTO albums (title, release_year, artist_id) VALUES ('Future Nostalgia', '2021', '2');

```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_albums.sql
```

## 3. Defining the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby

# Table name: albums

# Model class
# (in lib/album.rb)
class Album
end

# Repository class
# (in lib/album_repository.rb)
class AlbumRepository
end
```

## 4. Implementing the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby

# Table name: albums

# Model class
# (in lib/album.rb)

class Album

  attr_accessor :id, :title, :release_year, :artist_id
end

```


## 5. Defining the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby

# Repository class
# (in lib/album_repository.rb)

class AlbumRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, title, release_year, artist_id FROM albums;

    # Returns an array of Album objects.
  end

  #select a single album record
  #given its id in argument (a number)

  def find(id)
  #executes the SQL
  #SELECT id, title, release_year, artist_id FROM albums WHERE id = $1;

  #returns a single Album object
  end
end
```

## 6. Test Examples

Ruby code defining the expected behaviour of the Repository class, following the design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby

# 1
# get all albums

repo = AlbumRepository.new

albums = repo.all

albums.length # =>  2

albums.first.id # =>  "1"
albums.first.title # =>  "Renaissance"
albums.first.release_year # => "2022"

```

```ruby
# get a single album ('Renaissance')

repo = AlbumRepository.new
album = repo.find(1)

album.title # => 'Renaissance'
album.release_year # => '2022'
album.artist_id # => '1'

```
```ruby
# 3
# get a single album ('Future Nostalgia')

repo = AlbumRepository.new
album = repo.find(2)

album.title # => 'Future Nostalgia'
album.release_year # => '2021'
album.artist_id # => '2'

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby


# file: spec/album_repository_spec.rb

  def reset_albums_table
    seed_sq1 = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

describe AlbumRepository do
  before(:each) do
    reset_albums_table
  end

  # (tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->



<!-- END GENERATED SECTION DO NOT EDIT -->