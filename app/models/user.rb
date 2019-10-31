class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JWTBlacklist
  has_many :articles, :foreign_key => :author, dependent: :destroy
  has_many :comments, :foreign_key => :commenter, dependent: :destroy
  has_many :friendships
  has_many :friends, through: :friendships, class_name: 'User'

  before_save :ensure_authentication_token

  def has_friend?(friend)
    return true if Friendship.where(friend_id: friend.id, user_id: self.id).count > 0
    return false
  end
end
