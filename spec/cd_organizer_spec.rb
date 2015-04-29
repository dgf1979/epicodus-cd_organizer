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
    Organizer.clear()
    cd = Cd.new('Thriller', 'Michael Jackson')
    Organizer.add_cd(cd)
    #cd.save()
    expect(Organizer.all()).to(eq([cd]))
  end

  it('clears the list of cds') do
    cd = Cd.new('Thriller', 'Michael Jackson')
    Organizer.add_cd(cd)
    Organizer.clear()
    expect(Organizer.all()).to(eq([]))
  end

  it('returns a list of all artists') do
    cd = Cd.new('Thriller', 'Michael Jackson')
    Organizer.add_cd(cd)
    cd = Cd.new('The Wall', 'Pink Floyd')
    Organizer.add_cd(cd)
    cd = Cd.new('The White Album', 'The Beatles')
    Organizer.add_cd(cd)
    expect(Organizer.all_artists()[2]).to(eq('The Beatles'))
  end

  it('does not return duplicate artists') do
    Organizer.clear()
    cd = Cd.new('Thriller', 'Michael Jackson')
    Organizer.add_cd(cd)
    cd = Cd.new('Bad', 'Michael Jackson')
    Organizer.add_cd(cd)
    expect(Organizer.all_artists().length()).to(eq(1))
  end

  it('returns a list of titles by one artist (excluding duplicates)') do
    Organizer.clear()
    cd = Cd.new('Thriller', 'Michael Jackson')
    Organizer.add_cd(cd)
    cd = Cd.new('Bad', 'Michael Jackson')
    Organizer.add_cd(cd)
    expect(Organizer.titles_by("Michael Jackson")[0]).to(eq('Thriller'))
    expect(Organizer.titles_by("Michael Jackson")[1]).to(eq('Bad'))
  end

end
