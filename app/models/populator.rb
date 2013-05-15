class Populator
  def self.add_activity_list(data, user)

    data["items"].each do |activity|
      next if Activity.find_by_activity_id(self.get_activity_id(activity["uri"]))

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

  def self.add_activity_detail(data)
    binding.pry
  end
end
