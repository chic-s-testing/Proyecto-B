require 'rails_helper'
require 'database_cleaner/active_record'


RSpec.describe 'The booking seat at function process of movie id 1', type: :feature do
  fixtures :movies, :functions, :reservations
  
  before :all do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  it 'reserves matine 29 nov seats A4 A5 A6, success' do
    visit '/movies/1/functions/1'
    click_link "2021-11-29"
    expect(page).to have_xpath("/html/body/div[1]/div[2]/form/div[1]/div[2]/text()", :text => "A1 A2 A3")
    find(:xpath, '/html/body/div[1]/div[2]/form/div[1]/div[1]/div[1]/input[4]').click
    find(:xpath, '/html/body/div[1]/div[2]/form/div[1]/div[1]/div[1]/input[5]').click
    find(:xpath, '/html/body/div[1]/div[2]/form/div[1]/div[1]/div[1]/input[6]').click
    click_button "Reservar asientos"
    click_link "2021-11-29"
    expect(page).to have_xpath("/html/body/div[1]/div[2]/form/div[1]/div[2]/text()", :text => "A1 A2 A3 A4 A5 A6")
  end
  it 'reserves tanda 01 dic seats B5 B6 B7, success' do
    visit '/movies/1/functions/2'
    click_link "2021-12-01"
    expect(page).to have_xpath("/html/body/div[1]/div[2]/form/div[1]/div[2]/text()", :text => "B2 B3 B4")
    find(:xpath, '/html/body/div[1]/div[2]/form/div[1]/div[1]/div[1]/input[17]').click
    find(:xpath, '/html/body/div[1]/div[2]/form/div[1]/div[1]/div[1]/input[18]').click
    find(:xpath, '/html/body/div[1]/div[2]/form/div[1]/div[1]/div[1]/input[19]').click
    click_button "Reservar asientos"
    click_link "2021-12-01"
    expect(page).to have_xpath("/html/body/div[1]/div[2]/form/div[1]/div[2]/text()", :text => "B2 B3 B4 B5 B6 B7")
  end
  it 'reserves noche 05 dic seats D10 D11 D12, fails (seats already taken)' do
    visit '/movies/1/functions/3'
    click_link "2021-12-05"
    expect(page).to have_xpath("/html/body/div[1]/div[2]/form/div[1]/div[2]/text()", :text => "D10 D11 D12")
    find(:xpath, '/html/body/div[1]/div[2]/form/div[1]/div[1]/div[1]/input[46]').click
    find(:xpath, '/html/body/div[1]/div[2]/form/div[1]/div[1]/div[1]/input[47]').click
    find(:xpath, '/html/body/div[1]/div[2]/form/div[1]/div[1]/div[1]/input[48]').click
    click_button "Reservar asientos"
    expect(page).to have_content("Uno o más asientos ya están reservados")
  end
  it 'reserves noche 05 dic seats A1 B2 C3, fails (seats in different rows)' do
    visit '/movies/1/functions/3'
    click_link "2021-12-05"
    expect(page).to have_xpath("/html/body/div[1]/div[2]/form/div[1]/div[2]/text()", :text => "D10 D11 D12")
    find(:xpath, '/html/body/div[1]/div[2]/form/div[1]/div[1]/div[1]/input[1]').click
    find(:xpath, '/html/body/div[1]/div[2]/form/div[1]/div[1]/div[1]/input[14]').click
    find(:xpath, '/html/body/div[1]/div[2]/form/div[1]/div[1]/div[1]/input[27]').click
    click_button "Reservar asientos"
    expect(page).to have_content("Los asientos son de diferentes filas")
  end
  it 'reserves noche 05 dic with no seats, fails (no seats were selected)' do
    visit '/movies/1/functions/3'
    click_link "2021-12-05"
    expect(page).to have_xpath("/html/body/div[1]/div[2]/form/div[1]/div[2]/text()", :text => "D10 D11 D12")
    click_button "Reservar asientos"
    expect(page).to have_content("No seleccionaste ni un asiento")
  end

  after :all do
    DatabaseCleaner.clean
  end
end