class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true

  has_many :posts
  has_many :likes
  has_many :buds

  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end
  def budded_by?(post_id)
    buds.where(post_id: post_id).exists?
  end

end
