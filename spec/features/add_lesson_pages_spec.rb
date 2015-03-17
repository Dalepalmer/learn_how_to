require 'rails_helper'

describe "the add a lesson process" do
  it "adds a new lesson" do
    visit chapters_path
    click_on 'Create New Chapter'
    fill_in 'Name', :with => 'Capybara'
    click_on 'Create Chapter'
    click_on 'Capybara'
    click_on 'Add a lesson'
    fill_in 'Name', :with => 'Capybara'
    fill_in 'Content', :with => 'Test stuff!'
    fill_in 'Number', :with => 10
    click_on 'Create Lesson'
    expect(page).to have_content 'successfully'
  end

  it "gives error when no name is entered" do
    visit chapters_path
    click_on 'Create New Chapter'
    fill_in 'Name', :with => 'Capybara'
    click_on 'Create Chapter'
    click_on 'Capybara'
    click_on 'Add a lesson'
    fill_in 'Name', :with => ''
    fill_in 'Content', :with => ''
    fill_in 'Number', :with => ''
    click_on 'Create Lesson'
    expect(page).to have_content 'errors'
  end
end
