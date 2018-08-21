require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    @user = User.create!(
      first_name: 'Joe',
      last_name: 'Shmoe',
      email: 'joe@gmail.com',
      password: 'abc123',
      password_confirmation: 'abc123'
    )
  end
  scenario "A user can log in" do
    visit '/sessions/new'

    within 'form' do
      fill_in id: 'email', with: @user.email
      fill_in id: 'password', with: @user.password
      click_button 'Submit'
    end
    expect(page).to have_content 'Logout'
    save_screenshot
  end
end
