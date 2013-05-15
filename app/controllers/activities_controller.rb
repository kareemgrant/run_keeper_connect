class ActivitiesController < ApplicationController
  respond_to :html, :json, :xml

  before_filter :require_current_user

  def index
    @activities = current_user.activities
    respond_with(@activities)
  end

  def show
    @activity = Activity.find_by_activity_id(params[:id])
    Activity.get_run_detail(current_user, params[:id]) unless @activity.detail_present

    if @activity.detail_present
      path = YAML.load(@activity.run_detail)
      gon.stuff = path
      render :layout => 'map'
    end
  end

  def fetch_runs
    Activity.get_runs(current_user)
    redirect_to activities_path
  end
end

