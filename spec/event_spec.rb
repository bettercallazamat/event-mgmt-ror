require_relative './rails_helper.rb'

RSpec.describe 'Event', type: :feature do
  before(:all) do
    visit new_user_path
    fill_in 'user_username', with: 'johnsmith2'
    fill_in 'user_password', with: 'passwordexample'
    find("input[type='submit']").click
  end

  it 'it should create a new event' do
    visit new_event_path
    fill_in 'event_title', with: 'The Great Event'
    fill_in 'event_event_date', with: '2020-06-02'
    fill_in 'event_description', with: 'Description Example'
    find("input[type='submit']").click
    expect(page).to have_content('Event successfully created')
  end
end
