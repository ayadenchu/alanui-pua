class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :title
    validates :text
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end
