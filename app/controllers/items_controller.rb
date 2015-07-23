class ItemsController < ApplicationController

  def index
    @items = Item.all
    # @items_count = items_count
  end

  def show
    @item = Item.find(params[:id])
  end

end
