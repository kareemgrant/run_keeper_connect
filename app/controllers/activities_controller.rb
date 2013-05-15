class ActivitiesController < ApplicationController

  before_filter :require_current_user

  def index
    @activities = current_user.activities
  end

  def show
    # gon.stuff = @run_detail["path"]
    render :layout => 'map'
  end

  def fetch_runs
    access_token = current_user.access_token
    Client::API.get_runs(access_token, current_user)
    redirect_to activities_path
  end
end

