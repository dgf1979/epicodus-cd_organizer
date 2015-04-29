require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("Sinatra test", {:type => :feature}) do
  it('checks a test page to verify basic Sinatra functionality') do
    visit('/test')
    expect(page).to have_content('Sinatra OK')
  end
end

describe("CD Organizer", {:type => :feature}) do
  it('creates a new CD and returns it in the list of all cds') do
    visit('/cds/new')
    fill_in('title', :with => 'Bad')
    fill_in('artist', :with => 'Michael Jackson')
    click_button('Add CD')
    expect(page).to have_content("Michael Jackson")
    expect(page).to have_content("Bad")
  end

  it('search for titles by artist') do
    visit('/cds/new')
    fill_in('title', :with => 'Bad')
    fill_in('artist', :with => 'Michael Jackson')
    click_button('Add CD')
    first(:link, 'Michael Jackson').click
    expect(page).to have_content('Bad')
  end

  it('list all artists as links to cd lists') do
    #add a cd
    visit('/cds/new')
    fill_in('title', :with => 'The Wall')
    fill_in('artist', :with => 'Pink Floyd')
    click_button('Add CD')
    #visist artists list and select an artist to view
    visit('/artists')
    first(:link, 'Pink Floyd').click
    expect(page).to have_content('The Wall')
  end
end
