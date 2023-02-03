require_relative 'album_repository'
require_relative 'artist_repository'
require_relative 'database_connection'

class Application

  # The Application class initializer
  # takes four arguments:
  #  * The database name to call `DatabaseConnection.connect`
  #  * the Kernel object as `io` (so we can mock the IO in our tests)
  #  * the AlbumRepository object (or a double of it)
  #  * the ArtistRepository object (or a double of it)
  def initialize(database_name, io, album_repository, artist_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  def run
    @io.puts 'Welcome to the music library manager!'
    @io.puts 'What would you like to do?'
    @io.puts '  1 - List all albums'
    @io.puts '  2 - List all artists'
      
      @io.print "Enter your choice: "
      input = @io.gets.chomp

      if input == '1'
        @io.puts "Here is the list of albums:"

        albums = @album_repository.all
        albums.each { |album| @io.puts "#{album.id} - #{album.title}" }

      else
        @io.puts "Here is the list of artists:"
        artists = @artist_repository.all
        artists.each { |artist| @io.puts "#{artist.id} - #{artist.name}" }
      end
  end
end


if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
end