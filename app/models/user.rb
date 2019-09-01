class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles, :foreign_key => :author, dependent: :destroy
  has_many :comments, :foreign_key => :commenter, dependent: :destroy
  has_many :friendships
  has_many :friends, through: :friendships, class_name: 'User'

  def has_friend?(friend)
    return true if Friendship.where(friend_id: friend.id, user_id: self.id).count > 0
    return false
  end
end
