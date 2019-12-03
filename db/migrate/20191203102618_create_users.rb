class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :username
      t.string :email
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :country
      t.string :avatar_url
      t.boolean :is_composter

      t.timestamps
    end
  end
end
