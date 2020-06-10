class HomeController < ApplicationController
  def index
	@prayers = new_prayer_path
  end
end
