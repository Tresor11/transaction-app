require 'rails_helper'

RSpec.describe 'Creating a transaction', type: :feature do
  scenario 'valid inputs' do
    sign_in(create(:user))
    expect(page).to have_content('My Transactions')
    click_on 'My Transactions'
    expect(page).to have_content('Total Amount')
    click_on 'New Transaction'
    fill_in 'Name', with: 'test_transaction'
    fill_in 'Amount', with: '100'
    click_on 'Submit'
    expect(page).to have_content('transaction saved')
    visit external_path
    expect(page).to have_content('test_transaction')
  end

  scenario 'invalid inputs' do
    sign_in(create(:user))
    expect(page).to have_content('My Transactions')
    click_on 'My Transactions'
    expect(page).to have_content('Total Amount')
    click_on 'New Transaction'
    fill_in 'Name', with: 'test_transaction'
    click_on 'Submit'
    expect(page).to have_content('please fill in all required fields')
  end
end
