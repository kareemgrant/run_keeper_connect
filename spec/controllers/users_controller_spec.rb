require 'spec_helper'

describe UsersController do

  describe "GET #index" do

    before do
      @user = double('user')
      User.stub(:all).and_return([@user])
    end

    it "populates an array of users" do
      get :index
      expect(assigns(:users)).to match_array [@user]
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end

  end

  describe "GET #show" do

    before do
      @user = User.new
    end

    it "finds the user" do
      User.should_receive(:find).with("1").and_return(@user)
      get :show, id: "1"
    end

    it "assigns the requested user to @user" do
      User.stub(:find).with("1").and_return(@user)
      get :show, id: "1"
      expect(response).to render_template :show
    end

  end

end
