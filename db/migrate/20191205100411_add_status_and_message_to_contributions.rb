class AddStatusAndMessageToContributions < ActiveRecord::Migration[5.2]
  def change
    change_table :contributions do |t|
      t.text :message 
      t.integer :status
    end 
  end
end
