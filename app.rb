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
  cd.save()
  @cds = Cd.all()
  erb(:cds)
end

get('/cds') do
  @cds = Cd.all()
  erb(:cds)
end
