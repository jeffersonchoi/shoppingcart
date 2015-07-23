class CartItemsController < ApplicationController

  def add_to_cart
    session[:cart][params[:id]] ||= 0
    session[:cart][params[:id]] = session[:cart][params[:id]] += 1
    redirect_to :back
  end

  def update_item_quantity
    session[:cart][params[:id]] = params[:id]
    redirect_to :back
  end

end
