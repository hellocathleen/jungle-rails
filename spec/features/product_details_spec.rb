require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do
  
  before :each do
   @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see product details when clicking on a product" do
    # ACT
    visit root_path
    expect(page).to have_css 'article.product', count: 10
    #puts page.html
    first('article.product').find_link('Details').click
    sleep 3
    # DEBUG / VERIFY
    
    save_screenshot
    
  end

end