require 'spec_helper'

describe Entry do
  before { @entry = FactoryGirl.create(:entry) }
  subject { @entry }

  it { should respond_to :title }
  it { should respond_to :content }

  it { should be_valid }

  describe "with blank title" do
    before { @entry.title = "" }

    it "should not be valid" do
      @entry.should_not be_valid
    end
  end

  describe "with blank content" do
    before { @entry.content = "" }

    it "should not be valid" do
      @entry.should_not be_valid
    end
  end

end
