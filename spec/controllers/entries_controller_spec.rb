require 'spec_helper'

describe EntriesController do
  before { @entry = FactoryGirl.create(:entry) }

  describe "index action" do
    before { 2.times { FactoryGirl.create(:new_entry) } }
    before { get :index }

    it "should return http success and render index view" do
      response.should be_success
      response.should render_template :index
    end

    it "should create @entries array" do
      assigns(:entries).should eq([Entry.find(1), Entry.find(2), Entry.find(3)])
      assigns(:entries).length.should eq(Entry.count)
    end
  end

  describe "show action" do
    before { get :show, id: @entry }

    it "should return http success and render show view" do
      response.should be_success
      response.should render_template :show
    end

    it "should assign @entry based on params" do
      assigns(:entry).should eq(@entry)

      new_entry = FactoryGirl.create(:new_entry)
      get :show, id: new_entry
      assigns(:entry).should eq(new_entry)
    end
  end

  describe "new action" do
    before { get :new }

    it "should return http success" do
      response.should be_success
    end

    it "should assign @entry to a new record" do
      assigns(:entry).should be_new_record
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
        expect { post :create, Entry.new(title: "test for blank content")
                                          }.not_to change { Entry.count }

        expect { post :create, Entry.new(content: "test for blank title") 
                                          }.not_to change { Entry.count }
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
    before { @attrs = FactoryGirl.attributes_for(:new_entry) }

    describe "with valid attributes" do
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

    describe "with invalid attributes" do
      before { put :update, id: @entry, entry: { title: "", content: "" } }

      it "should not modify the entry" do
        @entry.reload
        @entry.title.should eq("factory entry title")
        @entry.content.should eq("factory entry content")
      end

      it "should re-render the edit method" do
        response.response_code.should eq(200)
        response.should render_template :edit
      end
    end
  end

  describe "destroy action" do
    it "should remove the entry from the database" do
      expect { 
        delete :destroy, id: @entry 
      }.to change { Entry.count }.by(-1)
    end

    it "should redirect to index" do
      delete :destroy, id: @entry
      response.should redirect_to entries_url
    end
  end
end
