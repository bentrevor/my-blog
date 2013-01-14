require 'spec_helper'

describe "Visiting site", type: :feature do
  before { @first_entry = FactoryGirl.create(:first_entry) }
  let(:entry) { FactoryGirl.create(:entry) }
  let(:new_entry) { FactoryGirl.create(:new_entry) }

  describe "as guest" do
    it "should be able to read entries" do
      visit "/entries/#{entry.id}"
      expect(page).to have_selector("h2", text: entry.title)
      expect(page).to have_selector("p", text: entry.content)
    end

    it "should not be able to edit an entry" do
      expect_redirect_away_from "/entries/#{entry.id}/edit"
    end

    it "should be able to see index of all entry titles" do
      new_entry = FactoryGirl.create(:new_entry)
      visit entries_path

      find_link(@first_entry.title).should be_visible
      find_link(new_entry.title).should be_visible
    end

    it "should be able to follow sidebar links" do
      new_entry
      visit root_path
      click_on "Newest Entry"
      expect(current_path).to eq("/entries/#{new_entry.id}")
      click_on "About"
      expect(current_path).to eq("/about")
      click_on "Archives"
      expect(current_path).to eq("/entries")
    end

    it "should not see admin links" do
      visit entry_path(new_entry)
      expect(page).not_to have_selector("a.btn")
    end

    it "should not be able to visit any user page" do
      expect_redirect_away_from "/users/sign_up"
      expect_redirect_away_from "/users/edit"
    end
  end

  describe "as admin" do
    let(:entry){ FactoryGirl.create(:entry) }
    before(:each) do
      user = FactoryGirl.create(:user)
      user.add_role :admin
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on "Sign in"
    end

    it "should be able to read entries" do
      visit "/entries/#{entry.id}"
      expect(page).to have_selector("h2", text: entry.title)
      expect(page).to have_selector("p", text: entry.content)
    end

    it "should see admin links" do
      visit entry_path(new_entry)

      expect(page).to have_selector("p", text: "Signed in as")
      expect(page).to have_selector("a.btn", text: "Write new entry")
      expect(page).to have_selector("a.btn", text: "Edit this entry")
      expect(page).to have_selector("a.btn", text: "Delete this entry")
    end

    it "should be able to edit an entry" do
      edited_title = "edited title"
      edited_content = "edited content"

      visit entry_path(@first_entry)
      click_on "Edit this entry"
      fill_in "Title", with: edited_title
      fill_in "Content", with: edited_content
      click_on "Update Entry"

      expect(page).to have_selector("h2", text: edited_title)
      expect(page).to have_selector("p", text: edited_content)
    end

    it "should be able to delete an entry" do
      visit entry_path(entry)
      expect { click_on "Delete this entry" }.to change { Entry.count }.by(-1)
    end

    it "should be able to write a new entry" do
      click_on "Write new entry"
      fill_in "Title", with: "bubbles"
      fill_in "Content", with: "bubbles"
      expect { click_on "Create Entry" }.to change { Entry.count }.by(1)
    end
  end
end