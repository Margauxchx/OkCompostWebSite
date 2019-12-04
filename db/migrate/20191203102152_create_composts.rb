class CreateComposts < ActiveRecord::Migration[5.2]
  def change
    create_table :composts do |t|
      # N - 1 association with composters
      t.belongs_to :composter, index: true

      t.string :title
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :country
      t.text :description
      t.text :access_data
      t.string :image_url
      t.boolean :is_open
      t.integer :filling

      t.timestamps
    end
  end
end
