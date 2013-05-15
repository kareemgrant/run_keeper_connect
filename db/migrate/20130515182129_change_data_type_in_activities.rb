class ChangeDataTypeInActivities < ActiveRecord::Migration
  def change
    change_column :activities, :distance, :float
    change_column :activities, :duration, :float
  end
end
