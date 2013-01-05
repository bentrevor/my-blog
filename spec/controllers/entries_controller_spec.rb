require 'spec_helper'

describe EntriesController do
  before { @entry = FactoryGirl.build(:entry) }

  describe "index action" do
    it "should return http success" do
      get :index
      response.should be_success
    end
  end

  describe "show action" do
    it "should return http success" do
      get :show, id: @entry
      response.should be_success
    end
  end

  describe "new action" do
    it "should return http success" do
      get :new
      response.should be_success
    end
  end

  describe "create action success" do
    it "should add user to database" do
      pending
    end
  end

  describe "create action failure" do
    it "should not add user to database" do
      pending
    end
  end

  describe "edit action" do
    it "should return http success" do
      get :edit, id: @entry
      response.should be_success
    end
  end

  describe "update action success" do
    it "should change attributes of entry" do
      pending
    end
  end

  describe "update action failure" do
    it "should not change attributes of entry" do
      pending
    end
  end

  describe "destroy action" do
    it "should return http success" do
      delete :destroy, id: @entry
      response.should be_success
    end
  end
end
