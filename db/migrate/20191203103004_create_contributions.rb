class CreateContributions < ActiveRecord::Migration[5.2]
  def change
    create_table :contributions do |t|
      t.datetime :contribution_date

      t.timestamps
    end
  end
end
