class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '日記' },
    { id: 3, name: '友情' },
    { id: 4, name: '恋愛' },
    { id: 5, name: '仕事' },
    { id: 6, name: '趣味' },
    { id: 7, name: '親子' },
    { id: 8, name: '夢' },
    { id: 9, name: 'その他' },
  ]
  include ActiveHash::Associations
  has_many :posts
  end