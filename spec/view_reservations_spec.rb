require 'rails_helper'
require 'database_cleaner/active_record'


RSpec.describe 'The booking seat at function process of movie id 1', type: :feature do
  fixtures :movies, :functions, :reservations

  before :all do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  it 'view matine 29 nov function, reserved seats A1 A2 A3' do
    visit '/movies/1/functions/1'
    expect(page).to have_content("Horario: matine")
    click_link "2022-11-29"
    expect(page).to have_xpath("/html/body/div[1]/div[2]/form/div[1]/div[2]/text()", :text => "A1 A2 A3")
  end
  it 'view tanda 01 dic function, reserved seats B2 B3 B4' do
    visit '/movies/1/functions/2'
    expect(page).to have_content("Horario: tanda")
    click_link "2022-12-01"
    expect(page).to have_xpath("/html/body/div[1]/div[2]/form/div[1]/div[2]/text()", :text => "B2 B3 B4")
  end
  it 'view noche 05 dic function, reserved seats D10 D11 D12' do
    visit '/movies/1/functions/3'
    expect(page).to have_content("Horario: noche")
    click_link "2022-12-05"
    expect(page).to have_xpath("/html/body/div[1]/div[2]/form/div[1]/div[2]/text()", :text => "D10 D11 D12")
  end

  after :all do
    DatabaseCleaner.clean
  end
end