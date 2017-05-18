require "pry"

class Song
  attr_accessor :name, :artist_name, :song
  @@all = []

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
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    search = @@all.detect{|song| song.name == name}
    if search
      search
    else
      song = self.new
      song.name = name
      @@all << song
      song
    end
  end

  def self.alphabetical
    @@all.sort_by{|s| s.name.downcase}
  end

  def self.new_from_filename(filename)
    file_split = filename.split(" - ")
    name_split = file_split[1].split(".")
    song = self.new
    song.name = name_split[0]
    song.artist_name = file_split[0]
    song
  end

  def self.create_from_filename(filename)
    file_split = filename.split(" - ")
    name_split = file_split[1].split(".")
    song = self.new
    song.name = name_split[0]
    song.artist_name = file_split[0]
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
