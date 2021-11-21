require 'rails_helper'

RSpec.describe 'NewMovie', type: :feature do
  it 'success' do
    visit '/movies/new'
    fill_in "movie_name", :with => "hola"
    fill_in "movie_photo", :with => "foto"
    click_button "commit"
    expect(page).to have_content("Name:")
  end
end
