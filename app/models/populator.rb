class Populator
  def self.add_activity_list(data, user)

    data["items"].each do |activity|
      next if find_activity(get_activity_id(activity["uri"]))

      Activity.create!(activity_type: activity["type"],
                       duration: activity["duration"],
                       distance: activity["total_distance"],
                       activity_date: activity["start_time"],
                       activity_id: self.get_activity_id(activity["uri"]),
                       provider: activity["source"],
                       user_id:  user)
    end
  end


  def self.get_activity_id(uri)
    uri.split("/")[-1]
  end

  def self.find_activity(id)
    Activity.find_by_activity_id(id)
  end

  def self.add_activity_detail(data, activity_id)
    activity = find_activity(activity_id)
    activity.update_attributes(run_detail: data["path"], detail_present: true)
    activity
  end
end
