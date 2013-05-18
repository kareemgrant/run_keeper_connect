class ChangeActivityIdFromIntegerToString < ActiveRecord::Migration
  def change
    change_column :activities, :activity_id, :string
  end
end
