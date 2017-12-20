require_relative "artist"
require_relative "mp3_importer"
require 'pry'

class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name

  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by_name(artist_name.name)
    self.artist.add_song(self)
  end

  def self.new_by_filename(file_name)

    return_file = file_name.split(" - ")
    artist_name = return_file[0]
    song_name = return_file[1]
    # new_song = Song.new(song_name)
    new_song = self.new(song_name)
    new_song.artist_name = Artist.new(artist_name)
    # binding.pry
    # new_song.artist.add_song(new_song)
    new_song

  end



end
