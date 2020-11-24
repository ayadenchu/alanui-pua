class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  has_many :likes
  has_many :buds
  has_one_attached :image

  with_options presence: true do
    validates :title,length:{maximum:18}
    validates :text
    validates :category_id,numericality: { other_than: 1 } 
  end
end
