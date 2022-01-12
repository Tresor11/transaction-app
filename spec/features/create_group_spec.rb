require 'rails_helper'

RSpec.describe 'Creating a Group', type: :feature do
  scenario 'valid inputs' do
    sign_in(create(:user))
    expect(page).to have_content('Groups')
    click_on 'Groups'
    click_on 'New Group'
    fill_in 'Name', with: 'test_group'
    find('#icon', visible: false).set Rails.root.join('spec/support/kid.jpg')
    click_on 'Create'
    expect(page).to have_content('test_group')
  end

  scenario 'invalid inputs' do
    sign_in(create(:user))
    expect(page).to have_content('Groups')
    click_on 'Groups'
    click_on 'New Group'
    click_on 'Create'
    expect(page).to have_content("please fill in all the required fields")
  end
end
