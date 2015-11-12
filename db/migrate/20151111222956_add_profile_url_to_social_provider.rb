class AddProfileUrlToSocialProvider < ActiveRecord::Migration
  def change
    add_column :social_providers, :profile_url, :string
    add_column :social_providers, :profile_picture, :string
  end
end
