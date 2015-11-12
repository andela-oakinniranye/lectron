class CreateInterestCategories < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :title
      t.text :description
      t.integer :user_interests_count, default: 0, null: false

      t.timestamps null: false
    end
  end
end
