require 'rails_helper'

RSpec.describe 'Login an existing user', type: :system do
  before :each do
    User.create(name: 'joseph')
  end

  it 'Log me in' do
    visit '/login'

    sleep(2)

    expect(page).to have_content 'Welcome to the Login Page of LifeStyle Articles App'

    name = find(:css, "input[id$='session_name']")
    name.fill_in with: 'joseph'

    sleep(2)

    find('input[name="commit"]').click

    sleep(2)

    expect(page).to have_content 'Logged in successfully Joseph'
    sleep(2)
  end
end
