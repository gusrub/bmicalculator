class MeasurementsController < ApplicationController
  before_action :set_measurement, only: [:show, :edit, :update, :destroy]

  # GET /measurements
  # GET /measurements.json
  def index
    @current_page = current_page
    @search = params[:search]

    if @search.present?
      @pages = current_user.measurements.order(created_at: :desc).search(@search).pages
      @measurements = current_user.measurements.order(created_at: :desc).search(@search).page(current_page)
    else
      @pages = current_user.measurements.pages
      @measurements = current_user.measurements.page(current_page).order(created_at: :desc)
    end
  end

  # GET /measurements/1
  # GET /measurements/1.json
  def show
    render :show
  end

  # POST /measurements
  # POST /measurements.json
  def create
    height = measurement_params[:height]
    weight = measurement_params[:weight]

    service = Measurements::CreateMeasurementService.new(user: current_user, weight: weight, height: height)

    respond_to do |format|
      if service.perform
        @measurement = service.output
        format.json { render :show, status: :created }
      else
        format.json { render json: service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measurements/1
  # DELETE /measurements/1.json
  def destroy
    @measurement.destroy
    respond_to do |format|
      format.html { redirect_to measurements_url, notice: 'Measurement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measurement
      @measurement = current_user.measurements.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def measurement_params
      params.permit(:height, :weight)
    end
end
