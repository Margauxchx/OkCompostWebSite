class AddDefaultValueToCompostFilling < ActiveRecord::Migration[5.2]
  def up
    change_column :composts, :filling, :integer, default: 0
  end
  
  def down
    change_column :composts, :filling, :integer, default: nil
  end
end
