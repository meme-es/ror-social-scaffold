require_relative '../rails_helper.rb'

RSpec.describe 'Friendship', type: :feature do
  before :each do
    User.create(name: 'Ana Rivas', email: 'anarivas@email.com', password: 'ana1234', password_confirmation: 'ana1234')
    @user = User.create(name: 'Carlos P', email: 'carlp@email.com', password: 'carl12', password_confirmation: 'carl12')

    visit 'users/sign_in'
    fill_in 'user[email]', with: 'anarivas@email.com'
    fill_in 'user[password]', with: 'ana1234'
    click_button 'Log in'
  end

  context 'send a friendship invitation' do
    scenario 'from the users list' do
      click_link 'All users'
      click_link 'Invite to friendship'
      expect(page).to have_content('Friend request sent')
    end

    scenario 'from the show list' do
      click_link 'All users'
      click_link('See Profile', href: "/users/#{@user.id}")
      click_link 'Invite to friendship'
      expect(page).to have_content('Friend request sent')
    end
  end

  context 'accept friendship invitation' do
    scenario 'from the users list' do
      click_link 'All users'
      click_link('See Profile', href: "/users/#{@user.id}")
      click_link 'Invite to friendship'
      click_link 'Sign out'

      visit 'users/sign_in'
      fill_in 'user[email]', with: 'carlp@email.com'
      fill_in 'user[password]', with: 'carl12'
      click_button 'Log in'

      click_link 'All users'
      click_link 'Accept Invitation'
      expect(page).to have_content('Friend request accepted')
    end
  end

  context 'reject friendship invitation' do
    scenario 'from the users list' do
      click_link 'All users'
      click_link('See Profile', href: "/users/#{@user.id}")
      click_link 'Invite to friendship'
      click_link 'Sign out'

      visit 'users/sign_in'
      fill_in 'user[email]', with: 'carlp@email.com'
      fill_in 'user[password]', with: 'carl12'
      click_button 'Log in'

      click_link 'All users'
      click_link 'Reject Invitation'
      expect(page).to have_content('Friend request rejected')
    end
  end

  scenario 'See posts from the user and his/her friends in the Timeline' do
    fill_in 'post[content]', with: 'Hello everybody, this is my first post, hope you enjoy it.'
    click_button 'Save'
    click_link 'All users'
    click_link('See Profile', href: "/users/#{@user.id}")
    click_link 'Invite to friendship'
    click_link 'Sign out'

    visit 'users/sign_in'
    fill_in 'user[email]', with: 'carlp@email.com'
    fill_in 'user[password]', with: 'carl12'
    click_button 'Log in'

    click_link 'All users'
    click_link 'Accept Invitation'
    click_link 'Stay in touch'
    fill_in 'post[content]', with: 'Hello everybody, this is my first post, hope you enjoy it.'
    click_button 'Save'
    expect(page).to have_content('Recent posts')
  end
end
