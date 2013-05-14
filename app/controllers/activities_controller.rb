class ActivitiesController < ApplicationController

  before_filter :require_current_user

  def index
    access_token = current_user.access_token
    user = Runkeeper::User.new(access_token)
    @profile = user.profile.body.to_hash
    @feed = user.fitness_activities_feed.body.to_hash
  end

  def show
    access_token = current_user.access_token
    user = Runkeeper::User.new(access_token)
    @run_detail = user.fitness_activities(id: params[:id]).body.to_hash
    gon.stuff = @run_detail["path"]
    render :layout => 'map'
  end
end

