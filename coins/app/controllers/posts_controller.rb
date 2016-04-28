class PostsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @post = Post.create(post_params)
    @blog = Blog.find(params[:blog_id])
    @post.user = current_user
    @post.blog = @blog
    @post.save

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
