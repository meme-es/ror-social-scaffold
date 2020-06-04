require_relative '../rails_helper.rb'

RSpec.describe 'Post', type: :feature do
  before :each do
    User.create(name: 'Ana Rivas', email: 'anarivas@email.com', password: 'ana1234', password_confirmation: 'ana1234')

    visit 'users/sign_in'
    fill_in 'user[email]', with: 'anarivas@email.com'
    fill_in 'user[password]', with: 'ana1234'
    click_button 'Log in'
  end

  scenario 'like a post' do
    fill_in 'post[content]', with: 'Hello everybody, this is my first post, hope you enjoy it.'
    click_button 'Save'
    click_link 'Like!'
    expect(page).to have_content('Recent posts')
  end
end
