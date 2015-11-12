class SocialProvider < ActiveRecord::Base
  enum provider: [:facebook, :google_oauth2, :twitter, :linkedin]
  belongs_to :user

  def self.from_social(auth, user=nil)
    social_provider = send(auth.provider).where(uuid: auth.uid).first_or_create do |sp|
        sp.token= auth.credentials.token
        sp.refresh_token= auth.credentials.refresh_token
        sp.uuid= auth.uid
        sp.profile_picture = auth.info.image
        sp.profile_url = auth.extra.raw_info.profile
        sp.profile_email = auth.info.email
    end
    social_provider.update(user: user) if user
    social_provider
  end

  def self.email_already_in_use(email)
    where(profile_email: email).pluck(:user_id)
  end
end
