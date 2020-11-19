class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :title,length:{maximum:18}
    validates :text
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  def self.search(search)
    if search != ""
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
