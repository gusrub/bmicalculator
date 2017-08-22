class ApplicationController < ActionController::Base

  include ApplicationHelper

  protect_from_forgery with: :exception, prepend: true
  before_action :authenticate_user!

  protected

  def authorize
    if current_user.visitor?
      respond_to do |format|
        format.html do
          flash.alert = "Access Denied"
          redirect_to root_url
        end
        format.json do
          render json: { "Error": "Access Denied" }, status: 403
        end
      end
    end
  end
end
