require 'spec_helper'

describe EntriesController do
  before { @entry = FactoryGirl.create(:entry) }

  describe "index action" do
    it "should return http success" do
      get :index
      response.should be_success
    end

    it "should show a list of entry titles" do
      pending "test for index action"
    end
  end

  describe "show action" do
    it "should return http success" do
      get :show, id: @entry
      response.should be_success
    end

    it "should show the correct entry title" do
      pending "test for show action"
    end

    it "should show the correct entry content" do
      pending "test for show action"
    end

    it "should have a link to the previous entry" do
      pending "test for show action"
    end

    describe "'next entry' link" do
      it "should link to the next entry" do
        pending "test for show action"
      end

      it "should be disabled if current entry is the newest entry" do
        pending "test for show action"
      end
    end
  end
#
  describe "new action" do
    it "should return http success" do
      get :new
      response.should be_success
    end
  end

  describe "create action" do
    it "should return http success" do
      get :create
      response.should be_success
    end
  end

  describe "edit action" do
    it "should return http success" do
      get :edit, id: @entry
      response.should be_success
    end
  end

  describe "update action" do
    it "should return http success" do
      put :update, id: @entry
      response.should be_success
    end
  end

  describe "destroy action" do
    it "should return http success" do
      delete :destroy, id: @entry
      response.should be_success
    end
  end

end
