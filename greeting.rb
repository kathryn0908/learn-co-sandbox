#require_relative "../lib/song.rb"

class Artist
    attr_accessor :name

   

    def initialize(name)
        @name = name
        @songs = []
    end

    def add_song(song)
        self.songs << song
        song = Song.new(name)
        song.artist = self
        

    end

    
    def add_song_by_name(name)
        song = Song.new(name)
        self.songs << song
        song.artist = self
       
        #name.artist = self
      end
    
    def songs
        @songs
    end

    def self.song_count
      self.songs.count
    end
end

class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name, artist=nil)
        @name = name
        @artist = artist
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def artist_name
        if self.artist
           self.artist.name
        else
            nil
        end
    end

end

adele = Artist.new("Adele")
p adele.name
hello = Song.new("Hello", "Adele")
p hello.artist
hello.artist = adele
# p hello.artist
# p adele.songs
# p hello.artist
adele.add_song(hello)
# p adele.songs.count
# p Song.all.first.name

#p adele.song_count
p hello.artist_name


