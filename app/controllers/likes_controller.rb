class LikesController < ApplicationController
  before_action :set_post

  def create
    like = Like.new(user_id: current_user.id, post_id: params[:post_id])
    like.save
    redirect_to post_path(params[:post_id])
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, post_id: params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private
  
  def set_post
    @post = Post.find(params[:post_id])
  end

end
