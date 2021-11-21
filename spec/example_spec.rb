require 'rails_helper'

# Ejemplo que no funciona, pero para saber cómo debería ser
RSpec.describe 'ExampleHome', type: :feature do
  it 'success' do
    visit '/'
    expect(page).to have_content("Yay! You’re on Rails!")
  end
end