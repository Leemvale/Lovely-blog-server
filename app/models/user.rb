class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles, :foreign_key => :author, dependent: :destroy
  has_many :comments, :foreign_key => :commenter, dependent: :destroy
  has_many :friendships
  has_many :friends, through: :friendships, class_name: 'User'
end
