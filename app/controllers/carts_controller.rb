class CartsController < ApplicationController

  def show
    # binding.pry
    @cart = Cart.find(params[:id])
  end

  def checkout
    cart = Cart.find(params[:id])
    cart.checkout
    redirect_to cart_path(cart)
  end

end
