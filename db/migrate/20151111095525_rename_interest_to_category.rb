class RenameInterestToCategory < ActiveRecord::Migration
  def change
    rename_table :interests, :interest_categories
  end
end
