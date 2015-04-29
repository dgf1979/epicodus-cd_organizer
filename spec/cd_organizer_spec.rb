require('rspec')
require('cd_organizer')

describe(Cd) do
  it('returns the name of the artist') do
    cd = Cd.new('Thriller', 'Michael Jackson')
    expect(cd.name()).to(eq("Thriller"))
    expect(cd.artist()).to(eq("Michael Jackson"))
  end

  it('stores and returns a cd to the collection') do
    cd = Cd.new('Thriller', 'Michael Jackson')
    cd.save()
    expect(cd.all()).to(eq([cd]))
  end
end
