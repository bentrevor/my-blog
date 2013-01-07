require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "Guest" do
  before(:each) do
    @entry = FactoryGirl.create(:entry)
  end

  it "should be able to read entries" do
    visit "/entries/#{@entry.id}"
    expect(page).to have_selector("h2", text: @entry.title)
    expect(page).to have_selector("p", text: @entry.content)
  end

  it "should not see admin links" do
    # expect(page).not_to have_selector("h2", text: @entry.title)
    # expect(page).not_to have_selector("p", text: @entry.content)
  end

  xit "should not be able to edit an entry" do
    visit "/entries/#{@entry.id}/edit"
    1.should satisfy { false }
    # expect redirection...
  end
end

describe "Admin" do
  before(:each) do
    @entry = FactoryGirl.create(:entry)
    user = FactoryGirl.create(:user)
    user.add_role :admin
    login_as(user, scope: user)
  end

  after(:each) do
    Warden.test_reset!
  end

  it "should see admin links" do
    pending
  end

  it "should be able to read entries" do
    visit "/entries/#{@entry.id}"
    expect(page).to have_selector("h2", text: @entry.title)
    expect(page).to have_selector("p", text: @entry.content)
  end
end
