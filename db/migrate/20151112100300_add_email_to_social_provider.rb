class AddEmailToSocialProvider < ActiveRecord::Migration
  def change
    add_column :social_providers, :profile_email, :string
  end
end
