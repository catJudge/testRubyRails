class BlogsController < ApplicationController

  before_filter :authenticate_user!, except: [:show, :index]
  before_filter :find_user, except:[ :index, :new , :create]

  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = current_user.blogs.create(blog_params)

    if @blog.save
      redirect_to @blog
    else
      render 'new'
    end
  end

  def update

    if @blog.update(blog_params)
      redirect_to @blog
    else
      render 'edit'
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :text)
  end

  def find_user
    @blog = Blog.find(params[:id])
  end
end
