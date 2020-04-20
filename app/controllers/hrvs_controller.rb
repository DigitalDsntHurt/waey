class HrvsController < ApplicationController
  before_action :set_hrv, only: [:show, :edit, :update, :destroy]

  # GET /hrvs
  # GET /hrvs.json
  def index
    @todays_hrv = Hrv.where(date: Date.today)[0]
    @hrvs = Hrv.all.sort_by{|hrv| hrv.date }.reverse
  end

  # GET /hrvs/1
  # GET /hrvs/1.json
  def show
  end

  # GET /hrvs/new
  def new
    @hrv = Hrv.new
  end

  # GET /hrvs/1/edit
  def edit
  end

  # POST /hrvs
  # POST /hrvs.json
  def create
    @hrv = Hrv.new(hrv_params)

    respond_to do |format|
      if @hrv.save
        format.html { redirect_back fallback_location: :hrvs, notice: 'Hrv was successfully created.' }
        format.json { render :show, status: :created, location: @hrv }
      else
        format.html { render :new }
        format.json { render json: @hrv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hrvs/1
  # PATCH/PUT /hrvs/1.json
  def update
    respond_to do |format|
      if @hrv.update(hrv_params)
        format.html { redirect_to hrvs_path, notice: 'Hrv was successfully updated.' }
        format.json { render :show, status: :ok, location: @hrv }
      else
        format.html { render :edit }
        format.json { render json: @hrv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hrvs/1
  # DELETE /hrvs/1.json
  def destroy
    @hrv.destroy
    respond_to do |format|
      format.html { redirect_to hrvs_url, notice: 'Hrv was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hrv
      @hrv = Hrv.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hrv_params
      params.require(:hrv).permit(:date, :hrv)
    end
end
