require 'rails_helper'

RSpec.describe 'New Movie with InitialDate after FinalDate', type: :feature do
  it 'success' do
    visit '/movies/new'
    fill_in 'movie_name', :with => "Percy Jackson"
    fill_in 'movie_photo', :with => "https://m.media-amazon.com/images/M/MV5BMTQ5NDlmZWUtMjIyMC00NzQ3LTg3OWYtMzRkY2FiNzQ0Njc4XkEyXkFqcGdeQXVyNDQ2MTMzODA@._V1_.jpg"
    fill_in 'movie_initialDate', :with => "01-01-2024"
    fill_in 'movie_finalDate', :with => "01-01-2022"
    click_button "commit"
    expect(page).to have_content("Initialdate must be before Final Date.")
    expect(page).to have_content("Finaldate must be after Initial Date.")
  end
end

RSpec.describe 'New Movie with InitialDate Today', type: :feature do
  it 'success' do
    visit '/movies/new'
    fill_in 'movie_name', :with => "Percy Jackson"
    fill_in 'movie_photo', :with => "https://m.media-amazon.com/images/M/MV5BMTQ5NDlmZWUtMjIyMC00NzQ3LTg3OWYtMzRkY2FiNzQ0Njc4XkEyXkFqcGdeQXVyNDQ2MTMzODA@._V1_.jpg"
    fill_in 'movie_initialDate', :with => Date.today
    fill_in 'movie_finalDate', :with => "01-01-2022"
    click_button "commit"
    expect(page).to have_content("Initialdate must be after today.")
  end
end

RSpec.describe 'New Movie with FinalDate Today', type: :feature do
  it 'success' do
    visit '/movies/new'
    fill_in 'movie_name', :with => "Percy Jackson"
    fill_in 'movie_photo', :with => "https://m.media-amazon.com/images/M/MV5BMTQ5NDlmZWUtMjIyMC00NzQ3LTg3OWYtMzRkY2FiNzQ0Njc4XkEyXkFqcGdeQXVyNDQ2MTMzODA@._V1_.jpg"
    fill_in 'movie_initialDate', :with => "01-01-2022"
    fill_in 'movie_finalDate', :with => Date.today
    click_button "commit"
    expect(page).to have_content("Finaldate must be after today.")
  end
end

RSpec.describe 'New Movie with InitialDate and FinalDate Today', type: :feature do
  it 'success' do
    visit '/movies/new'
    fill_in 'movie_name', :with => "Percy Jackson"
    fill_in 'movie_photo', :with => "https://m.media-amazon.com/images/M/MV5BMTQ5NDlmZWUtMjIyMC00NzQ3LTg3OWYtMzRkY2FiNzQ0Njc4XkEyXkFqcGdeQXVyNDQ2MTMzODA@._V1_.jpg"
    fill_in 'movie_initialDate', :with => Date.today
    fill_in 'movie_finalDate', :with => Date.today
    click_button "commit"
    expect(page).to have_content("Initialdate must be after today.")
    expect(page).to have_content("Finaldate must be after today.")
  end
end

RSpec.describe 'Blank name for new movie', type: :feature do
  it 'success' do
    visit '/movies/new'
    fill_in 'movie_name', :with => ""
    fill_in 'movie_photo', :with => "https://m.media-amazon.com/images/M/MV5BMTQ5NDlmZWUtMjIyMC00NzQ3LTg3OWYtMzRkY2FiNzQ0Njc4XkEyXkFqcGdeQXVyNDQ2MTMzODA@._V1_.jpg"
    fill_in 'movie_initialDate', :with => "01-01-2022"
    fill_in 'movie_finalDate', :with => "01-01-2024"
    click_button "commit"
    expect(page).to have_content("Name can't be blank")
  end
end

RSpec.describe 'Blank photo for new movie', type: :feature do
  it 'success' do
    visit '/movies/new'
    fill_in 'movie_name', :with => "Percy Jackson"
    fill_in 'movie_photo', :with => ""
    fill_in 'movie_initialDate', :with => "01-01-2022"
    fill_in 'movie_finalDate', :with => "01-01-2024"
    click_button "commit"
    expect(page).to have_content("Photo can't be blank")
  end
end

RSpec.describe 'Blank Initial Date for new movie', type: :feature do
  it 'success' do
    visit '/movies/new'
    fill_in 'movie_name', :with => "Percy Jackson"
    fill_in 'movie_photo', :with => "https://m.media-amazon.com/images/M/MV5BMTQ5NDlmZWUtMjIyMC00NzQ3LTg3OWYtMzRkY2FiNzQ0Njc4XkEyXkFqcGdeQXVyNDQ2MTMzODA@._V1_.jpg"
    fill_in 'movie_initialDate', :with => ""
    fill_in 'movie_finalDate', :with => "01-01-2024"
    click_button "commit"
    expect(page).to have_content("Initialdate can't be blank")
  end
end

RSpec.describe 'Blank Initial Date for new movie', type: :feature do
  it 'success' do
    visit '/movies/new'
    fill_in 'movie_name', :with => "Percy Jackson"
    fill_in 'movie_photo', :with => "https://m.media-amazon.com/images/M/MV5BMTQ5NDlmZWUtMjIyMC00NzQ3LTg3OWYtMzRkY2FiNzQ0Njc4XkEyXkFqcGdeQXVyNDQ2MTMzODA@._V1_.jpg"
    fill_in 'movie_initialDate', :with => "01-01-2022"
    fill_in 'movie_finalDate', :with => ""
    click_button "commit"
    expect(page).to have_content("Finaldate can't be blank")
  end
end

RSpec.describe 'Sucessfully create movie', type: :feature do
  it 'success' do
    visit '/movies/new'
    fill_in 'movie_name', :with => "Percy Jackson"
    fill_in 'movie_photo', :with => "https://m.media-amazon.com/images/M/MV5BMTQ5NDlmZWUtMjIyMC00NzQ3LTg3OWYtMzRkY2FiNzQ0Njc4XkEyXkFqcGdeQXVyNDQ2MTMzODA@._V1_.jpg"
    fill_in 'movie_initialDate', :with => "01-01-2022"
    fill_in 'movie_finalDate', :with => "01-01-2024"
    click_button "commit"
    expect(page).to have_content("Movie was successfully created.")
  end
end