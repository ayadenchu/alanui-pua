class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @nickname = current_user.nickname
    @posts = current_user.posts.order("created_at DESC")

    likes = Like.where(user_id: current_user.id).pluck(:post_id)  # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    @like_list = Post.find(likes) 
  end
  
end
