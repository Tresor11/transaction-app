require 'rails_helper'

RSpec.describe 'Creating a transaction', type: :feature do
  scenario 'valid inputs' do
    visit new_user_path
    find('#name', visible: false).set 'tresor'
    click_on 'Signup'
    expect(page).to have_content('tresor')
    click_on 'my transactions'
    expect(page).to have_content('Total Amount')
    click_on 'NEW TRANSACTION'
    find('#name', visible: false).set 'testing'
    find('#amount', visible: false).set 100
    click_on 'Registe'
    expect(page).to have_content('transaction saved')
  end

  scenario 'invalid inputs' do
    visit new_user_path
    find('#name', visible: false).set 'tresor'
    click_on 'Signup'
    visit new_transaction_path
    click_on 'Registe'
    expect(page).to have_content('please fill in all the informations')
  end
end
