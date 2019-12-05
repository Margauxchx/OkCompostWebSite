class CreateResultLines < ActiveRecord::Migration[5.2]
  def change
    create_table :result_lines do |t|
      t.integer :rank

      t.timestamps
    end
  end
end
