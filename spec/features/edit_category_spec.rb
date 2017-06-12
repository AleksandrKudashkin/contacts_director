require_relative 'feature_helper'

feature 'Category editing', %q(
  In order to fix mistakes
  As an author of Category
  I want to be able to edit the name of the Category
) do
  given(:user) { create(:user) }
  given(:category) { create(:category, user: user) }

  scenario 'Non-authenticated user tries to edit an answer' do
    visit category_path(category)

    expect(page).to_not have_link 'Edit'
  end

  describe 'Authenticated user' do
    before do
      sign_in(user)
      visit category_path(category)
    end

    scenario 'sees edit links only to his answers' do
      expect(page).to have_link 'Edit'
    end

    scenario 'tries to edit his answer', js: true do
      click_on 'Edit'
      fill_in 'category_name', with: "New name"
      click_on 'Update Category'

      expect(page).to have_content 'New name'
      expect(page).to_not have_content category.name
      expect(page).to_not have_selector 'text_field'
    end
  end
end
