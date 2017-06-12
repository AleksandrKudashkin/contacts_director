class SimplifyContact < ActiveRecord::Migration[5.1]
  def change
    drop_table :urls
    drop_table :emails
    drop_table :addresses
    drop_table :phones
    remove_column :contacts, :birthday
    add_column :contacts, :phone_1, :string
    add_column :contacts, :phone_2, :string
    add_column :contacts, :email, :string
    add_column :contacts, :street_1, :string
    add_column :contacts, :street_2, :string
    add_column :contacts, :city, :string
    add_column :contacts, :country, :string
    add_column :contacts, :postal_code, :string
  end
end
