class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      # N -1 association with users
      t.belongs_to :user            
      
      t.string :district, default: ''
      t.string :composition, array: true, default: []

      t.timestamps
    end
  end
end
