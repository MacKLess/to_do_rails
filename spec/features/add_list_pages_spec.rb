require 'rails_helper'

describe "the add a list process" do
  it "adds a new list" do
    visit lists_path
    click_link 'New List'
    fill_in 'Name', :with => 'Home stuff'
    click_on 'Create List'
    expect(page).to have_content 'Lists'
  end

  it "gives error when no name is entered" do
    visit new_list_path
    click_on 'Create List'
    expect(page).to have_content 'errors'
  end

  describe "the edit a list process" do
    it "edits a list" do
      list = List.create(:name => 'Home stuff')
      visit lists_path
      click_link 'Home stuff'
      click_link 'Edit List'
      fill_in 'Name', :with => 'Homework stuff'
      click_on 'Update List'
      visit list_path(list)
      expect(page).to have_content 'Homework stuff'
    end
  end

end
