class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_login


  def check_login

    if !has_logged_in_already? && (params[:controller] != "login" && params[:action] != "create")
      flash[:notice] = "Please login"
      redirect_to action: :create, controller: :login
    end
  end

  def has_logged_in_already?
    session[:jrni_login].present?
  end

  def menu

  end
end
