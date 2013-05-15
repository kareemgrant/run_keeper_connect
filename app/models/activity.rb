class Activity < ActiveRecord::Base
  attr_accessible :provider, :activity_type, :activity_id, :duration, :distance, :activity_date, :user_id
  belongs_to :user

end

