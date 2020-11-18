class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @nickname = current_user.nickname
    @posts = current_user.posts.order("created_at DESC")
  end
end
