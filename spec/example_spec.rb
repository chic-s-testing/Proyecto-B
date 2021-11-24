require 'rails_helper'

# Ejemplo que no funciona, pero para saber cómo debería ser
RSpec.describe 'ExampleMoviesIndex', type: :feature do
  it 'success' do
    visit '/movies'
    expect(page).to have_content("Movies")
  end
end