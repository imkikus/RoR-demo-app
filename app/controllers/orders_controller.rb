class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      puts "Order saved"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit_details
    order = Order.find(params[:id]).address_credit_card_details(params)
    redirect_to order_path(order)
  end

  def checkout
    order = Order.find(params[:id]).checkout
    redirect_to order_path(order)
  end

  def cancel
    order = Order.find(params[:id]).cancel
    flash[:notice] = "Order cancelled successfully!"
    redirect_to order_path(order)
  end

  private

  def order_params
    params.require(:order).permit(:status, :shipping_address)
  end
end
