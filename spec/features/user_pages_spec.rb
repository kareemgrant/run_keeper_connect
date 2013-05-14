require 'spec_helper'
require 'capybara/rspec'

feature "Runkeeper registration" do

  background do
    visit root_path
  end

  scenario "user signs in with valid Runkeeper credentials" do
    expect(page).to have_link("Sign in with Runkeeper", href: "/auth/runkeeper")
    mock_auth_hash
    click_link "Sign in with Runkeeper"
    expect(page).to have_content "mockuser"
    expect(page).to have_link("Sign out", href: signout_path)
  end

  scenario "user signs in with invalid Runkeeper credentials" do
    pending
    OmniAuth.config.mock_auth[:runkeeper] = :invalid_credentials
    mock_auth_hash
    expect(page).to have_link("Sign in with Runkeeper", href: "/auth/runkeeper")
    click_link "Sign in with Runkeeper"
    expect(page).to have_content('Authentication failed')
  end
end
