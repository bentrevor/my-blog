require 'spec_helper'
require 'ttt_spec_helper'

describe "Playing tic-tac-toe", type: :feature do
  before { visit '/tic-tac-toe' }

  it "should find canvas element" do
    expect(page).to have_selector("canvas#myCanvas")
  end

  describe "when computer plays first:" do
    before { }# click 'no' in menu

    it "should not lose this game", js: true do
      # Capybara.current_driver = Capybara.javascript_driver
      # play game...
      puts page.body
      assert_human_didnt_win
    end
  end

  describe "when human plays center first:" do
    it "should not lose" do
      pending
    end    
  end

  describe "when human plays non-center first:" do
    it "should not lose" do
      pending
    end
  end
end