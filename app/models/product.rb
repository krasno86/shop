class Product < ApplicationRecord
  belongs_to :user
  mount_uploader :avatar, AvatarUploader

  validates :description, presence: true, length: { minimum: 10,
                                                    too_short: '%{count} characters is the minimum allowed',
                                                    maximum: 5000,
                                                    too_long: '%{count} characters is the maximum allowed'}

end
