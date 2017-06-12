require_relative 'feature_helper'

feature 'Delete Category', %q(
    In order to remove incorrect Category
    As an Authenticated user
    I want to be able to delete the Category
  ) do

  given(:user) { create(:user) }
  given!(:category) { create(:category, user: user) }

  scenario 'Authenticated user deletes his category' do
    sign_in(user)
    visit category_path(category)
    click_on 'Destroy'

    expect(page).to have_content 'Category was successfully destroyed'
    expect(page).to_not have_content category.name
  end

  scenario 'Non-authenticated user tries to delete a category' do
    visit category_path(category)
    expect(page).to_not have_content 'Destroy'
  end
end
