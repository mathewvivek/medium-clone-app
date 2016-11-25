require 'rails_helper'

RSpec.describe "User Sign up Page" do

	before(:each) do
    @user = FactoryGirl.build(:user)
	end

	feature "Successful" do
		scenario "exact login details" do
			visit new_user_registration_path
			fill_in "Email", with: @user.email
			fill_in "Password", with: @user.password
			fill_in "Password confirmation", with: @user.password
			click_on "Sign up"
			expect(page).to have_content "Welcome! You have signed up successfully"
		end
	end

	feature "Unsuccessful" do

		scenario "Wrong Email" do
			visit new_user_registration_path
			fill_in "Email", with: "mathew"
			fill_in "Password", with: @user.password
			fill_in "Password confirmation", with: @user.password
			click_on "Sign up"
			expect(page).to have_content "Email is invalid"
		end

		scenario "Blank Password" do
			visit new_user_registration_path
			fill_in "Email", with: @user.email
			fill_in "Password", with: ""
			fill_in "Password confirmation", with: ""
			click_on "Sign up"
			expect(page).to have_content "Password can't be blank"
		end
	end

end