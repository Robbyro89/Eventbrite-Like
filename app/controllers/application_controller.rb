class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def login_require
    if current_user.blank?
      redirect_to root_path
      flash[:danger] = "Connection pre-requise"
    end
  end
end
