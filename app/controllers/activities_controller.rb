class ActivitiesController < ApplicationController

  before_filter :require_current_user

  def index
    @activities = current_user.activities
  end

  def show
    @activity = Activity.find_by_activity_id(params[:id])
    Activity.get_run_detail(current_user, params[:id]) unless @activity.run_detail

    # gon.stuff = @run_detail["path"]
    render :layout => 'map'
  end

  def fetch_runs
    Activity.get_runs(current_user)
    redirect_to activities_path
  end
end

