class InterestCategory < ActiveRecord::Base
  has_many :user_interests, dependent: :destroy
  has_many :interests
end
