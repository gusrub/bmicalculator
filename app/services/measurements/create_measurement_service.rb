module Measurements
  class CreateMeasurementService
    attr_reader :errors, :messages, :output, :height, :weight, :user, :bmi_range

    def initialize(user:, weight:, height:)
      @errors = []
      @messages = []
      @output = nil

      @user = user
      @weight = weight || 0
      @height = height || 0
    end

    def perform
      @errors.clear
      @messages.clear
      @output = nil
      @bmi_range = nil

      begin
        # avoid common errors like zero division
        return false unless valid_data?
        @height = @height.to_d / 100
        @weight = @weight.to_d
        bmi = ((@weight / @height) / @height).round(2)

        # we need to make sure we have valid BMI before checking the range
        return false unless in_range? bmi

        @measurement = Measurement.new(user: @user, bmi_range: @bmi_range)

        if @measurement.valid?
          @measurement.save!
          @output = @measurement
        else
          @errors = @errors + @measurement.errors.full_messages
        end
      rescue StandardError => e
        @errors << "Generic error. Please contact support."
      end

      @errors.empty?
    end

    private

    def valid_data?
      validation_errors = []

      begin
        Float(@height)
        Float(@weight)
      rescue ArgumentError => e
        @errors << "Height and weight must be valid numbers"
        return @errors.empty?
      end

      validation_errors << "Height must be higher than 0" unless @height.to_d > 0
      validation_errors << "Weight must be higher than 0" unless @weight.to_d > 0
      @errors = @errors + validation_errors
      validation_errors.empty?
    end

    def in_range?(bmi)
      range_errors = []
      @bmi_range = BmiRange.find_by("lower_limit <= :bmi AND upper_limit >= :bmi", bmi: bmi)
      range_errors << "There is no BMI range within the boundaries of #{bmi}" unless @bmi_range.present?
      @errors = @errors + range_errors
      range_errors.empty?
    end

  end
end
