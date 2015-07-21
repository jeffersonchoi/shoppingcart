class OrdersController < ApplicationController


  def new
    @item = Item.find(params[:item_id])
    @order = Order.new

  end

  def create

    @item = Item.find(params[:item_id])
    @order = Order.new
    @order.user_id = current_user.id

    if @order.save
      @orderitem = Orderitem.new(orderitem_params)
      @orderitem.order_id = @order.id
      @orderitem.item_id = @item.id
      @orderitem.selling_price = @item.marked_price
      @orderitem.save

      redirect_to item_path(@item)
    else
      render :new
    end




  end



private
    def order_params
      params.require(:order).permit(:total_price)
    end

    def orderitem_params
      params.require(:orderitem).permit(:selling_quantity, :selling_price)
    end

end
