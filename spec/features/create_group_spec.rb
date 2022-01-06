require 'rails_helper'

RSpec.describe 'Creating a Group', type: :feature do
  scenario 'valid inputs' do
    visit new_user_registration_path
    # find('#user_name', visible: false).set 'tresor'
    # find('#user_email', visible: false).set 't@gmail.com'
    # find('#user_password', visible: false).set '123456'
    # find('#user_password_confirmation', visible: false).set '123456'
    fill_in 'Name', with: 'tresor'
    fill_in 'Email', with: 't@gmail.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'
    expect(page).to have_content('tresor')
    click_on 'groups'
    expect(page).to have_content('GROUPS')
    click_on 'NEW GROUP'
    find('#name', visible: false).set 'new group'
    find('#icon', visible: false).set Rails.root.join('spec/support/kid.jpg')
    click_on 'Create'
    expect(page).to have_content('new group')
  end

  scenario 'invalid inputs' do
    visit new_user_registration_path
    fill_in 'Name', with: 'tresor'
    fill_in 'Email', with: 't@gmail.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'
    visit new_group_path
    click_on 'Create'
    expect(page).to have_content('please fill in all the informations')
  end
end
