class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@blog = Blog.find(params[:blog_id])
		@comment = Comment.create(params[:comment].permit(:content))
		@comment.user_id = current_user.id
		@comment.blog_id = @blog.id

		if @comment.save
		redirect_to blog_path(@blog)
		else
		render 'new'
		end
	end
end
