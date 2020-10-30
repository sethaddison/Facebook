class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = current_user.posts.new
    @posts = Post.where(user_id: current_user.friends).or(Post.where(user_id: current_user)).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "Your post was created"
    else
      render :new, alert: "Your post was not created"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_back fallback_location: posts_path, notice: "Your post was updated"
    else
      render :edit, notice: "Something went wrong. Please try again."
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "Your post was deleted"
  end

  def like
    @post = Post.find(params[:id])
    @post.likers << current_user
    redirect_back fallback_location: posts_path
  end

  def unlike
    @post = Post.find(params[:id])
    @post.likers.delete(current_user)
    redirect_back fallback_location: posts_path
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
