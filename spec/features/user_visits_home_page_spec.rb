require 'rails_helper'

RSpec.feature "User Visits Homepage" do
	scenario "successfully sees the home page" do
		visit root_path
		expect(page).to have_content "My Medium App"
	end
end