class CreateResultLines < ActiveRecord::Migration[5.2]
  def change
    create_table :result_lines do |t|
      t.integer :rank, default: 0
      # N - 1 association with results
      t.belongs_to :result
      # N - 1 association with composts
      t.belongs_to :compost

      t.timestamps
    end
  end
end
