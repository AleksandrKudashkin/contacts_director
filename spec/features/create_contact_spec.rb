require_relative 'feature_helper'

feature 'Create contact', %q(
  In order to manage my list of contacts
  As an Authenticated user
  I want to be able to create a Contact
) do

  given!(:user) { create(:user) }
  given!(:category) { create(:category, user: user) }

  scenario 'Authenticated user creates a contact', js: true do
    sign_in(user)

    visit contacts_path
    click_on 'Add a contact'

    select category.name, from: "contact[category_id]"
    fill_in 'contact[first_name]', with: 'MyFirstName'
    fill_in 'contact[last_name]', with: 'MyLastName'
    fill_in 'contact[phone]', with: '123456'
    fill_in 'contact[email]', with: "test@test.com"
    inputs = all('input[type="file"]')
    inputs[0].set("#{Rails.root}/spec/support/test_icon.png")
    click_on 'Create Contact'

    expect(page).to have_content 'Contact was successfully created'
    expect(page).to have_content 'MyLastName'
    expect(page).to have_content '123456'
    expect(page).to have_content "test@test.com"
    expect(page).to have_content category.name
    expect(page).to have_css("img[src*='/uploads/contact/file/1/test_icon.png']")
  end

  scenario 'Authenticated user tries to create invalid contact' do
    sign_in(user)

    visit contacts_path
    click_on 'Add a contact'

    click_on 'Create Contact'

    expect(page).to have_content "First name can't be blank"
  end

  scenario 'Non-authenticated user tries to create a contact' do
    visit contacts_path

    expect(page).to_not have_content 'Contacts'
  end
end
