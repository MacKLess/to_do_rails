require 'rails_helper'

describe "the add a task process" do
  it "adds a new task" do
    list = List.create(:name => 'Home stuff')
    visit list_path(list)
    click_link "Add a task"
    # task = Task.create(:description => 'Laundry')
    fill_in 'Description', :with => 'Laundry'
    click_on 'Create Task'
    visit list_path(list)
    expect(page).to have_content 'Laundry'
  end

  it "gives error when no description is entered" do
    list = List.create(:name => 'Home stuff')
    visit list_path(list)
    click_link "Add a task"
    # task = Task.create(:description => 'Laundry')
    fill_in 'Description', :with => ''
    click_on 'Create Task'
    expect(page).to have_content 'error'
  end
end

describe "the edit a task process" do
  it "edits a task" do
    list = List.create(:name => 'Home stuff')
    task = Task.create(:description => 'Wash the dishes', :list_id => list.id)
    visit list_path(list)
    click_on 'Edit'
    fill_in 'Description', :with => 'Wash the dog'
    click_on 'Update Task'
    visit list_path(list)
    expect(page).to have_content 'Wash the dog'
  end

  it "gives error when no description is entered" do
    list = List.create(:name => 'Home stuff')
    task = Task.create(:description => 'Wash the dishes', :list_id => list.id)
    visit list_path(list)
    click_on 'Edit'
    fill_in 'Description', :with => ''
    click_button 'Update Task'
    expect(page).to have_content 'errors'
  end
end
