require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/cd_organizer')
require('pry')

get('/test') do
  erb(:test)
end

get('/') do
  erb(:index)
end

get('/cds/new') do
  erb(:new_cd_form)
end

post('/cds') do
  title = params.fetch('title')
  artist = params.fetch('artist')
  cd = Cd.new(title, artist)
  Organizer.add_cd(cd)
  @cds = Organizer.all()
  erb(:cds)
end

get('/cds') do
  @cds = Organizer.all()
  erb(:cds)
end

get('/cds/:artist') do
  @artist = URI.decode(params.fetch('artist'))
  @titles = Organizer.titles_by(@artist)
  erb(:cds_list_by_artist)
end

get('/artists') do
  @artists = Organizer.all_artists()
  erb(:artists)
end
