class User < ActiveRecord::Base
  has_many :user_interests, dependent: :destroy
  has_many :social_providers, dependent: :destroy
  has_secure_password validations: false
  validates :email, uniqueness: true
  enum status: [:inactive, :active]
  validate :user_email_not_in_social_provider

  def self.from_omniauth(auth, user=nil)
      social_provider = SocialProvider.from_social(auth, user)
      if social_provider.user
        social_provider.user
      else
        user = create(formatted_name: auth.info.name ,first_name: auth.info.first_name, last_name: auth.info.last_name, email: auth.info.email)
        user.social_providers << social_provider
        user
      end
  end

  def is_profile_not_complete?
    password_digest.blank? || first_name.blank? || last_name.blank? || email.blank?
  end

  def user_email_not_in_social_provider
    all_users_social_providers = SocialProvider.email_already_in_use(email)
    if all_users_social_providers.any?
      errors.add(:email, "The email is already in use. If you forgot your password, you can request to change your password.")
    end
  end

end
