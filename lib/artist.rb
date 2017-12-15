require_relative "mp3_importer"
require_relative "song"
require 'pry'

class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs  = []
    # self.save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  # def self.create_by_name(artist_name)
  #   new_artist = Artist.new(artist_name)
  #   new_artist.name = artist_name
  #   new_artist
  #   # binding.pry
  # end
  #
  # def self.find_by_name(find_name)
  #   h = all.find do |artist|
  #     artist.name = find_name
  #
  #   end

  # end

  def self.find_or_create_by_name(name)
    # if find_by_name(name)
    #   find_by_name(name)
    # else
    #   create_by_name(name)
    # end

    find_artist = @@all.find{|artist| artist.name == name}
    if find_artist
      find_artist
    else
      artist = Artist.new(name)
      artist.save
    end

  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song
  end
  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end

end
