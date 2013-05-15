class AddRunDetailToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :run_detail, :boolean, :default => false
  end
end
