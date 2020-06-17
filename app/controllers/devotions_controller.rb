class DevotionsController < ApplicationController
  before_action :set_devotion, only: [:show, :edit, :update, :destroy]

  # GET /devotions
  # GET /devotions.json
  def index
    @devotions = Devotion.all
  end

  # GET /devotions/1
  # GET /devotions/1.json
  def show
  end

  # GET /devotions/new
  def new
    @devotion = Devotion.new
  end

  # GET /devotions/1/edit
  def edit
  end

  # POST /devotions
  # POST /devotions.json
  def create
    @devotion = Devotion.new(devotion_params)

    respond_to do |format|
      if @devotion.save
        format.html { redirect_to @devotion, notice: 'Devotion was successfully created.' }
        format.json { render :show, status: :created, location: @devotion }
      else
        format.html { render :new }
        format.json { render json: @devotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devotions/1
  # PATCH/PUT /devotions/1.json
  def update
    respond_to do |format|
      if @devotion.update(devotion_params)
        format.html { redirect_to @devotion, notice: 'Devotion was successfully updated.' }
        format.json { render :show, status: :ok, location: @devotion }
      else
        format.html { render :edit }
        format.json { render json: @devotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devotions/1
  # DELETE /devotions/1.json
  def destroy
    @devotion.destroy
    respond_to do |format|
      format.html { redirect_to devotions_url, notice: 'Devotion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_devotion
      @devotion = Devotion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def devotion_params
      params.require(:devotion).permit(:verse, :title, :content)
    end
end
