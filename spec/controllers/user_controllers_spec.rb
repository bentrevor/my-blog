require 'spec_helper'

describe SessionsController do
  before { request.env['devise.mapping'] = Devise.mappings[:user] }

  describe "new action" do
    before { get :new }
    check_user_pages_redirection
  end
end

describe RegistrationsController, type: :controller do
  before :each do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe "new action" do
    before { get :new }
    check_user_pages_redirection
  end

  describe "cancel action" do
    before { get :cancel }
    check_user_pages_redirection
  end
end