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
