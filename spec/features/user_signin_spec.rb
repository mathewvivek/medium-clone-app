require 'rails_helper'

RSpec.describe "User Login" do

	before(:each) do
		@user = FactoryGirl.build(:user)
	end

	feature "Successful" do
		scenario "Successful" do
			visit new_user_session_path
			fill_in "Email", with: @user.email
			fill_in "Password", with: @user.password
			click_on "Log in"
			expect(page).to have_content "Signed in successfully"
		end
  end

  feature "Unsuccessful" do
		scenario "Wrong Email" do
			visit new_user_session_path
			fill_in "Email", with: "a@b.com"
			fill_in "Password", with: @user.password
			click_on "Log in"
			expect(page).to have_content "Invalid email or password"
		end

		scenario "Wrong Password" do
			visit new_user_session_path
			fill_in "Email", with: @user.email
			fill_in "Password", with: 'blahblah'
			click_on "Log in"
			expect(page).to have_content "Invalid email or password"
		end
	end

end