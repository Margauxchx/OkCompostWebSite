class AddSearchModeToResults < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :search_mode, :integer, default: 0
  end
end
