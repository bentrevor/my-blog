require 'spec_helper'

describe RegistrationsController, type: :controller do
  before :each do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe "new action" do
    before { get :new }
    check_user_pages_redirection
  end

  describe "create action" do
    before { post :create, user: User.new(name: "a", 
                                          email: "a@b.com",
                                          password: "pwpwpw",
                                          password_confirmation: "pwpwpw" ) }
    check_user_pages_redirection
  end
end