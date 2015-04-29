require('rspec')
require('pry')
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
    expect(Cd.all()).to(eq([cd]))
  end

  it('clears the list of cds') do
    cd = Cd.new('Thriller', 'Michael Jackson')
    cd.save()
    Cd.clear()
    expect(Cd.all()).to(eq([]))
  end

  it('returns a list of all artists') do
    cd = Cd.new('Thriller', 'Michael Jackson')
    cd.save()
    cd = Cd.new('The Wall', 'Pink Floyd')
    cd.save()
    cd = Cd.new('The White Album', 'The Beatles')
    cd.save()
    expect(Cd.all_artists()[2]).to(eq('The Beatles'))

  end
end
