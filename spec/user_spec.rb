require_relative './rails_helper.rb'

RSpec.describe 'User',:type => :feature do
  it 'It should create a new user' do
    visit new_user_path
    fill_in 'user_username', with: 'johnsmith'
    fill_in 'user_password', with: 'passwordexample'
    find("input[type='submit']").click
    expect(page).to have_content('User successfully created')
  end

  it 'It should NOT create a new user with existing username in db' do
    visit new_user_path
    fill_in 'user_username', with: 'johnsmith'
    fill_in 'user_password', with: 'passwordexample'
    find("input[type='submit']").click
    visit new_user_path
    fill_in 'user_username', with: 'johnsmith'
    fill_in 'user_password', with: 'passwordexample'
    find("input[type='submit']").click
    expect(page).to have_content('Something went wrong')
  end

  it 'It should auto log in with the last created user' do
    visit new_user_path
    fill_in 'user_username', with: 'johnsmith'
    fill_in 'user_password', with: 'passwordexample'
    find("input[type='submit']").click
    expect(page).to have_css(".right-side", text: "Create event johnsmith Logout")
  end
end