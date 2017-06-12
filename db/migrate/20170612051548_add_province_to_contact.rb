class AddProvinceToContact < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :province, :string
  end
end
