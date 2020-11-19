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
      Post.where('category_id LIKE(?)')
    else
      Post.all
    end
  end
end
