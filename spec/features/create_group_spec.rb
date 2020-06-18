require 'rails_helper'

RSpec.describe 'Creating a Group', type: :feature do
  scenario 'valid inputs' do
    visit new_user_path
    find('#name', visible: false).set 'tresor'
    click_on 'Signup'
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
    visit new_user_path
    find('#name', visible: false).set 'tresor'
    click_on 'Signup'
    visit new_group_path
    click_on 'Create'
    expect(page).to have_content('please fill in all the informations')
  end
end
