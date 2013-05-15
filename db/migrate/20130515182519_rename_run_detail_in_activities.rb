class RenameRunDetailInActivities < ActiveRecord::Migration
  def change
    rename_column :activities, :run_detail, :detail_present
  end
end
