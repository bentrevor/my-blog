require 'spec_helper'
require 'ttt_spec_helper'

describe "Playing tic-tac-toe", type: :feature do
  it "should find canvas element" do
    visit '/tic-tac-toe'
    expect(page).to have_selector("canvas#myCanvas")
  end

  describe "when computer plays first:" do
    it "should not lose this game" do
      # play game...
      assert_human_didnt_win
    end
  end
end