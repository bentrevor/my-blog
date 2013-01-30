require 'spec_helper'

describe "Playing tic-tac-toe", type: :feature do
  it "should find canvas element" do
    visit '/tic-tac-toe'
    expect(page).not_to have_selector("canvas#myCanvas")
  end
end