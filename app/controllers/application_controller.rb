class ApplicationController < ActionController::Base
  before_filter :initialize_orderitem

  helper_method :current_user, :items_count

  def initialize_orderitem
    @orderitem = Orderitem.new
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_order
    @current_order ||= Order.find_by(id: session[:current_order_id])
  end

  def load_cart
    @cart ||= session[:cart]
  end


  def items_count
    @items_count = session[:cart].values.sum
  end

  before_action :load_cart

  def order_status
    @order = Order.new
    @order.user_id = current_user.id
    @order.status = 1
    @order.save
    session[:current_order_id] = @order.id
    return session[:current_order_id]
  end


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
