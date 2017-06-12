class AddReferencesToContact < ActiveRecord::Migration[5.1]
  def change
    add_reference :contacts, :category, foreign_key: true
  end
end
