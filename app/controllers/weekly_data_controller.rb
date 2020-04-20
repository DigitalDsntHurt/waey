class WeeklyDataController < ApplicationController
  before_action :set_weekly_datum, only: [:show, :edit, :update, :destroy]

  # GET /weekly_data
  # GET /weekly_data.json
  def index
    WeeklyDatum.update_totals
    @weekly_data = WeeklyDatum.all.reverse
  end

  # GET /weekly_data/1
  # GET /weekly_data/1.json
  def show
  end

  # GET /weekly_data/new
  def new
    @weekly_datum = WeeklyDatum.new
  end

  # GET /weekly_data/1/edit
  def edit
  end

  # POST /weekly_data
  # POST /weekly_data.json
  def create
    @weekly_datum = WeeklyDatum.new(weekly_datum_params)

    respond_to do |format|
      if @weekly_datum.save
        format.html { redirect_to @weekly_datum, notice: 'Weekly datum was successfully created.' }
        format.json { render :show, status: :created, location: @weekly_datum }
      else
        format.html { render :new }
        format.json { render json: @weekly_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weekly_data/1
  # PATCH/PUT /weekly_data/1.json
  def update
    respond_to do |format|
      if @weekly_datum.update(weekly_datum_params)
        format.html { redirect_to @weekly_datum, notice: 'Weekly datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @weekly_datum }
      else
        format.html { render :edit }
        format.json { render json: @weekly_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weekly_data/1
  # DELETE /weekly_data/1.json
  def destroy
    @weekly_datum.destroy
    respond_to do |format|
      format.html { redirect_to weekly_data_url, notice: 'Weekly datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weekly_datum
      @weekly_datum = WeeklyDatum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def weekly_datum_params
      params.require(:weekly_datum).permit(:week_of, :meditation_days, :journal_days, :winning_consumption_days, :no_alcohol_days, :exercise_days, :total_sleep_hours, :shower_days, :am_brush_days, :pm_brush_days)
    end
end
