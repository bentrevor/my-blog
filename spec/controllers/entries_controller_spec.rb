require 'spec_helper'

describe EntriesController do
  render_views

  before { @entry = FactoryGirl.create(:entry) }

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

  describe "create action" do
    describe "with valid attributes" do
      before { @attrs = FactoryGirl.attributes_for(:new_entry) }

      it "should add entry to database" do
        expect { 
          post :create, entry: @attrs 
        }.to change { Entry.count }.by(1)
      end

      it "should redirect to that entry's show page" do
        post :create, entry: @attrs
        response.should redirect_to Entry.last
      end
    end

    describe "with invalid attributes" do
      it "should not add entry to database" do
        expect { post :create }.not_to change { Entry.count }
        expect { post :create, Entry.new(title: "test for blank content") }.not_to change { Entry.count }
        expect { post :create, Entry.new(content: "test for blank title") }.not_to change { Entry.count }
      end

      it "should re-render the new action" do
        post :create, entry: Entry.new
        response.should render_template :new
      end
    end
  end

  describe "edit action" do
    it "should return http success" do
      get :edit, id: @entry
      response.should be_success
    end
  end

  describe "update action" do
    before { @attrs = FactoryGirl.attributes_for(:entry, title: "new title", content: "new content") }

    describe "success" do
      before { put :update, id: @entry, entry: @attrs }

      it "should locate the correct entry" do
        assigns(:entry).should eq(@entry)
      end

      it "should change attributes of entry" do
        @entry.reload
        @entry.title.should eq("new title")
        @entry.content.should eq("new content")
      end

      it "should redirect to updated entry" do
        response.should redirect_to @entry
      end
    end

    describe "failure" do
      it "should not change attributes of entry" do
        expect { put :update, id: @entry, entry: { title: "", content: "" } }.not_to change { @entry.title }
        expect { put :update, id: @entry, entry: { title: "", content: "" } }.not_to change { @entry.content }
      end

      it "should re-render the edit method" do
        put :update, id: @entry, entry: { title: "", content: "" }
        response.response_code.should eq(200)
        response.should render_template :edit
      end
    end
  end

  describe "destroy action" do
    it "should return http success" do
      delete :destroy, id: @entry
      response.should be_success
    end
  end
end
