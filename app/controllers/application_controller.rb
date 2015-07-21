class ApplicationController < ActionController::Base
  before_filter :initialize_orderitem

  def initialize_orderitem
    @orderitem = Orderitem.new
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
