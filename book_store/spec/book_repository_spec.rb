require 'book_repository'

RSpec.describe BookRepository do
  def reset_books_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_books_table
  end

  it "returns a list of books as an array" do
    repo = BookRepository.new
    books = repo.all

    expect(books.length).to eq 3

    expect(books[0].id).to eq "1"
    expect(books[0].title).to eq "Pride and Prejudice"
    expect(books[0].author_name).to eq "Jane Austen"
  end

  it "returns a list of books as an array" do
    repo = BookRepository.new
    books = repo.all

    expect(books.length).to eq 3

    expect(books[2].id).to eq "3"
    expect(books[2].title).to eq "Little Women"
    expect(books[2].author_name).to eq "Louisa Alcott"
  end
end