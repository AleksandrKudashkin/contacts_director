require_relative 'feature_helper'

feature 'User signs up', '
  In order to be able to manage my Contacts
  As an User
  I want to be able to sign up to site
' do
  background do
    visit new_user_registration_path
    fill_in 'Email', with: 'iam@theuser.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Sign up'
  end

  scenario 'New user sees the confirmation' do
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
