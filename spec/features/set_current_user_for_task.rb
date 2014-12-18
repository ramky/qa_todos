require "rails_helper"

feature "Set current user for tasks" do
  ram = Fabricate(:user)
  sign_in(ram)

  visit new_task_path
  fill_in "Title", with: 'a new task'
  fill_in "Description", with: 'this is really a new task'
  click_button "Create Task"
  expect(page).to have_content ram.name
end
