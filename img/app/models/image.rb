class Image < ActiveRecord::Base

  before_destroy :delete_file

  belongs_to :user 
  has_many :users, through: :image_users
  has_many :image_users, dependent: :destroy
  has_many :tags, dependent: :destroy

  def eligible_users
    users = User.all - self.users - [self.user]
  end

  private

    def delete_file
      File.delete("public/images/#{self.filename}") if File.exist?("public/images/#{self.filename}")
    end

end
