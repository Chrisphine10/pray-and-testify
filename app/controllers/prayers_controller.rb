class PrayersController < ApplicationController
  before_action :set_prayer, only: [:show, :edit, :update, :destroy]
  def index
	@prayers = Prayer.all
  end

  def new
	@prayer = Prayer.new
  end

  def create
	@prayer = prayer.new(prayer_params)

    respond_to do |format|
      if @prayer.save
        format.html { redirect_to @prayer, notice: 'prayer submitted.' }
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
		if @prayer.update(prayer_params)
		  format.html { redirect_to @prayer, notice: 'successfully update.' }
		else
		  format.html { render :edit }
		end
	  end
  end

  def destroy
	@prayer.destroy
    respond_to do |format|
      format.html { redirect_to testimonies_url, notice: 'removed successfully.' }
    end
  end
  def set_prayer
	@prayer = prayer.find(params[:id])
  end
  def prayer_params
	params.require(:prayer).permit(:title, :post, :name)
  end
end
