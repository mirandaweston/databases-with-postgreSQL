# Book Store Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Designing and creating the Table

If the table is already created in the database, you can skip this step.

```


```

## 2. Creating Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql

TRUNCATE TABLE books RESTART IDENTITY;


INSERT INTO books (title, author_name) VALUES ('Pride and Prejudice', 'Jane Austen');
INSERT INTO books (title, author_name) VALUES ('Sense and Sensibility', 'Jane Austen');
INSERT INTO books (title, author_name) VALUES ('Little Women', 'Louisa Alcott');
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 book_store < seeds_books.sql
```

## 3. Defining the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby

# Table name: books

# Model class
# (in lib/book_repository.rb)
class Book
end

# Repository class
# (in lib/book_repository.rb)
class BookRepository
end
```

## 4. Implementing the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby


# Model class
# (in lib/book.rb)

class Book
  attr_accessor :id, :title, :author_name
end

```


## 5. Defining the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby

# Repository class
# (in lib/book_repository.rb)

class BookRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, title, author_name FROM books;

    # Returns an array of Book objects.
  end

end
```

## 6. Test Examples

Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby

repo = BookRepository.new

books = repo.all

books.length # =>  3

books[0].id # =>  1
books[0].title # =>  'Pride and Prejudice'
books[0].author_name # =>  'Jane Austen'

books[0].id # =>  3
books[0].title # =>  'Little Women'
books[0].author_name # =>  'Louisa Alcott'

```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data, to get a fresh table contents each time the test suite is ran.

```ruby


# file: spec/book_repository_spec.rb

def reset_books_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
  connection.exec(seed_sql)
end

describe BookRepository do
  before(:each) do 
    reset_books_table
  end

  # (tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---


<!-- END GENERATED SECTION DO NOT EDIT -->