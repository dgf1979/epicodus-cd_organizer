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

  it('does not return duplicate artists') do
    Cd.clear()
    cd = Cd.new('Thriller', 'Michael Jackson')
    cd.save()
    cd = Cd.new('Bad', 'Michael Jackson')
    cd.save()
    expect(Cd.all_artists().length()).to(eq(1))
  end

  it('returns a list of titles by one artist (excluding duplicates)') do
    Cd.clear()
    cd = Cd.new('Thriller', 'Michael Jackson')
    cd.save()
    cd = Cd.new('Bad', 'Michael Jackson')
    cd.save()
    expect(Cd.titles_by("Michael Jackson")[0]).to(eq('Thriller'))
    expect(Cd.titles_by("Michael Jackson")[1]).to(eq('Bad'))
  end

end
