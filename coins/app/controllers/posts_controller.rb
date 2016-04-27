class PostsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @user = current_user
    @blog = @user.blogs.find(params[:blog_id])
    @post = @blog.posts.create(post_params)
    @post.user = @user


    redirect_to blog_path(@blog)
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.find(params[:id])
    @post.destroy
    redirect_to blog_path(@blog)
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
