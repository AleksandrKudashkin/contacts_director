class SimplifyUsersMore < ActiveRecord::Migration[5.1]
  def change
    remove_column :contacts, :phone_1
    remove_column :contacts, :phone_2
    remove_column :contacts, :street_1
    remove_column :contacts, :street_2
    remove_column :contacts, :city
    remove_column :contacts, :country
    remove_column :contacts, :province
    remove_column :contacts, :postal_code
    remove_column :contacts, :notes
    remove_column :contacts, :company
  end
end
