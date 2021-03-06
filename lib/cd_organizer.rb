class Organizer
  @@all_cds = []

  define_singleton_method(:clear) do
    @@all_cds = []
  end

  define_singleton_method(:all) do
    @@all_cds
  end

  define_singleton_method(:add_cd) do |new_cd|
    @@all_cds.push(new_cd)
  end

  define_singleton_method(:all_artists) do
    artists = []
    @@all_cds.each() do |cd|
      if !artists.include?(cd.artist())
        artists.push(cd.artist())
      end
    end
    artists
  end

  define_singleton_method(:titles_by) do |artist|
    titles_by = []
    @@all_cds.each() do |cd|
      if cd.artist() == artist
        titles_by.push(cd.name())
      end
    end
    titles_by
  end

end

class Cd
  define_method(:initialize) do |name, artist|
    @name = name
    @artist = artist
  end

  define_method(:name) do
    @name
  end

  define_method(:artist) do
    @artist
  end
end
