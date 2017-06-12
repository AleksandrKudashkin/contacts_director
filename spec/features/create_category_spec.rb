require_relative 'feature_helper'

feature 'Create category', %q(
  In order to be able to classify contacts
  As an authenticated user
  I want to be able to create a category
) do

  given!(:user) { create(:user) }
  given(:category) { create(:category, user: user) }

  scenario 'Authenticated user creates a category' do
    sign_in(user)

    visit contacts_path
    click_on 'Add a category'
    fill_in 'category_name', with: category.name
    click_on 'Create Category'

    expect(page).to have_content 'Category was successfully created'
    expect(page).to have_content category.name
  end

  scenario 'Authenticated user tries to create an invalid category' do
    sign_in(user)
    visit contacts_path
    click_on 'Add a category'
    click_on 'Create Category'

    expect(page).to have_content "Name can't be blank"
  end

  scenario 'Non-authenticated user tries to create a category' do
    visit contacts_path

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end