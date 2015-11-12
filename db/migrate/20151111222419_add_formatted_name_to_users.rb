class AddFormattedNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :formatted_name, :string
  end
end
