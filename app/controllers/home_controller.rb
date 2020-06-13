class HomeController < ApplicationController
  def index
	@posts = new_post_path
  end
end
