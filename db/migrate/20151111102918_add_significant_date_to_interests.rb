class AddSignificantDateToInterests < ActiveRecord::Migration
  def change
    add_column :interests, :significant_date, :date
    add_column :interests, :significant_names, :text
  end
end
