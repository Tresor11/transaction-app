require 'rails_helper'

RSpec.describe 'Creating a user', type: :feature do
  scenario 'valid inputs' do
    visit root_path
    click_on 'Sign Up'
    fill_in 'Email', with: 'test@test'
    fill_in 'Name', with: 'test'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content('test@test')
  end

  scenario 'invalid input' do
    visit root_path
    click_on 'Sign Up'
    fill_in 'Email', with: ''
    fill_in 'Name', with: 'test'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password1'
    click_on 'Sign up'
    expect(page).to have_content('Email can\'t be blank')
    expect(page).to have_content('Password confirmation doesn\'t match Password')
  end
end
