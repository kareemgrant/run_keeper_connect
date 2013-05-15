class Activity < ActiveRecord::Base
  attr_accessible :provider, :activity_type, :activity_id, :duration, :distance, :activity_date, :user_id, :run_detail, :detail_present
  belongs_to :user

  def self.get_runs(user)
    Client::API.get_runs(token: user.access_token, user: user)
  end

  def self.get_run_detail(user, activity_id)
    Client::API.get_run_detail(token: user.access_token,
                               id: activity_id)
  end


end

