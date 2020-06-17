class HomeController < ApplicationController
  def index
	@post = Post.new
	@posts = Post.all.order("created_at DESC").limit(5)
	@devotions = Devotion.all.order("created_at DESC")
	@blogs = Blog.all.order("created_at DESC")
  end
end
