require 'rails_helper'

RSpec.describe 'visiting the home page', type: :feature do
  scenario 'visiting the home page' do
    visit root_path
    expect(page).to have_content('Welcome')
    expect(page).to have_content('Sign Up')
    expect(page).to have_content('Login')
  end
end
