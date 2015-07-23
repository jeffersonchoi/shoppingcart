class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    item_ids = session[:cart].keys
    @items = item_ids.find_all { |item| Item.find(item) }
    @order = Order.new

  end

  def create

    @item = Item.find(params[:item_id])
    if session[:current_order_id] == nil
      order_status
      if @order.save
        @orderitem = Orderitem.new(orderitem_params)
        @orderitem.order_id = session[:current_order_id]
        @orderitem.item_id = @item.id
        @orderitem.selling_price = @item.marked_price
        @orderitem.save

        redirect_to item_path(@item)
      else
        render :new
      end

    elsif session[:current_order_id] != nil
      @orderitem = Orderitem.new(orderitem_params)
      @orderitem.order_id = session[:current_order_id]
      @orderitem.item_id = @item.id
      @orderitem.selling_price = @item.marked_price
      @orderitem.save

      redirect_to item_path(@item)

    end
  end

  def edit
    @order = Order.find(current_order)
    @orderitem = @order.orderitems
  end

  def update
    require 'pry'; binding.pry
    @order = Order.find(current_order)
      # @orderitem = @order.orderitems

      @order.orderitems.each do |orderitem|
        @orderitem = orderitem
        # @orderitem.update(orderitem_params)
      end


    if @orderitem.update(orderitem_params)
         redirect_to items_path, notice: 'Comment was successfully updated.'
    else
      render :edit

    end
   end




  def checkout
    session.delete(:current_order_id)
    redirect_to items_path
  end

private
    def order_params
      params.require(:order).permit(:total_price)
    end

    def orderitem_params
      params.require(:orderitem).permit(:selling_quantity)
    end

end
