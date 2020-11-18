class PostsController < ApplicationController
before_action :authenticate_user!
before_action :set_post, only: [:show, :edit, :update,:destroy]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless current_user == @post.user
      redirect_to root_path
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(post_params)
    else
        render :edit
    end
  end

  def destroy
    if current_user == @post.user
      @post.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :text, :category_id,:image).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
