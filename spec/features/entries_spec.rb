require 'spec_helper'

describe "Entry" do
  describe "creation" do
    describe "success" do
      it "should add entry to database" do
        visit new_entry_path
        # fill_in ""
        assert true
      end
    end

    describe "failure" do
      it "should not add entry to database" do
        pending
      end
    end
  end
end
