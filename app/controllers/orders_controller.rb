class OrdersController < ApplicationController


  def new
    @item = Item.find(params[:item_id])
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

  def checkout
    session.delete(:current_order_id)
    redirect_to items_path
  end

private
    def order_params
      params.require(:order).permit(:total_price)
    end

    def orderitem_params
      params.require(:orderitem).permit(:selling_quantity, :selling_price)
    end

end
