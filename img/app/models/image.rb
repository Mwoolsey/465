class Image < ActiveRecord::Base

  belongs_to :user 
  has_many :users, through: :image_users
  has_many :image_users, dependent: :destroy
  has_many :tags, dependent: :destroy

  def eligible_users
    users = User.all - [self.users] - [self.user]
  end

end
