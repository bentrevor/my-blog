require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "Visiting site" do
  # ensures the entries database always has one entry
  before { @first_entry = FactoryGirl.create(:first_entry) }
  let(:entry) { FactoryGirl.create(:entry) }
  let(:new_entry) { FactoryGirl.create(:new_entry) }

  describe "as guest", type: :feature do
    it "should be able to read entries" do
      visit "/entries/#{entry.id}"
      expect(page).to have_selector("h2", text: entry.title)
      expect(page).to have_selector("p", text: entry.content)
    end

    it "should not be able to edit an entry" do
      expect_redirect_away_from "/entries/#{entry.id}/edit"
    end

    it "should be able to see index of all entry titles" do
      entry
      new_entry
      visit entries_path

      expect(page).to have_selector("li.no-bullet", text: entry.title)
      expect(page).to have_selector("li.no-bullet", text: new_entry.title)
      find_link(entry.title).should be_visible
      find_link(new_entry.title).should be_visible
    end

    it "should be able to follow sidebar links" do
      new_entry
      visit root_path
      click_link "Newest Entry"
      expect(current_path).to eq("/entries/#{new_entry.id}")
      click_link "About"
      expect(current_path).to eq("/about")
      click_link "Archives"
      expect(current_path).to eq("/entries")
    end

    it "should not see admin links" do
      new_entry
      visit entry_path(new_entry)
      expect(page).not_to have_selector("a.btn")
    end

    it "should not be able to visit any user page" do
      expect_redirect_away_from "/users/sign_in"
      expect_redirect_away_from "/users/sign_up"
      expect_redirect_away_from "/users/edit"
    end
  end

  describe "as admin", type: :feature do
    let(:entry){ FactoryGirl.create(:new_entry) }
    before(:each) do
      user = FactoryGirl.create(:user)
      user.add_role :admin
      # login_as(user, scope: user)
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Sign in"
    end

    # after(:each) do
    #   Warden.test_reset!
    # end

    it "should be able to read entries" do
      visit "/entries/#{entry.id}"
      expect(page).to have_selector("h2", text: entry.title)
      expect(page).to have_selector("p", text: entry.content)
    end

    it "should see admin links" do
      new_entry
      visit entry_path(new_entry)

      expect(page).to have_selector("p", text: "Signed in as")
      expect(page).to have_selector("a.btn", text: "Write new entry")
      expect(page).to have_selector("a.btn", text: "Edit this entry")
      expect(page).to have_selector("a.btn", text: "Delete this entry")
    end


    # it "should be able to edit an entry"
    # it "should be able to delete an entry"
    # it "should be able to write a new entry"

  end
end