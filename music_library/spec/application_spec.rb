require 'application'

RSpec.describe Application do
  before(:each) do
    @database = 'music_library_test'
    @io = double :io
    @album = double :album, id:1, title:'Doolittle', release_year:1989, artist_id:1
    @album_repo = double :album_repo, all:[@album] 
    @artist = double :artist, id:1, name:'Pixies', genre:'Rock'   
    @artist_repo = double :artist_repo, all:[@artist] 
  end


  it "prints a list of albums" do
    expect(@io).to receive(:puts).with("Welcome to the music library manager!")
    expect(@io).to receive(:puts).with("What would you like to do?")
    expect(@io).to receive(:puts).with("  1 - List all albums")
    expect(@io).to receive(:puts).with("  2 - List all artists")
    expect(@io).to receive(:print).with("Enter your choice: ")
    expect(@io).to receive(:gets).and_return('1')
    expect(@io).to receive(:puts).with("Here is the list of albums:")
    expect(@io).to receive(:puts).with("1 - Doolittle")
    app = Application.new(@database,@io,@album_repo,@artist_repo)
    app.run
  end

  it "prints a list of artists" do
    expect(@io).to receive(:puts).with("Welcome to the music library manager!")
    expect(@io).to receive(:puts).with("What would you like to do?")
    expect(@io).to receive(:puts).with("  1 - List all albums")
    expect(@io).to receive(:puts).with("  2 - List all artists")
    expect(@io).to receive(:print).with("Enter your choice: ")
    expect(@io).to receive(:gets).and_return('2')
    expect(@io).to receive(:puts).with("Here is the list of artists:")
    expect(@io).to receive(:puts).with("1 - Pixies")
    app = Application.new(@database,@io,@album_repo,@artist_repo)
    app.run
  end


end