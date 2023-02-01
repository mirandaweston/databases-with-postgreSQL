require_relative 'artist'

class ArtistRepository

  # selecting all records

  def all
    sql = 'SELECT id, name, genre FROM artists'
    result_set = DatabaseConnection.exec_params(sql, [])
    # Executes the SQL query:
    # SELECT id, name, genre FROM artists;

    artists = []

    result_set.each do |record|
      artist = Artist.new
      artist.id = record['id']
      artist.name = record['name']
      artist.genre = record['genre']

      artists << artist
    end 
   
    return artists
  end
end