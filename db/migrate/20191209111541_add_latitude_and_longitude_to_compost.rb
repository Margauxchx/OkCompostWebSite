class AddLatitudeAndLongitudeToCompost < ActiveRecord::Migration[5.2]
  def change
    add_column :composts, :latitude, :float
    add_column :composts, :longitude, :float
  end
end
