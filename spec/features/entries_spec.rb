require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "Visiting site" do
  describe "as guest", type: :feature do
    let(:entry){ FactoryGirl.create(:new_entry) }

    it "should be able to read entries" do
      visit "/entries/#{entry.id}"
      expect(page).to have_selector("h2", text: entry.title)
      expect(page).to have_selector("p", text: entry.content)
    end

    it "should not be able to edit an entry" do
      visit "/entries/#{entry.id}/edit"
      pending
      # expect redirection...
    end

    it "should not see admin links"
    it "should be able to see index of all entry titles"
    it "should not be able to write a new entry"
    it "should not be able to visit any user page"

  end

  describe "as admin", type: :feature do
    let(:entry){ FactoryGirl.create(:new_entry) }
    before(:each) do
      user = FactoryGirl.create(:user)
      user.add_role :admin
      login_as(user, scope: user)
    end

    after(:each) do
      Warden.test_reset!
    end

    it "should be able to read entries" do
      visit "/entries/#{entry.id}"
      expect(page).to have_selector("h2", text: entry.title)
      expect(page).to have_selector("p", text: entry.content)
    end

    it "should see admin links"
    it "should be able to edit an entry"
    it "should be able to delete an entry"
    it "should be able to write a new entry"

  end
end