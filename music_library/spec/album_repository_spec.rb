require 'album_repository'

RSpec.describe AlbumRepository do

  def reset_albums_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_albums_table
  end

  it 'tests the all method with psql' do 

    repo = AlbumRepository.new

    albums = repo.all

    expect(albums.length).to eq 2 
    expect(albums.first.id.to_i).to eq 1
    expect(albums.first.title).to eq "Renaissance"
    expect(albums.first.release_year.to_i).to eq 2022
  end

  it 'returns the single album Renaissance' do
    repo = AlbumRepository.new

    album = repo.find(1)

    expect(album.title).to eq "Renaissance"
    expect(album.release_year.to_i).to eq 2022
    expect(album.artist_id.to_i).to eq 1
  end

  it 'returns the single album Future Nostalgia' do
    repo = AlbumRepository.new

    album = repo.find(2)

    expect(album.title).to eq "Future Nostalgia"
    expect(album.release_year.to_i).to eq 2021
    expect(album.artist_id.to_i).to eq 2
  end

  it 'creates a new album' do
    repo = AlbumRepository.new

    new_album = double :album, title:'Brand New Eyes', release_year:2009, artist_id:1

    repo.create(new_album)

    all_albums = repo.all

    expect(all_albums.length).to eq 3
    expect(all_albums.last.title).to eq 'Brand New Eyes'
    expect(all_albums.last.release_year.to_i).to eq 2009
    expect(all_albums.last.artist_id.to_i).to eq 1

    # all_albums should contain the new album
  end
end