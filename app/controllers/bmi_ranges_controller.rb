class BmiRangesController < ApplicationController
  before_action :set_bmi_range, only: [:show, :edit, :update, :destroy]

  # GET /bmi_ranges
  # GET /bmi_ranges.json
  def index
    @current_page = current_page
    @search = params[:search]

    if @search.present?
      @pages = BmiRange.search(@search).pages
      @bmi_ranges = BmiRange.search(@search).page(current_page)
    else
      @pages = BmiRange.pages
      @bmi_ranges = BmiRange.page(current_page)
    end
  end

  # GET /bmi_ranges/1
  # GET /bmi_ranges/1.json
  def show
    render :edit
  end

  # GET /bmi_ranges/new
  def new
    @bmi_range = BmiRange.new
  end

  # GET /bmi_ranges/1/edit
  def edit
  end

  # POST /bmi_ranges
  # POST /bmi_ranges.json
  def create
    @bmi_range = BmiRange.new(bmi_range_params)

    respond_to do |format|
      if @bmi_range.save
        format.html { redirect_to @bmi_range, notice: 'Bmi range was successfully created.' }
        format.json { render :show, status: :created, location: @bmi_range }
      else
        format.html { render :new }
        format.json { render json: @bmi_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bmi_ranges/1
  # PATCH/PUT /bmi_ranges/1.json
  def update
    respond_to do |format|
      if @bmi_range.update(bmi_range_params)
        format.html { redirect_to @bmi_range, notice: 'Bmi range was successfully updated.' }
        format.json { render :show, status: :ok, location: @bmi_range }
      else
        format.html { render :edit }
        format.json { render json: @bmi_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bmi_ranges/1
  # DELETE /bmi_ranges/1.json
  def destroy
    @bmi_range.destroy
    respond_to do |format|
      format.html { redirect_to bmi_ranges_url, notice: 'Bmi range was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bmi_range
      @bmi_range = BmiRange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bmi_range_params
      params.require(:bmi_range).permit(:lower_limit, :upper_limit, :category, :risk)
    end
end
