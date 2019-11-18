require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  # SETUP
  before :each do
    user = User.create!(name: 'a', email: 'a@a.com', password: 'abcdef', password_confirmation: 'abcdef')
  end
  
  scenario "They are logged in and taken to the home page" do
    # ACT
    visit root_path
    click_on 'Login'
    fill_in 'email', with: 'a@a.com'
    fill_in 'password', with: 'abcdef'
    click_on 'Submit'
    
    # DEBUG
    save_screenshot

    # VERIFY
    within('nav ul.navbar-right') { expect(page).to have_content 'Signed in as a' }
  end
end
