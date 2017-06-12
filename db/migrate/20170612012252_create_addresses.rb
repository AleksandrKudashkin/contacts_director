class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :province
      t.string :country
      t.string :postal_code
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
