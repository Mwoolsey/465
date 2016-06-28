class Image < ActiveRecord::Base

  has_many :users, through: :image_users
  has_many :image_users, dependent: :destroy
  has_many :tags, dependent: :destroy

end
