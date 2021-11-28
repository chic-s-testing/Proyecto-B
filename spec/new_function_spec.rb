require 'rails_helper'

RSpec.describe 'New Function', type: :feature do

  before (:each) do
    visit '/movies/new'
    fill_in 'movie_name', :with => "Percy Jackson"
    fill_in 'movie_photo', :with => "https://m.media-amazon.com/images/M/MV5BMTQ5NDlmZWUtMjIyMC00NzQ3LTg3OWYtMzRkY2FiNzQ0Njc4XkEyXkFqcGdeQXVyNDQ2MTMzODA@._V1_.jpg"
    fill_in 'movie_initialDate', :with => "01-01-2022"
    fill_in 'movie_finalDate', :with => "01-01-2024"
    click_button "commit"
  end

  it 'success' do
    visit "/movies/#{Movie.last.id}/functions/new"
    select "Noche", from: 'function_schedule'
    select "Sala 1", from: 'function_room'
    click_button "commit"
    expect(page).to have_content("La función fue creada exitosamente.")
  end

  it 'succes with only room selection' do
    visit "/movies/#{Movie.last.id}/functions/new"
    select "Sala 3", from: 'function_room'
    click_button "commit"
    expect(page).to have_content("La función fue creada exitosamente.")
  end

  it 'succes with only schedule selection' do
    visit "/movies/#{Movie.last.id}/functions/new"
    select "Tanda", from: 'function_schedule'
    click_button "commit"
    expect(page).to have_content("La función fue creada exitosamente.")
  end
end

