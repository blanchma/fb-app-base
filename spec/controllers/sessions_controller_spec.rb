require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "redirects" do
      get :new
      expect {response}.to redirect_to '/auth/facebook'
    end
  end

  describe "POST 'create'" do
    let(:user) { FactoryGirl.build(:user) }
    it "redirects to home" do
      UserService.stubs(:access).returns(user)
      post :create
      response.should be_redirect
    end

    it "set session user_id" do
      UserService.stubs(:access).returns(user)
      post :create
      session[:user_id].should == user.id
    end
  end

end
