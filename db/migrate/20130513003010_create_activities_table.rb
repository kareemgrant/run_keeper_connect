class CreateActivitiesTable < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string    :type
      t.string    :provider
      t.integer   :duration
      t.integer   :distance
      t.datetime  :activity_date
      t.timestamps
    end
  end
end
