class CreateSocialProviders < ActiveRecord::Migration
  def change
    create_table :social_providers do |t|
      t.references :user, index: true
      t.integer :provider
      t.string :token
      t.string :refresh_token

      t.timestamps null: false
    end
  end
end
