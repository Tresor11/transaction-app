require 'rails_helper'

RSpec.describe 'Creating a user', type: :feature do
  scenario 'valid inputs' do
    visit new_user_path
    find('#name', visible: false).set 'tresor'
    click_on 'Signup'
    expect(page).to have_content('tresor')
  end

  scenario 'inalid input' do
    visit new_user_path
    find('#name', visible: false).set nil
    click_on 'Signup'
    expect(page).to have_content('Invalid User name')
  end
end
