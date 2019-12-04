class CreateContributions < ActiveRecord::Migration[5.2]
  def change
    create_table :contributions do |t|
      # N - 1 association with contributors
      t.belongs_to :contributor, index: true
      # N - 1 association with composts
      t.belongs_to :supplied_compost, index:true

      t.datetime :contribution_date

      t.timestamps
    end
  end
end
