class AddUuidToSocialProvider < ActiveRecord::Migration
  def change
    add_column :social_providers, :uuid, :string
  end
end
