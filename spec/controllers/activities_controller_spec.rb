require 'spec_helper'

describe ActivitiesController do

  before do
    controller.stub(:require_current_user).and_return(true)
    @current_user = double('current user')
    controller.stub(:current_user).and_return(@current_user)
  end

  describe "GET #index" do

    before do
      @activity = double('activity')
      @current_user.stub(:activities).and_return([@activity])
    end

    it "populates an array of messages" do
      get :index
      expect(assigns(:activities)).to match_array [@activity]
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end

  end


  describe "GET #show" do

    before do
      @activity = Activity.new
      @id = double("1")
      Activity.stub(:find_by_activity_id).with("1").and_return(@activity)
      @path_data = YAML.dump({"path" => "stuff"})
    end

    it "finds the activity" do
      @activity.should_receive(:run_detail).and_return(@path_data)
      get :show, id: "1"
    end

    it "assigns requested activity to @activity" do
      @activity.stub(:run_detail).and_return(@path_data)

      get :show, id: "1"
      expect(response).to render_template :show
    end
  end

  describe "POST #fetch_runs" do
    it "successfully makes call to model and redirects" do
      Activity.should_receive(:get_runs).with(@current_user)
      post :fetch_runs
      expect(response).to redirect_to activities_path
    end
  end
end
