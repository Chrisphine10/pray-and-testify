class TestimoniesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :set_testimony, only: [:show, :edit, :update, :destroy]
  before_action :get_post
  # GET /testimonies/1
  # GET /testimonies/1.json
  def index
	@testimonies = @post.testimony
  end
  def show
	
  end

  # GET /testimonies/new
  def new
	if @post.testimony
		@testimony = @post.build_testimony
	else
		@testimony = Testimony.new
	end
  end

  # GET /testimonies/1/edit
  def edit
  end

  # POST /testimonies
  # POST /testimonies.json
  def create
	@testimony = @post.build_testimony(testimony_params)
	@testimony.user_id = current_user.id

    respond_to do |format|
      if @testimony.save
        format.html { redirect_to posts_path, notice: 'Testimony was successfully created.' }
        format.json { render :show, status: :created, location: @testimony }
      else
        format.html { render :new }
        format.json { render json: @testimony.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testimonies/1
  # PATCH/PUT /testimonies/1.json
  def update
    respond_to do |format|
      if @testimony.update(testimony_params)
        format.html { redirect_to posts_path, notice: 'Testimony was successfully updated.' }
        format.json { render :show, status: :ok, location: @testimony }
      else
        format.html { render :edit }
        format.json { render json: @testimony.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testimonies/1
  # DELETE /testimonies/1.json
  def destroy
    @testimony.destroy
    respond_to do |format|
      format.html { redirect_to post_testimonies_path(@post), notice: 'Testimony was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
	def set_testimony
	  @testimony = @post.testimony.find(params[:id])
    end
	def get_post
		@post = Post.find(params[:post_id])
	end
    # Only allow a list of trusted parameters through.
    def testimony_params
      params.require(:testimony).permit(:content, :post_id)
    end
end
