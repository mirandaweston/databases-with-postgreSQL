require_relative 'database_connection'
require_relative 'album_repository'
require_relative 'artist_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')

# Perform a SQL query on the database and get the result set.
# sql = 'SELECT id, title FROM albums;'
# result = DatabaseConnection.exec_params(sql, [])

# # Print out each album from the result set

artist_repository = ArtistRepository.new

artist_repository.all.each do |artist| 
  p artist
end 

album_repository = AlbumRepository.new

album_repository.all.each do |album|
  p album
end

# get the album with id 2

album = album_repository.find(2)

puts album.id
puts album.title
puts album.release_year