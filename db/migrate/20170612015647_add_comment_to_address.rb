class AddCommentToAddress < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :comment, :string
  end
end
