require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'must be created with password and password_confirmation fields' do
     @user = User.new(first_name: "Jessica", last_name: "Surname", email: "jess@hotmail.com", password: nil, password_confirmation: nil)
     expect(@user).to_not be_valid
     @user = User.new(first_name: "Jessica", last_name: "Surname", email: "jess@hotmail.com", password: "cheese", password_confirmation: "cheesee")
     expect(@user).to_not be_valid
    end
    it 'must have a unique email' do
      @user1 = User.new(first_name: "Jessica", last_name: "Surname", email: "jess@hotmail.com", password: "cheese", password_confirmation: "cheese")
      @user1.save
      @user2 = User.new(first_name: "Darrell", last_name: "Surname", email: "jeSS@hotmail.com", password: "smoothie", password_confirmation: "smoothie")
      expect(@user2).to_not be_valid
    end
    it 'must have an email, first name, and last name' do
      @user1 = User.new(first_name: nil, last_name: "Surname", email: "jess@hotmail.com", password: "cheese", password_confirmation: "cheese")
      expect(@user1).to_not be_valid
      @user2 = User.new(first_name: "Jessica", last_name: nil, email: "jess@hotmail.com", password: "cheese", password_confirmation: "cheese")
      expect(@user2).to_not be_valid
      @user3 = User.new(first_name: "Jessica", last_name: "Surname", email: nil, password: "cheese", password_confirmation: "cheese")
      expect(@user3).to_not be_valid
    end
    it 'must have a password with minimum length of 6' do
      @user = User.new(first_name: "Jessica", last_name: "Surname", email: "jess@hotmail.com", password: "abc", password_confirmation: "abc")
      expect(@user).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    it 'should authenticate a user with email and password' do
      user = User.new(first_name: "Jessica", last_name: "Surname", email: "JEss@hotmail.com", password: "cheese", password_confirmation: "cheese")
      user.save
      expect(User.authenticate_with_credentials("jess@hotmail.com", "cheese")).to eq user
      expect(User.authenticate_with_credentials(" jess@hotmail.com ", "cheese")).to eq user
      expect(User.authenticate_with_credentials(" jeSS@hotmail.Com ", "cheese")).to eq user
      expect(User.authenticate_with_credentials("JESS@hotmail.COM", "cheese")).to eq user
    end
  end

end
