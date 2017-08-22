class WelcomeController < ApplicationController

  skip_before_action :authenticate_user!

  def index
    @bmi_ranges = BmiRange.order(lower_limit: :asc)
  end

  def help
  end

end
