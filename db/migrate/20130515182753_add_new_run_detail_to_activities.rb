class AddNewRunDetailToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :run_detail, :text
  end
end
