require 'rails_helper'

RSpec.describe "User create posts" do
	scenario "Successful" do
		visit root_path
		click_on "Write a Story"

		fill_in "Title", with: "My First Story"
		fill_in "Body", with: "My Description of the Story"
		click_on "Publish"
		expect(page).to have_content "My First Story"
	end

	scenario "Unsuccessful"
end