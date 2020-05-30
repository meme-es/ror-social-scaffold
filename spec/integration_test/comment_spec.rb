require_relative '../rails_helper.rb'

RSpec.describe 'Comment', type: :feature do
  before :each do
    User.create(name: 'Ana Rivas', email: 'anarivas@email.com', password: 'ana1234', password_confirmation: 'ana1234')

    visit 'users/sign_in'
    fill_in 'user[email]', with: 'anarivas@email.com'
    fill_in 'user[password]', with: 'ana1234'
    click_button 'Log in'
  end

  scenario 'create a comment for a post' do
    fill_in 'post[content]', with: 'Hello everybody, this is my first post, hope you enjoy it.'
    click_button 'Save'
    fill_in 'comment[content]', with: 'Nice post Ana!'
    click_button 'Comment'
    expect(page).to have_content('Recent posts')
  end
end