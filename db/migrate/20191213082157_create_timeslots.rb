class CreateTimeslots < ActiveRecord::Migration[5.2]
  def change
    create_table :timeslots do |t|
      # N - 1 association with compost
      t.belongs_to :compost, index: true
      t.integer :weekday
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
