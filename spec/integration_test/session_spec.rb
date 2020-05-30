require_relative '../rails_helper.rb'

RSpec.describe 'Sessions', type: :feature do
  scenario 'create a new user using the signup page' do
    visit new_user_registration_path
    fill_in 'user[name]', with: 'Ana Rivas'
    fill_in 'user[email]', with: 'anarivas@email.com'
    fill_in 'user[password]', with: 'ana123456'
    fill_in 'user[password_confirmation]', with: 'ana123456'
    click_button 'Sign up'
    expect(page).to have_content('Recent posts')
  end

  scenario 'when a user login' do
    User.create(name: 'Ana Rivas', email: 'anarivas@email.com', password: 'ana1234', password_confirmation: 'ana1234')

    visit root_path
    fill_in 'user[email]', with: 'anarivas@email.com'
    fill_in 'user[password]', with: 'ana1234'
    click_button 'Log in'
    expect(page).to have_content('Recent posts')
  end

  scenario 'when a user log out' do
    User.create(name: 'Ana Rivas', email: 'anarivas@email.com', password: 'ana1234', password_confirmation: 'ana1234')

    visit root_path
    fill_in 'user[email]', with: 'anarivas@email.com'
    fill_in 'user[password]', with: 'ana1234'
    click_button 'Log in'
    click_link 'Sign out'
    expect(page).to have_content('Sign in')
  end
end
