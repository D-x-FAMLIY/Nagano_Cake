class Public::ProductsController < ApplicationController
  def index
    @genres = Genre.all
    @products = Product.all
  end

  def show
    @genres = Genre.all
    @product = Product.find(params[:id])
  end

end
