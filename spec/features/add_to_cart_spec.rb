require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
      
    end
    
    scenario "They see the number of items in the cart has changed" do
      # ACT
      visit root_path
      find('form.button_to', match: :first).click
  
      # DEBUG
      save_screenshot
  
      # VERIFY
      within('nav ul.navbar-right') { expect(page).to have_content ' My Cart (1)' }
    end
end
