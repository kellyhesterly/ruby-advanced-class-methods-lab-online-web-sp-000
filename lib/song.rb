require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
      song = self.new
      @@all << song
      song
    end

    def self.new_by_name(name)
      song = self.new
      song.name = name
      song
    end

    def self.create_by_name(name)
      song = self.new
      song.name = name
      @@all << song
      song
    end

    def self.find_by_name(name)
      @@all.find {|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
     return find_by_name(name) || create_by_name(name)
    end

    def self.alphabetical
      self.all.sort_by{|song| song.name}
    end

    def self.new_from_filename(name)
      new_name = name.split(" ")
      artist = new_name[0]
      name.slice! ".mp3"
      binding.pry
      song = self.new
      song.name = name
    end

end
