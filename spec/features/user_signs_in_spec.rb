require "rails_helper"

feature "user signs in" do
  scenario "with valid email and password" do
    ram = Fabricate(:user)
    sign_in(ram)
    expect(page).to have_content ram.name
  end
end
