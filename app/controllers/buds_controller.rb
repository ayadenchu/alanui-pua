class BudsController < ApplicationController
  before_action :set_post

  def create
    
    like = Bud.new(user_id: current_user.id, post_id: params[:post_id])
    like.save
      redirect_to posts_path
  end

  def destroy
    like = Bud.find_by(user_id: current_user.id, post_id: params[:id]).destroy
    redirect_to posts_path
  end

  private
  
  def set_post
    @post = Post.find(params[:post_id])
  end
end
