require 'rails_helper'

describe "the add a chapter process" do
  it "adds a new chapter" do
    visit chapters_path
    click_on 'Create New Chapter'
    fill_in 'Name', :with => 'Capybara'
    click_on 'Create Chapter'
    expect(page).to have_content 'Chapters'
  end

  it "gives error when no name is entered" do
    visit new_chapter_path
    fill_in 'Name', :with => ''
    click_on 'Create'
    expect(page).to have_content 'errors'
  end
end
