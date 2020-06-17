class BlogsController < ApplicationController
   before_action :find_blog, only: %i[show edit update destroy upvote downvote]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(blog_params)

    if @blog.save
      redirect_to @blog
    else
      render 'new'
    end
  end

  def show
    @comments = Comment.where(blog_id: @blog)
  end

  def edit; end

  def update
    if @blog.update(blog_params)
      redirect_to @blog
    else
      render 'edit'
    end
  end

  def upvote
    @blog.upvote_by current_user
    redirect_back fallback_location: root_path
  end

  def downvote
    @blog.downvote_by current_user
    redirect_back fallback_location: root_path
  end

  def destroy
    @blog.destroy
    redirect_to root_path
  end

  private

  def find_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
