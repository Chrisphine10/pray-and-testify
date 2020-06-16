class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: %i[create edit update destroy]
	def index
	  @posts = Post.all.order("created_at DESC")
	  @testimony = Testimony.where(post_id: @post)
	  
	end
  
	def new
	  @post = Post.new
	end
  
	def create
	  @post = Post.new(post_params)
	  @post.user_id = current_user.id
  
	  respond_to do |format|
		if @post.save
		  format.html { redirect_to @post, notice: 'post submitted.' }
		else
		  format.html { render :new }
		end
	  end
	end
	def show
	 
	end
	def edit
	  
	end
  
	def update
	  respond_to do |format|
		  if @post.update(post_params)
			format.html { redirect_to @post, notice: 'successfully update.' }
		  else
			format.html { render :edit }
		  end
		end
	end
  
	def destroy
	  @post.destroy
	  respond_to do |format|
		format.html { redirect_to @post, notice: 'removed successfully.' }
	  end
	end
	private
	def set_post
	  @post = Post.find(params[:id])
	end
	def post_params
	  params.require(:post).permit(:title, :content)
	end
end
