require 'rails_helper'

# Ejemplo
RSpec.describe 'ExampleMoviesIndex', type: :feature do
  it 'success' do
    visit '/movies'
    expect(page).to have_content("Movies")
  end
end