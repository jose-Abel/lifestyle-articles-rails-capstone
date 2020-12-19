require 'rails_helper'

RSpec.describe 'Registration of a new user', type: :system do
  it 'Register a new' do
    visit '/users/new'
    sleep(5)

    expect(page).to have_content 'Welcome to the Registration Page of LifeStyle Articles app'

    element = find(:css, "input[id$='user_name']")
    element.fill_in with: 'jose'

    click_button 'Create new user'
    sleep(5)

    expect(page).to have_content 'Welcome Jose to the LifeStyle Articles app'
  end
end
