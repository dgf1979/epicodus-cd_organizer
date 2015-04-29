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
    click_link('Michael Jackson')
    expect(page).to have_content('Bad')
  end
end
